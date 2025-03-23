import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/components/RowCSession.dart';
import '../../../../../../assets/variables/themeColor.dart';
import '../../../../../Trainer/components/RowTSession.dart';
import '../../../../components/RowCTSession.dart';
import 'C-PackageTab_ViewModel.dart';

class CSessionScreen extends StatelessWidget {
  CSessionScreen({super.key, required this.trainerId});

  int trainerId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CPackageTabViewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.getSessionsByUser(trainerId);
        },
        builder: (ctx, viewModel, index) {
          return Column(
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
                          return RowCTSession(
                            sessionData: sessionData,
                          );
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
}
