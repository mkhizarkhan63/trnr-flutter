import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Trainer%20Profile%20in%20Client%20View/Tabs/C-ProfileTab/C-ProfileTab_viewModel.dart';

import '../../../../../../assets/variables/themeColor.dart';
import '../../../../../../models/GetTrainerProfileResponse.dart';
import '../../../../../Trainer/components/RowCertificates.dart';
import '../../../../../Trainer/components/RowLanguage.dart';

class CProfileTabView extends StatelessWidget {
  CProfileTabView({super.key, required this.profileData});

  TrainerProfileData? profileData;

  final _role = "client";

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CProfileTabViewModel(),
        builder: (context, CProfileTabViewModel viewModel, index) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_aboutMe(), _languages(), _certificates(), _links()],
            ),
          );
        });
  }

  Widget _aboutMe() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Padding(
        padding: EdgeInsets.only(top: 15.0),
        child: Text(
          "About me",
          style: TextStyle(
              color: ThemeColor.secondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: ThemeColor.textfieldColor,
              borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          height: 100,
          child: Text(
            profileData?.description ?? "No description",
            style: const TextStyle(fontSize: 14, color: ThemeColor.fontColor),
          ),
        ),
      )
    ]);
  }

  Widget _languages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Text(
            'Languages',
            style: TextStyle(
                color: ThemeColor.secondaryColor,
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
                                isEditable: false,
                                onDeleteClick: () {},
                              );
                            }),
                      )
                    : const Text(
                        "No languages added",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: ThemeColor.darkBackgroundColor,
                            fontSize: 16),
                      ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _links() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            'Links',
            style: TextStyle(
                color: ThemeColor.secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SizedBox(
                  height: 25,
                  child: profileData?.socialLinks?.isNotEmpty == true
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: profileData?.socialLinks?.length ?? 0,
                          itemBuilder: (context, index) {
                            final socialLinks = profileData?.socialLinks;
                            return GestureDetector(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Icon(
                                  socialLinks?.contains("facebook") == true
                                      ? Icons.facebook
                                      : socialLinks?.contains("snapchat") ==
                                              true
                                          ? Icons.snapchat
                                          : Icons.tiktok,
                                  size: 30,
                                  color: ThemeColor.textfieldColor,
                                ),
                              ),
                            );
                          })
                      : const Text(
                          "No social links added",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ThemeColor.darkBackgroundColor,
                              fontSize: 16),
                        ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _certificates() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Text(
              'Certificates',
              style: TextStyle(
                  color: ThemeColor.secondaryColor,
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
                child: SizedBox(
                  height: 25,
                  child: profileData?.certificates?.isNotEmpty == true
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: profileData?.certificates?.length ?? 0,
                          itemBuilder: (context, index) {
                            return RowCertificates(
                              certificate: "Certificate ${index + 1}",
                              role: _role,
                              isEditable: false,
                              onDeleteClick: () {},
                            );
                          })
                      : const Text(
                          "No certificates added",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: ThemeColor.darkBackgroundColor,
                              fontSize: 16),
                        ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
