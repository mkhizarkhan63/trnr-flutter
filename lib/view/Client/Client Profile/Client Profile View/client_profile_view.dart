import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/Client%20Profile/C_Profile%20Comunity/C_ProfileComunity_view.dart';
import 'package:trainr/view/Client/Client%20Profile/Client%20Cart%20Tab/ClientCartTab_view.dart';
import 'package:trainr/view/Client/Client%20Profile/Client%20Profile%20Tab/ClientProfileTab_view.dart';
import 'package:trainr/view/Client/Client%20Profile/Client%20Profile%20View/client_profile_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowSpeciality.dart';

import '../../../Trainer/components/RowService.dart';

class ClientProfileView extends StatelessWidget {
  const ClientProfileView({Key? key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ClientProfileViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getClientProfile();
      },
      builder: (context, ClientProfileViewModel viewModel, index) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ThemeColor.primaryColor,
          body: SafeArea(
            child: PopScope(
              canPop: false,
              onPopInvokedWithResult: (status, _) {
                if (!status) {
                  viewModel.navigateToClientHome();
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  viewModel.navigateToClientHome();
                                },
                                child: const Icon(Icons.arrow_back),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  viewModel.navigateToSettingView();
                                },
                                child: const Icon(
                                  Icons.settings,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              var result = await FilePicker.platform
                                  .pickFiles(allowMultiple: true);
                              if (result == null) {
                                print("No file selected");
                              } else {
                                viewModel.uploadImage(result);
                              }
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Icon(
                                Icons.camera_alt_rounded,
                                size: 30,
                              ),
                            ),
                          ),
                          Text(
                            "${viewModel.clientData?.firstName} ${viewModel.clientData?.lastName}",
                            style: const TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                      viewModel.clientData?.specializations.isNotEmpty == true
                          ? Container(
                              height: 40,
                              padding: const EdgeInsets.only(left: 10),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: viewModel
                                      .clientData?.specializations.length,
                                  itemBuilder: (ctx, index) {
                                    final speciality = viewModel
                                        .clientData?.specializations[index];
                                    return RowSpeciality(
                                        role: "client",
                                        speciality: speciality?.name ?? "",
                                        onSpecialityClick: () {});
                                  }),
                            )
                          : Container(),
                      viewModel.clientData?.personalTrainingServices
                                  .isNotEmpty ==
                              true
                          ? Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.only(top: 10.0, left: 10),
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: viewModel.clientData
                                      ?.personalTrainingServices.length,
                                  itemBuilder: (ctx, index) {
                                    final service = viewModel.clientData
                                        ?.personalTrainingServices[index];
                                    return RowService(
                                      serviceName: service?.name ?? "",
                                      role: "client",
                                    );
                                  }),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 30,
                                  color: ThemeColor.textColor,
                                ),
                                Text(
                                  viewModel.clientData?.nationality ?? "",
                                  // viewModel.client?.nationality ?? "",
                                  style: const TextStyle(
                                      color: ThemeColor.textColor,
                                      fontSize: 18),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Expanded(
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          const TabBar(
                            padding: EdgeInsets.all(0),
                            labelPadding: EdgeInsets.all(0),
                            indicatorColor: Colors.black,
                            dividerColor: ThemeColor.primaryColor,
                            tabs: [
                              Icon(
                                Icons.person_2,
                                size: 50,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.shopping_cart,
                                size: 40,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.group,
                                size: 40,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          Expanded(
                            child: TabBarView(
                              children: [
                                const ClientProfileTabView(),
                                const ClientCartTabView(),
                                CProfileComunityView(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // bottomNavigationBar: const ClientBottombarView(),
        );
      },
    );
  }
}
