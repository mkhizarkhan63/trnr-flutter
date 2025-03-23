import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TBankDetails/tBankDetails_viewModel.dart';

import '../components/bottomsheet/DropDownBottomSheet.dart';

class TBankDetailsView extends StatelessWidget {
  const TBankDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TBankDetailsViewModel(),
        builder: (context, TBankDetailsViewModel viewModel, index) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColor.backgroundColor,
            appBar: AppBar(
              backgroundColor: ThemeColor.backgroundColor,
              leading: IconButton(
                  onPressed: () {
                    viewModel.navigateToRegistrationScreen();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ThemeColor.textfieldColor,
                  )),
              title: const Text(
                "Bank Details",
                style: TextStyle(
                  fontSize: 25,
                  color: ThemeColor.textfieldColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              centerTitle: true,
              scrolledUnderElevation: 0,
            ),
            body: SafeArea(
              child: PopScope(
                canPop: false,
                onPopInvoked: (status) {
                  if (!status) {
                    viewModel.navigateToRegistrationScreen();
                  }
                },
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _bankNamesDropDown(context, viewModel),
                          buildTextField("Bank holder name", double.infinity,
                              null, viewModel.hnameController),
                          buildTextField("IBAN", double.infinity, null,
                              viewModel.ibanController),
                          _buildCheckbox(viewModel),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  bottom: 40.0, top: 20.0),
                              child: SizedBox(
                                width: 210,
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ThemeColor.textfieldColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  onPressed: () {
                                    String? eror = viewModel
                                        .navigateToCodeConfirmationScreen();

                                    if (eror != null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content: Center(
                                        child: Text(eror),
                                      )));
                                    }
                                  },
                                  child: const Text(
                                    'Confirm',
                                    style: TextStyle(
                                      color: ThemeColor.backgroundColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget buildTextField(String labelText, double width, double? rightPadding,
      TextEditingController? controller) {
    rightPadding ??= 15;
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 8, rightPadding, 8),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 45,
        width: width,
        child: TextFormField(
          obscureText: labelText.toLowerCase().contains('password'),
          controller: controller,
          decoration: InputDecoration(
            hintText: labelText,
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(TBankDetailsViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.toggleCheckBox();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Row(
          children: [
            Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: viewModel.tncStatus()
                        ? ThemeColor.textfieldColor
                        : ThemeColor.backgroundColor,
                    border: Border.all(color: ThemeColor.textfieldColor),
                    borderRadius: BorderRadius.circular(2)),
                child: viewModel.tncStatus()
                    ? const Icon(
                        Icons.check,
                        color: ThemeColor.backgroundColor,
                        size: 20,
                      )
                    : const Icon(
                        Icons.check,
                        color: ThemeColor.backgroundColor,
                        size: 20,
                      )),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: const Text(
                "I hereby agree to the Terms and Conditions",
                style:
                    TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bankNamesDropDown(
      BuildContext context, TBankDetailsViewModel viewModel) {
    List<String> banks = ['Bank AL Habib', 'Meezan Bank', "Faysal Bank"];

    return Container(
      margin: const EdgeInsets.only(top: 8, left: 15, right: 15),
      decoration: BoxDecoration(
        color: ThemeColor.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return DropDownBottomSheet(
                        title: "Bank names",
                        dataList: banks,
                        role: "Trainer",
                        onItemClick: (bank) {
                          viewModel.selectBankName(bank);
                        },
                      );
                    });
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    viewModel.selectedBank() ?? "Bank name",
                    style: const TextStyle(
                        fontSize: 14,
                        color: ThemeColor.backgroundColor,
                        fontWeight: FontWeight.w400),
                  )),
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: ThemeColor.backgroundColor,
            size: 25,
          ),
        ],
      ),
    );
  }
}
