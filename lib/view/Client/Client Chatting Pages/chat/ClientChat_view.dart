import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/GetAllTrainersResponse.dart';
import '../../components/RowTrainerChat.dart';
import 'ClientChat_viewModel.dart';

class ClientChatView extends StatelessWidget {
  const ClientChatView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ClientChatViewModel>.reactive(
      viewModelBuilder: () => ClientChatViewModel(),
      onViewModelReady: (viewModel) async {},
      builder: (context, viewModel, index) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ThemeColor.primaryColor,
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  _topContent(viewModel),
                  _divider(),
                  _searchBar(viewModel),
                  viewModel.isPrimaryChat()
                      ? _loadSubscribedTrainersChats(viewModel)
                      : _loadAllTrainersChats(viewModel)
                ],
              ),
            ),
          ),
          // bottomNavigationBar: const ClientBottombarView(),
        );
      },
    );
  }

  Widget _topContent(ClientChatViewModel viewModel) {
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

  Widget _primaryTab(ClientChatViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.toggleChatTab(true);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
            color: viewModel.isPrimaryChat()
                ? ThemeColor.secondaryColor
                : ThemeColor.lightGrey1Color,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "Primary",
          style: TextStyle(
              color: viewModel.isPrimaryChat()
                  ? ThemeColor.textfieldColor
                  : Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Widget _generalTab(ClientChatViewModel viewModel) {
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
                : ThemeColor.secondaryColor,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "General",
          style: TextStyle(
              color: viewModel.isPrimaryChat()
                  ? Colors.grey
                  : ThemeColor.textfieldColor,
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
        thickness: 1,
        color: Colors.grey,
      ),
    );
  }

  Widget _searchBar(ClientChatViewModel viewModel) {
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

  Widget _searchIcon(ClientChatViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.toggleSearch();
      },
      child: const Icon(
        Icons.search,
        color: ThemeColor.secondaryColor,
      ),
    );
  }

  Widget _loadAllTrainersChats(ClientChatViewModel viewModel) {
    return Expanded(
        child: ListView.builder(
            itemCount: viewModel.trainersList.length,
            itemBuilder: (context, index) {
              AllTrainerData trainerData = viewModel.trainersList[index];
              return RowTrainerChat(
                  trainerName:
                      "${trainerData.firstName} ${trainerData.lastName}",
                  message: "",
                  onTrainerClick: () {
                    // viewModel.sendMessageToTrainer(trainerData.id ?? 0);
                    viewModel.navigateToChat(trainerData);
                  });

              /* final message = chatData.data?.messages.isEmpty == true ||
                        chatData.data?.messages == null
                    ? "start a new chat"
                    : chatData.data?.messages[
                                (chatData.data!.messages.length - 1)]["type"] ==
                            "text"
                        ? chatData.data
                                ?.messages[(chatData.data!.messages.length - 1)]
                            ["msg"]
                        : chatData.data?.messages[
                                        (chatData.data!.messages.length - 1)]
                                    ["type"] ==
                                "image"
                            ? "📷 Image"
                            : "🎤 Voice note";*/
            }));
  }

  Widget _loadSubscribedTrainersChats(ClientChatViewModel viewModel) {
    return Expanded(
        child: /*ListView.builder(
            itemCount: viewModel.trainersList.length,
            itemBuilder: (context, index) {
              AllTrainerData trainerData = viewModel.trainersList[index];
              return RowTrainerChat(
                  trainerName:
                      "${trainerData.firstName} ${trainerData.lastName}",
                  message: "",
                  onTrainerClick: () {
                    viewModel.navigateToChat();
                  });

              */ /* final message = chatData.data?.messages.isEmpty == true ||
                        chatData.data?.messages == null
                    ? "start a new chat"
                    : chatData.data?.messages[
                                (chatData.data!.messages.length - 1)]["type"] ==
                            "text"
                        ? chatData.data
                                ?.messages[(chatData.data!.messages.length - 1)]
                            ["msg"]
                        : chatData.data?.messages[
                                        (chatData.data!.messages.length - 1)]
                                    ["type"] ==
                                "image"
                            ? "📷 Image"
                            : "🎤 Voice note";*/ /*
            })*/

            Container());
  }
}
