import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/Client%20Chatting%20Pages/Client%20Chatting/ClientChatting_viewModel.dart';
import '../../../Trainer/components/RowReceiver.dart';
import '../../../Trainer/components/RowSender.dart';

class ClientChattingView extends StatelessWidget {
  const ClientChattingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ClientChattingViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getUserData();
        await viewModel.getGeneralChatMessages();
      },
      builder: (context, ClientChattingViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.primaryColor,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: ThemeColor.primaryColor,
            flexibleSpace: SafeArea(
              child: Container(
                padding: const EdgeInsets.only(right: 16),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "${viewModel.chatDetails.selectedTrainer?.firstName} ${viewModel.chatDetails.selectedTrainer?.lastName}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Online",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: ListView.builder(
                          itemCount: viewModel.messagesList.length,
                          itemBuilder: (context, index) {
                            final message = viewModel.messagesList[index];
                            if (message.senderId ==
                                viewModel.userData?.clientId.toString()) {
                              return RowSender(
                                  chatModel: message, role: "client");
                            } else {
                              return RowReceiver(
                                  chatModel: message, role: "client");
                            }
                          }))),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: double.infinity,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            padding: const EdgeInsets.all(2),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.black),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 35,
                              weight: 200,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.width * 0.1,
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 3),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                onSubmitted: (msg) async {
                                  await viewModel.sendChatMessage();
                                  viewModel.msgController.text = "";
                                },
                                controller: viewModel.msgController,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 20,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: IconButton(
                              padding: const EdgeInsets.all(2),
                              onPressed: () async {
                                var result = await FilePicker.platform
                                    .pickFiles(allowMultiple: true);
                                if (result == null) {
                                  print("No file selected");
                                } else {
                                  await viewModel.uploadImage(result);
                                }
                              },
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 35,
                                weight: 200,
                              ),
                            ),
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(2),
                            style: ButtonStyle(
                              backgroundColor: WidgetStateColor.resolveWith(
                                  (states) => viewModel.isRecording
                                      ? ThemeColor.primaryColor
                                      : ThemeColor.fontColor),
                            ),
                            onPressed: () {
                              print("recording: ${viewModel.isRecording}");
                              viewModel.isRecording
                                  ? viewModel.stopRecording()
                                  : viewModel.startRecording();
                            },
                            icon: Icon(
                              Icons.mic_none_outlined,
                              color: viewModel.isRecording
                                  ? ThemeColor.fontColor
                                  : Colors.white,
                              size: 35,
                              weight: 200,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // bottomNavigationBar: const ClientBottombarView(),
        );
      },
    );
  }
}
