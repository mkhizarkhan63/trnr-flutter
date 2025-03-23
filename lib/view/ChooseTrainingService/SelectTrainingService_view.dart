import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/utils.dart';
import 'package:trainr/view/component/RowPersonalTraining.dart';

import '../component/dialogs/loading_dialog.dart';
import 'SelectTrainingServiceViewModel.dart';

class SelectTrainingServiceView extends StatelessWidget {
  SelectTrainingServiceView({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => SelectTrainingServiceViewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.getPersonalTrainingFromApi();
          await viewModel.getUserFromCache();
        },
        builder: (context, SelectTrainingServiceViewModel viewModel, index) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColor.backgroundColor,
            body: PopScope(
              canPop: false,
              onPopInvokedWithResult: (status, _) {},
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 25),
                      child: Text(
                        "What kind of Personal Training service do you prefer?",
                        style: TextStyle(
                          fontSize: 25,
                          color: ThemeColor.textfieldColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 25),
                      child: Text(
                        "(You can choose more than one)",
                        style: TextStyle(
                          fontSize: 13,
                          color: ThemeColor.textfieldColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            viewModel.personalTrainingList.length,
                            (index) {
                              final personalService =
                                  viewModel.personalTrainingList[index];
                              return RowPersonalTraining(personalService, () {
                                viewModel.togglePersonalTraining(index);
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        width: 250,
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ThemeColor.textfieldColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () async {
                            if (viewModel.checkPersonalService()) {
                              _showError(
                                  "Please select at least 1 personal service");
                            } else {
                              _showLoader();

                              final response =
                                  await viewModel.addUserPersonalServices();

                              Navigator.pop(_context);

                              if (response?.statuscode == 200) {
                                if (viewModel.userData?.typeId ==
                                    Constants.trainer) {
                                  viewModel.navigateToTrainerDashboard();
                                } else if (viewModel.userData?.typeId ==
                                    Constants.client) {
                                  viewModel.navigateToClientDashboard();
                                } else {
                                  _showError(response?.message);
                                }
                              } else {
                                _showError(response?.message);
                              }
                            }
                          },
                          child: const Text(
                            'Confirm',
                            style: TextStyle(
                              fontSize: 16,
                              color: ThemeColor.backgroundColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
