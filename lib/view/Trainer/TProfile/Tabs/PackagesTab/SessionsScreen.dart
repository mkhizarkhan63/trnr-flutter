import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Trainer/TProfile/Tabs/PackagesTab/packagesTab_viewModel.dart';
import '../../../../../assets/variables/themeColor.dart';
import '../../../../component/dialogs/loading_dialog.dart';
import '../../../components/RowTSession.dart';

class SessionScreen extends StatelessWidget {
  SessionScreen({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => PackagesTabViewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.getSessionsByUser();
        },
        builder: (ctx, viewModel, index) {
          return Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: GestureDetector(
                    onTap: () async {
                      final data =
                          await viewModel.navigateToTCreateClassView(null);

                      if (data) {
                        await viewModel.getSessionsByUser();
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ThemeColor.primaryColor,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: const Icon(
                              Icons.add_circle_rounded,
                              color: ThemeColor.primaryColor,
                            ),
                          ),
                          const Text(
                            "Create Session",
                            style: TextStyle(
                                fontSize: 18,
                                color: ThemeColor.primaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: viewModel.sessionsList.isNotEmpty
                    ? ListView.builder(
                        itemCount: viewModel.sessionsList.length,
                        itemBuilder: (context, index) {
                          final sessionData = viewModel.sessionsList[index];
                          return RowTSession(
                              sessionData: sessionData,
                              onEditTap: () async {
                                final data = await viewModel
                                    .navigateToTCreateClassView(sessionData);

                                if (data) {
                                  await viewModel.getSessionsByUser();
                                }
                              },
                              onCancelTap: () async {
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
                              color: ThemeColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
              )
            ],
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
