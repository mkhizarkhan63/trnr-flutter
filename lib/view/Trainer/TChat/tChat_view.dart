import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TChat/tChat_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowReceiver.dart';
import 'package:trainr/view/Trainer/components/RowSender.dart';

class TChatView extends StatelessWidget {
  const TChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TChatViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getUserData();
        await viewModel.getGeneralChatMessages();
      },
      builder: (context, TChatViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: ThemeColor.backgroundColor,
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
                        color: ThemeColor.textfieldColor,
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
                            "${viewModel.chatDetails.selectedClient?.fullName}",
                            style: const TextStyle(
                                fontSize: 16,
                                color: ThemeColor.primaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          const Text(
                            "Online",
                            style: TextStyle(
                                color: ThemeColor.lightGrey1Color,
                                fontSize: 12),
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
                              viewModel.userData?.trainerId.toString()) {
                            return RowSender(
                                chatModel: message, role: "trainer");
                          } else {
                            return RowReceiver(
                                chatModel: message, role: "trainer");
                          }
                        })),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  color: ThemeColor.darkBackgroundColor,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 35,
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 10),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: TextField(
                                onSubmitted: (msg) {
                                  viewModel.sendChatMessage();
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
                                    .pickFiles(allowMultiple: false);
                                if (result == null) {
                                  print("No file selected");
                                } else {
                                  await viewModel.uploadImage(result);
                                }
                              },
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: ThemeColor.textfieldColor,
                                size: 25,
                                weight: 200,
                              ),
                            ),
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(2),
                            style: ButtonStyle(
                              backgroundColor: WidgetStateColor.resolveWith(
                                  (states) => viewModel.isRecording
                                      ? ThemeColor.textfieldColor
                                      : ThemeColor.backgroundColor),
                            ),
                            onPressed: () {
                              viewModel.isRecording
                                  ? viewModel.stopRecording()
                                  : viewModel.startRecording();
                            },
                            icon: Icon(
                              Icons.mic_none_outlined,
                              color: viewModel.isRecording
                                  ? ThemeColor.darkBackgroundColor
                                  : ThemeColor.textfieldColor,
                              size: 25,
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
        );
      },
    );
  }
}
