import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/GetTrainerProfileResponse.dart';
import 'package:trainr/view/Trainer/TProfile/Tabs/ProfileTab/profileTab_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowLanguage.dart';
import 'package:trainr/view/Trainer/components/dialogs/language/LanguageDialog.dart';
import 'package:trainr/view/Trainer/components/dialogs/sociallinks/SocialLinkDialog.dart';

import '../../../../component/dialogs/loading_dialog.dart';
import '../../../components/RowCertificates.dart';

class ProfileTabView extends StatelessWidget {
  ProfileTabView(
      {super.key, required this.profileData, required this.onSuccess});

  late BuildContext _context;
  TrainerProfileData? profileData;
  Function() onSuccess;

  final _linksList = [Icons.facebook, Icons.tiktok, Icons.snapchat];
  final _linksNameList = ["Facebook", "Tiktok", "Snapchat"];
  final _role = "trainer";

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ProfileTabViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getLanguages();
      },
      builder: (context, ProfileTabViewModel viewModel, index) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _aboutMe(viewModel),
              _languages(context, viewModel),
              _certificates(context, viewModel),
              _links(viewModel)
            ],
          ),
        );
      },
    );
  }

  Widget _aboutMe(ProfileTabViewModel viewModel) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Text(
          'About me',
          style: TextStyle(
              color: ThemeColor.textfieldColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          decoration: BoxDecoration(
              color: ThemeColor.primaryColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          height: 100,
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: viewModel.descriptionController,
            onSubmitted: (text) async {
              if (text.isNotEmpty) {
                _showLoader();
                final response =
                    await viewModel.updateProfile(profileData, text, [], null);
                Navigator.pop(_context);

                if (response?.statusCode == 200) {
                  onSuccess();
                } else {
                  _showError(response?.statusMessage ?? "Something went wrong");
                }
              } else {
                _showError("Please enter something");
              }
            },
          ),
        ),
      )
    ]);
  }

  Widget _languages(BuildContext ctx, ProfileTabViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            'Languages',
            style: TextStyle(
                color: ThemeColor.textfieldColor,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Expanded(
                child: profileData?.languages?.isNotEmpty == true
                    ? SizedBox(
                        height: 45,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: profileData?.languages?.length ?? 0,
                            itemBuilder: (context, index) {
                              final lang = profileData?.languages?[index];
                              return RowLanguage(
                                language: lang?.name ?? "",
                                role: _role,
                                isEditable: viewModel.isLanguageEditable(),
                                onDeleteClick: () async {
                                  _showLoader();

                                  final response = await viewModel
                                      .deleteLanguage(lang?.id ?? 0);

                                  Navigator.pop(_context);

                                  if (response?.statusCode == 200) {
                                    onSuccess();
                                  } else {
                                    _showError(response?.statusMessage ??
                                        "Something went wrong");
                                  }
                                },
                              );
                            }))
                    : const Text(
                        "No Languages added",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: ThemeColor.primaryColor,
                            fontSize: 16),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    color: ThemeColor.textfieldColor,
                    size: 25,
                  ),
                  onPressed: () async {
                    showDialog(
                        context: ctx,
                        builder: (ctx) {
                          return LanguageDialog(
                              langauges: viewModel.languages,
                              onAddClick: (data) async {
                                Navigator.pop(ctx);

                                _showLoader();

                                final response = await viewModel.updateProfile(
                                    profileData, "", data, null);

                                Navigator.pop(_context);

                                if (response?.statusCode == 200) {
                                  onSuccess();
                                } else {
                                  _showError(response?.statusMessage ?? "");
                                }
                              });
                        });
                  },
                ),
              ),
              if (profileData?.languages?.isNotEmpty == true)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: GestureDetector(
                    onTap: () {
                      viewModel.toggleLanguage();
                    },
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                          decorationColor: ThemeColor.textfieldColor,
                          decoration: TextDecoration.underline,
                          color: ThemeColor.textfieldColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }

  Widget _links(ProfileTabViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            'Links',
            style: TextStyle(
                color: ThemeColor.textfieldColor,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          height: 30,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _linksList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          final url = viewModel.socialLinks.isNotEmpty
                              ? viewModel?.socialLinks.map((value) {
                                    if (value.contains(_linksNameList[index])) {
                                      value;
                                    }
                                  }).single ??
                                  ""
                              : "";
                          return SocialLinkDialog(
                              title: _linksNameList[index],
                              url: url,
                              onAddClick: (value) async {
                                print("social: $value");
                                Navigator.pop(ctx);

                                _showLoader();

                                final response = await viewModel.updateProfile(
                                    profileData, "", [], value);

                                Navigator.pop(_context);

                                if (response?.statusCode == 200) {
                                  onSuccess();
                                } else {
                                  _showError(response?.statusMessage ?? "");
                                }
                              });
                        });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Icon(
                      _linksList[index],
                      size: 30,
                      color: ThemeColor.textfieldColor,
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  Widget _certificates(BuildContext context, ProfileTabViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              'Certificates',
              style: TextStyle(
                  color: ThemeColor.textfieldColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: profileData?.certificates?.isNotEmpty == true
                    ? SizedBox(
                        height: 45,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: profileData?.certificates?.length ?? 0,
                            itemBuilder: (context, index) {
                              final certificate =
                                  profileData?.certificates?[index];

                              return RowCertificates(
                                certificate: "Certificate ${index + 1}",
                                role: _role,
                                isEditable: viewModel.isCertificateEditable(),
                                onDeleteClick: () async {
                                  _showLoader();

                                  final response = await viewModel
                                      .deleteCertificate(certificate?.id ?? 0);

                                  Navigator.pop(_context);

                                  if (response?.statusCode == 200) {
                                    onSuccess();
                                  } else {
                                    _showError(response?.statusMessage ??
                                        "Something went wrong");
                                  }
                                },
                              );
                            }),
                      )
                    : const Text(
                        "No certificates added",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: ThemeColor.primaryColor,
                            fontSize: 16),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: IconButton(
                  icon: const Icon(
                    Icons.add_circle,
                    color: ThemeColor.textfieldColor,
                    size: 25,
                  ),
                  onPressed: () async {
                    var result = await FilePicker.platform
                        .pickFiles(allowMultiple: false);
                    if (result == null) {
                      print("No file selected");
                    } else {
                      _showLoader();

                      final certificate = File(result.files.single.path ?? "");
                      final response =
                          await viewModel.uploadCertificate(certificate);

                      Navigator.pop(context);

                      if (response?.statusCode == 200) {
                        onSuccess();
                      } else {
                        _showError(response?.statusMessage ?? "");
                      }
                    }
                  },
                ),
              ),
              if (profileData?.certificates?.isNotEmpty == true)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: GestureDetector(
                    onTap: () {
                      viewModel.toggleCertificate();
                    },
                    child: const Text(
                      "Edit",
                      style: TextStyle(
                          decorationColor: ThemeColor.textfieldColor,
                          decoration: TextDecoration.underline,
                          color: ThemeColor.textfieldColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  _showLoader() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (ctx) {
          return const LoadingDialog(message: "Please wait....");
        });
  }

  void _showError(String? message) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Center(
      child: Text(message ?? "Something went wrong"),
    )));
  }
}
