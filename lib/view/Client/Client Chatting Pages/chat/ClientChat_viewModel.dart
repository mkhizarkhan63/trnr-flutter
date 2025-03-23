import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/customServices/ChatMessage.dart';
import 'package:trainr/firebase/MyFirebaseDatabase.dart';
import 'package:trainr/models/chats/ChatMessageModel.dart';
import 'package:trainr/models/GetAllTrainersResponse.dart';
import 'package:trainr/models/trainer_model.dart';
import 'package:trainr/view/Client/repo/ClientChatRepo.dart';

class ClientChatViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _repo = locator<ClientChatRepo>();
  final _chatUser = locator<ChatUser>();

  final searchTextController = TextEditingController(text: "");

  bool _isPrimaryChatSelected = true;
  bool _isSearchBarShown = false;

  List<AllTrainerData> trainersList = [];
  List<String> subscribedTrainers = [];

  String searchValue = '';

  Future<void> sendMessageToTrainer(int trainerId) async {
    final userData = await MySharedPreferences.getUser();
    var chatModel = ChatMessageModel(
        senderId: userData?.clientId.toString() ?? "",
        senderProfileImage: userData?.profileImage ?? "",
        message: "hello world",
        type: "text",
        mediaUrl: "",
        createdBy: DateTime.now().toString());

    await MyFirebaseDatabase.sendChatToGeneralTrainer(trainerId, chatModel);
  }

  Future<void> getAllTrainers() async {
    final response = await _repo.getAllTrainers();

    if (response != null) {
      trainersList.clear();
      trainersList.addAll(response.data ?? []);
    }

    rebuildUi();
  }

  void navigateToClientChattingView() {
    _navigationService.navigateToClientChattingView();
  }

  isPrimaryChat() {
    return _isPrimaryChatSelected;
  }

  changeSearchValue(String value) {
    searchValue = value;

    print("searchValue is $searchValue");

    rebuildUi();
  }

  navigateToChat(AllTrainerData trainerData) {
    _chatUser.selectedTrainer = trainerData;
    _navigationService.navigateToClientChattingView();
  }

  toggleSearch() {
    _isSearchBarShown = !_isSearchBarShown;

    rebuildUi();
  }

  toggleChatTab(bool status) {
    _isPrimaryChatSelected = status;

    if (_isPrimaryChatSelected) {
    } else {
      getAllTrainers();
    }

    rebuildUi();
  }

  isSearchBarShown() {
    return _isSearchBarShown;
  }
}
