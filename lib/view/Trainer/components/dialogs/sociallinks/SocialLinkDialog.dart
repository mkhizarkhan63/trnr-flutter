import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/components/dialogs/sociallinks/SocialLinkViewModel.dart';

class SocialLinkDialog extends StatelessWidget {
  final String title;
  final String url;
  final Function(String) onAddClick;
  late BuildContext _context;

  SocialLinkDialog(
      {super.key,
      required this.title,
      required this.url,
      required this.onAddClick});

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SocialLinkViewModel(),
        onViewModelReady: (viewModel) {
          viewModel.socialLinkTextController.value =
              TextEditingValue(text: url);
        },
        builder: (ctx, viewModel, index) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ThemeColor.textfieldColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Wrap(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.close,
                            color: ThemeColor.textfieldColor,
                            size: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          url.isNotEmpty
                              ? url.contains("facebook")
                                  ? "Facebook link"
                                  : url.contains("snapchat")
                                      ? "Snapchat link"
                                      : "Tiktok link"
                              : "$title link",
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: ThemeColor.backgroundColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.socialLinkTextController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter $title Link"),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () {
                          final socialLink =
                              viewModel.socialLinkTextController.text;
                          if (socialLink.isNotEmpty) {
                            if (socialLink.startsWith("www.")) {
                              onAddClick(socialLink);
                            } else {
                              _showError("Please enter valid social link");
                            }
                          } else {
                            _showError("Please enter or paste the social link");
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Add",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ThemeColor.textfieldColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  void _showError(String? message) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Center(
      child: Text(message ?? "Something went wrong"),
    )));
  }
}
