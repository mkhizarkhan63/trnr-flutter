import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/firebase/MyFirebaseDatabase.dart';
import 'package:trainr/models/RegistrationResponse.dart';
import 'package:trainr/models/chats/ClientDetailsModel.dart';

import '../../../../customServices/ChatMessage.dart';

class TChatContactsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final searchController = TextEditingController();
  String searchValue = '';
  final _chatDetails = locator<ChatUser>();

  final searchTextController = TextEditingController(text: "");

  bool _isPrimaryChatSelected = true;
  bool _isSearchBarShown = false;

  List<ClientDetailsModel> generalClientsList = [];

  isPrimaryChat() {
    return _isPrimaryChatSelected;
  }

  changeSearchValue(String value) {
    searchValue = value;

    print("searchValue is $searchValue");

    rebuildUi();
  }

  Future<RegistrationData?> getUser() async {
    return await MySharedPreferences.getUser();
  }

  Future<void> getGeneralClientChats() async {
    final userData = await MySharedPreferences.getUser();

    final clientStream =
        MyFirebaseDatabase.getTrainerGeneralClients(userData?.trainerId ?? 0);

    clientStream.listen((event) {
      generalClientsList.clear();
      for (var clients in event.snapshot.children) {
        final client = ClientDetailsModel.fromJson(clients.value);
        generalClientsList.add(client);
      }

      print("event: $event ${generalClientsList.length}");

      rebuildUi();
    });
  }

  /*Future<List<ClientQueryDocumentSnapshot>>? getClients4Search() async {
    List<ClientQueryDocumentSnapshot>? data = [];
    List<ClientQueryDocumentSnapshot>? dataTemp = await getAllClients();

    ContactList? _contactList = await getContactList(ownerID: trainerData.id);

    if (dataTemp != null) {
      for (var ele in dataTemp) {
        if (_contactList != null && _contactList.contacts.length != 0) {
          if (_contactList!.contacts.contains(ele.id)) {
            data.add(ele);
          }
        }
      }
    }

    print("data is = ${data!.length}");
    return data;
  }*/

  /* Future<List<ClientQueryDocumentSnapshot>>? getClients() async {
    List<ClientQueryDocumentSnapshot>? data = await getAllClients();

    print("data is = $data");
    return Future.value(data);
  }*/

/*
  Future<Chats?> getChatData({required String clientID}) async {
    Chats? chatData =
        await getChat(firstID: trainerData.id, secondID: clientID);

    return chatData;
  }
*/

  toggleChatTab(bool status) {
    _isPrimaryChatSelected = status;

    rebuildUi();
  }

  isSearchBarShown() {
    return _isSearchBarShown;
  }

  navigateToClientSection(ClientDetailsModel client) {
    _navigationService.navigateToTClientSectionView();
  }

  navigateToChat(ClientDetailsModel client) {
    _chatDetails.selectedClient = client;
    _navigationService.navigateToTChatView();
  }

  toggleSearch() {
    _isSearchBarShown = !_isSearchBarShown;

    rebuildUi();
  }
}
