import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/components/MessageDialog.dart';

class UploadIdScreen extends StatelessWidget {
  const UploadIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            _submitButton(context),
            _descriptionText(context),
            _topContent(context),
          ],
        ),
      ),
    );
  }
}

Align _topContent(BuildContext context) {
  return Align(
    alignment: Alignment.topLeft,
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: const Text(
              "Just one more step to go",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          GestureDetector(
            onTap: () async {
              print('test');
              var result =
                  await FilePicker.platform.pickFiles(allowMultiple: false);
              if (result == null) {
                print("No file selected");
              } else {}
            },
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.black)),
              height: 55,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Upload Your ID",
                      textAlign: TextAlign.center,
                    )),
                    Icon(Icons.upload)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Align _descriptionText(BuildContext context) {
  return Align(
    alignment: Alignment.center,
    child: GestureDetector(
      onTap: () => {
        showDialog(
            context: context,
            builder: (_) => Dialog(
                child: MessageDialog(
                    message:
                        "We need your ID so that our TRAINR team can approve your request to create your own sessions and enjoy the full features of the app and be apart of our community.")))
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: const Text(
          "Why do you need your ID?",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              decoration: TextDecoration.underline,
              fontFamily: 'verdanab'),
        ),
      ),
    ),
  );
}

Align _submitButton(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: GestureDetector(
      onTap: ()=>{
        showDialog(context: context, builder: (_)=>
          Dialog(child:MessageDialog(message: "Thank you for submission. The TRAINR team will revise your profile and get back to you shortly.",))
        )
      },
      child: Container(
        width: 150,
        margin: const EdgeInsets.symmetric(vertical: 60),
        height: 50,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white, fontFamily: 'verdanab'),
            ),
          ),
        ),
      ),
    ),
  );
}
