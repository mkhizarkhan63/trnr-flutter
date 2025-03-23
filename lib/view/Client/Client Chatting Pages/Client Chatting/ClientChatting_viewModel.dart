import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:stacked/stacked.dart';

import '../../../../app/app.locator.dart';
import '../../../../cache/MySharedPreferences.dart';
import '../../../../customServices/ChatMessage.dart';
import '../../../../firebase/MyFirebaseDatabase.dart';
import '../../../../models/RegistrationResponse.dart';
import '../../../../models/chats/ChatMessageModel.dart';

class ClientChattingViewModel extends BaseViewModel {
  var msgController = TextEditingController();
  FilePickerResult? result;
  String fileName = "No file selected";
  final chatDetails = locator<ChatUser>();

  final List<ChatMessageModel> messagesList = [];
  RegistrationData? userData;

  // for audio

  AudioRecorder? _audioRecorder;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isRecording = false;
  bool _isPlaying = false;
  bool _isUploading = false;
  String _filePath = ".//";
  final _storage = FirebaseStorage.instance;

  bool get isRecording => _isRecording;

  bool get isPlaying => _isPlaying;

  bool get isUploading => _isUploading;

  String get filePath => _filePath;

  // for audio
  //

  Future<void> sendChatMessage() async {
    final message = msgController.text;

    final chatModel = ChatMessageModel(
        senderId: userData?.clientId?.toString(),
        senderProfileImage: userData?.profileImage ?? "",
        message: message,
        mediaUrl: "",
        type: "text",
        createdBy: DateTime.now().toString());

    MyFirebaseDatabase.sendChatToGeneralTrainer(
        chatDetails.selectedTrainer?.id ?? 0, chatModel);
  }

  Future<void> startRecording() async {
    _audioRecorder = AudioRecorder();
    Directory directoryT = await getApplicationDocumentsDirectory();

    String pathString =
        "${directoryT.absolute.path}/${(DateTime.now().millisecond).toString()}.mp3";
    try {
      print("START RECODING+++++");
      if (await _audioRecorder?.hasPermission() == true) {
        print(pathString);
        await _audioRecorder?.start(const RecordConfig(), path: pathString);

        _isRecording = true;
        rebuildUi();
      }
    } catch (e, stackTrace) {
      print(
          "START RECODING+++++++++++++++++++++${e}++++++++++${stackTrace}+++++++++++++++++");
    }
  }

  Future<void> stopRecording() async {
    try {
      print("STOP RECODING+++++");
      if (_isRecording) {
        _filePath = (await _audioRecorder?.stop())!;
        _isRecording = false;
        rebuildUi();

        final userData = await MySharedPreferences.getUser();
        final String filePath =
            "users/${userData?.clientId ?? 0}/chatAudios/$_filePath";
        final ref = _storage.ref().child(filePath);
        await ref.putFile(File(_filePath));
        final audioUrl = await ref.getDownloadURL();

        print("firebase audioUrl: $audioUrl");

        final chatModel = ChatMessageModel(
            senderId: userData?.clientId?.toString(),
            senderProfileImage: userData?.profileImage ?? "",
            message: "",
            mediaUrl: audioUrl,
            type: "audio",
            createdBy: DateTime.now().toString());

        MyFirebaseDatabase.sendChatToGeneralTrainer(
            chatDetails.selectedTrainer?.id ?? 0, chatModel);
      }
    } catch (e) {
      print(
          "STOP RECODING+++++++++++++++++++++${e}+++++++++++++++++++++++++++");
    }
  }

  Future<void> uploadImage(FilePickerResult result) async {
    try {
      final userData = await MySharedPreferences.getUser();
      final file = File(result.files.first.path ?? "");
      final String filePath =
          "users/${userData?.clientId}/chatImages/${result.files.first.name}";
      final ref = _storage.ref().child(filePath);
      await ref.putFile(file);
      final imageUrl = await ref.getDownloadURL();
      print("firebase imageUrl: $imageUrl");

      final chatModel = ChatMessageModel(
          senderId: userData?.clientId?.toString(),
          senderProfileImage: userData?.profileImage ?? "",
          message: "",
          mediaUrl: imageUrl,
          type: "image",
          createdBy: DateTime.now().toString());

      MyFirebaseDatabase.sendChatToGeneralTrainer(
          chatDetails.selectedTrainer?.id ?? 0, chatModel);
    } catch (e) {
      print("firebase storage error: $e");
    }
  }

  record() async {
    startRecording();

    rebuildUi();
  }

  Future<void> getUserData() async {
    userData = await MySharedPreferences.getUser();
    rebuildUi();
  }

  Future<void> getGeneralChatMessages() async {
    final messages = MyFirebaseDatabase.getGeneralChatMessages(
        chatDetails.selectedTrainer?.id ?? 0, userData?.clientId ?? 0);
    messages.listen((event) {
      messagesList.clear();

      for (var messages in event.snapshot.children) {
        final message = ChatMessageModel.fromJson(messages.value);
        messagesList.add(message);
        print("trainer k messages client ko $message");
      }

      print("client -> trainer messages event: ${event.snapshot.value}");

      rebuildUi();
    });
  }

  @override
  void dispose() {
    _audioRecorder?.dispose();
    _audioRecorder = null;
    super.dispose();
  }
}
