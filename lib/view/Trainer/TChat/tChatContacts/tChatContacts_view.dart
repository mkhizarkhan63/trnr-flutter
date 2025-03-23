import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/chats/ClientDetailsModel.dart';
import 'package:trainr/view/Trainer/TChat/tChatContacts/tChatContacts_viewModel.dart';
import '../../components/RowClientsChat.dart';

class TChatContactsView extends StatelessWidget {
  const TChatContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TChatContactsViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.getGeneralClientChats();
      },
      builder: (context, TChatContactsViewModel viewModel, index) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ThemeColor.backgroundColor,
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  _topContent(viewModel),
                  _divider(),
                  _searchBar(viewModel),
                  viewModel.isPrimaryChat()
                      ? _loadPrimaryChats(viewModel)
                      : _loadGeneralChats(viewModel)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _topContent(TChatContactsViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          _primaryTab(viewModel),
          _generalTab(viewModel),
          const Expanded(child: SizedBox()),
          _searchIcon(viewModel)
        ],
      ),
    );
  }

  Widget _primaryTab(TChatContactsViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.toggleChatTab(true);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: viewModel.isPrimaryChat()
                ? ThemeColor.textfieldColor
                : ThemeColor.lightGrey1Color,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "Primary",
          style: TextStyle(
              color: viewModel.isPrimaryChat()
                  ? ThemeColor.backgroundColor
                  : ThemeColor.textColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _generalTab(TChatContactsViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.toggleChatTab(false);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: viewModel.isPrimaryChat()
                ? ThemeColor.lightGrey1Color
                : ThemeColor.textfieldColor,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "General",
          style: TextStyle(
              color: viewModel.isPrimaryChat()
                  ? ThemeColor.textColor
                  : ThemeColor.backgroundColor,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: const Divider(
        thickness: 2,
        color: ThemeColor.textfieldColor,
      ),
    );
  }

  Widget _searchBar(TChatContactsViewModel viewModel) {
    return viewModel.isSearchBarShown()
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: ThemeColor.textfieldColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
                controller: viewModel.searchTextController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                )),
          )
        : Container();
  }

  Widget _searchIcon(TChatContactsViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.toggleSearch();
      },
      child: const Icon(
        Icons.search,
        color: ThemeColor.primaryColor,
      ),
    );
  }

  Widget _loadGeneralChats(TChatContactsViewModel viewModel) {
    /*return Expanded(
      child: ListView.builder(
        itemCount: viewModel.generalClientsList.length,
        itemBuilder: (context, index) {
          ClientDetailsModel clientData = viewModel.generalClientsList[index];
          return FutureBuilder(
              future: viewModel.getChatData(clientID: clientData.id),
              builder: (context, chatData) {
                return RowClientChat(
                    clientName:
                        "${clientData.firstName} ${clientData.lastName}",
                    message: message,
                    onClientClick: () {
                      print("client working");
                      viewModel.navigateToChat(clientData: clientData);
                    });
              });
        },
      ),
    );*/

    return Expanded(
      child: ListView.builder(
        itemCount: viewModel.generalClientsList.length,
        itemBuilder: (context, index) {
          ClientDetailsModel clientData = viewModel.generalClientsList[index];
          return RowClientChat(
              clientName: clientData?.fullName ?? "",
              message: "",
              onClientClick: () {
                print("client working");
                viewModel.navigateToChat(clientData);
              });
        },
      ),
    );
  }

  Widget _loadPrimaryChats(TChatContactsViewModel viewModel) {
    /*return Expanded(
      child: ListView.builder(
        itemCount: viewModel.generalClientsList.length,
        itemBuilder: (context, index) {
          ClientDetailsModel clientData = viewModel.generalClientsList[index];
          return FutureBuilder(
              future: viewModel.getChatData(clientID: clientData.id),
              builder: (context, chatData) {
                return RowClientChat(
                    clientName:
                        "${clientData.firstName} ${clientData.lastName}",
                    message: message,
                    onClientClick: () {
                      print("client working");
                      viewModel.navigateToChat(clientData: clientData);
                    });
              });
        },
      ),
    );*/

    /* return Expanded(
      child: ListView.builder(
        itemCount: viewModel.generalClientsList.length,
        itemBuilder: (context, index) {
          ClientDetailsModel clientData = viewModel.generalClientsList[index];
          return RowClientChat(
              clientName: clientData?.fullName ?? "",
              message: "",
              onClientClick: () {
                print("client working");
                viewModel.navigateToChat(clientData);
              });
        },
      ),
    );*/
    return Container();
  }
}
