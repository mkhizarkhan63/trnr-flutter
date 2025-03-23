import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/Client%20Profile/C_Profile%20Comunity/C_ProfileComunity_ViewModel.dart';
import 'package:trainr/view/Client/components/RowCSession.dart';

import '../../../component/dialogs/loading_dialog.dart';

class CProfileComunityView extends StatelessWidget {
  CProfileComunityView({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CProfileComunityViewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.getSessionsByUser();
        },
        builder: (context, CProfileComunityViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.primaryColor,
            body: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Our Community',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      decoration: TextDecoration.combine([
                        TextDecoration.underline,
                      ]),
                    ),
                  ),
                ),
                Expanded(
                  child: viewModel.sessionsList.isNotEmpty
                      ? ListView.builder(
                          itemCount: viewModel.sessionsList.length,
                          itemBuilder: (context, index) {
                            final sessionData = viewModel.sessionsList[index];
                            return RowCSession(
                                sessionData: sessionData,
                                onSessionCancelTap: () async {
                                  _showLoader();
                                  final response = await viewModel
                                      .deleteSession(sessionData.id ?? 0);

                                  Navigator.pop(context);

                                  if (response?.statusCode == 200) {
                                    await viewModel.getSessionsByUser();
                                  } else {
                                    _showError(response?.statusMessage ?? "");
                                    print(response?.statusMessage ?? "");
                                  }
                                });
                          })
                      : Container(
                          alignment: Alignment.center,
                          child: const Text(
                            "No session added",
                            style: TextStyle(
                                fontSize: 16,
                                color: ThemeColor.fontColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                )
              ],
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
