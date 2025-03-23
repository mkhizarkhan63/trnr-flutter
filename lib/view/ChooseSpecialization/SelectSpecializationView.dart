import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/ChooseSpecialization/SelectSpecializationViewModel.dart';
import 'package:trainr/view/component/RowSelectedSpecialization.dart';
import 'package:trainr/view/component/RowSpecialization.dart';

import '../component/dialogs/loading_dialog.dart';

class SelectSpecializationView extends StatelessWidget {
  SelectSpecializationView({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => SelectSpecializationViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getSpecializationsFromApi();
      },
      builder: (context, SelectSpecializationViewModel viewModel, index) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ThemeColor.backgroundColor,
          body: SafeArea(
            child: PopScope(
              canPop: true,
              onPopInvoked: (status) {
                if (!status) {
                  // viewModel.navigateToOtpScreen();
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*  IconButton(
                    onPressed: () {
                      viewModel.navigateToOtpScreen();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ThemeColor.textfieldColor,
                    ),
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Wrap(
                      children: [
                        const Text(
                          "What do you specialize in?",
                          style: TextStyle(
                            fontSize: 25,
                            color: ThemeColor.textfieldColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          "(Select more than one)",
                          style: TextStyle(
                            fontSize: 14,
                            color: ThemeColor.primaryColor,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: double.infinity,
                              child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  children: List.generate(
                                      viewModel
                                          .getSelectedSpecializations()
                                          .length, (index) {
                                    final specialization = viewModel
                                        .getSelectedSpecializations()[index];
                                    return RowSelectedSpecialization(
                                        specialization, (specialization) {
                                      viewModel
                                          .removeSpecialization(specialization);
                                    });
                                  })),
                            )),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: const Divider(
                            color: Colors.black,
                            thickness: 1.2,
                          ),
                        ),
                        Wrap(
                          children: List.generate(
                              viewModel.getSpecializations().length, (index) {
                            final specialization =
                                viewModel.getSpecializations()[index];
                            return RowSpecialization(specialization,
                                (specialization) {
                              viewModel.addSpecialization(specialization);
                            });
                          }),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 0,
            color: ThemeColor.backgroundColor,
            child: Center(
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ThemeColor.textfieldColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () async {
                    if (viewModel.checkSpecializations()) {
                      _showError("Please select at least 1 specialization");
                    } else {
                      _showLoader();

                      final response = await viewModel.addUserSpecialization();

                      Navigator.pop(_context);

                      if (response?.statuscode == 200) {
                        viewModel.navigateToChooseTrainingService();
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
          ),
        );
      },
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
