import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/firebase/MyFirebaseDatabase.dart';
import 'package:trainr/models/RegistrationResponse.dart';
import 'package:trainr/models/chats/ChatMessageModel.dart';

import '../../../app/app.locator.dart';
import '../../../customServices/ChatMessage.dart';

class TChatViewModel extends BaseViewModel {
  final msgController = TextEditingController();
  final chatDetails = locator<ChatUser>();

  FilePickerResult? result;
  String fileName = "No file selected";

  AudioRecorder? _audioRecorder;
  bool _isRecording = false;
  String _filePath = ".//";
  final _storage = FirebaseStorage.instance;

  final List<ChatMessageModel> messagesList = [];
  RegistrationData? userData;

  bool get isRecording => _isRecording;

  Future<void> sendChatMessage() async {
    final message = msgController.text;

    final chatModel = ChatMessageModel(
        senderId: userData?.trainerId?.toString(),
        senderProfileImage: userData?.profileImage ?? "",
        message: message,
        mediaUrl: "",
        type: "text",
        createdBy: DateTime.now().toString());

    MyFirebaseDatabase.sendChatToGeneralClient(
        chatDetails.selectedClient?.clientId ?? 0, chatModel);
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
            "users/${userData?.trainerId ?? 0}/chatAudios/$_filePath";
        final ref = _storage.ref().child(filePath);
        await ref.putFile(File(_filePath));
        final audioUrl = await ref.getDownloadURL();

        print("firebase audioUrl: $audioUrl");

        final chatModel = ChatMessageModel(
            senderId: userData?.trainerId?.toString(),
            senderProfileImage: userData?.profileImage ?? "",
            message: "",
            mediaUrl: audioUrl,
            type: "audio",
            createdBy: DateTime.now().toString());

        MyFirebaseDatabase.sendChatToGeneralClient(
            chatDetails.selectedClient?.clientId ?? 0, chatModel);
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
          "users/${userData?.trainerId}/chatImages/${result.files.first.name}";
      final ref = _storage.ref().child(filePath);
      await ref.putFile(file);
      final imageUrl = await ref.getDownloadURL();
      print("firebase imageUrl: $imageUrl");

      final chatModel = ChatMessageModel(
          senderId: userData?.trainerId?.toString(),
          senderProfileImage: userData?.profileImage ?? "",
          message: "",
          mediaUrl: imageUrl,
          type: "image",
          createdBy: DateTime.now().toString());

      MyFirebaseDatabase.sendChatToGeneralClient(
          chatDetails.selectedClient?.clientId ?? 0, chatModel);
    } catch (e) {
      print("firebase storage error: $e");
    }
  }

  Future<void> getUserData() async {
    userData = await MySharedPreferences.getUser();
    rebuildUi();
  }

  Future<void> getGeneralChatMessages() async {
    final messages = MyFirebaseDatabase.getGeneralChatMessages(
        userData?.trainerId ?? 0, chatDetails.selectedClient?.clientId ?? 0);
    messages.listen((event) {
      messagesList.clear();

      for (var messages in event.snapshot.children) {
        final message = ChatMessageModel.fromJson(messages.value);
        messagesList.add(message);
        print("clients k messages trainer ko $message");
      }

      print("trainer -> client messages event: ${event.snapshot.value}");

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
