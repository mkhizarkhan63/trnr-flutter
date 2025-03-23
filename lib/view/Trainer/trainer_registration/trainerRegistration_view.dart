import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/GetGenderResponse.dart';
import 'package:trainr/models/GetLanguagesResponse.dart';
import 'package:trainr/view/Trainer/trainer_registration/trainerRegistration_viewModel.dart';
import 'package:trainr/view/component/dialogs/loading_dialog.dart';

import '../../searchlocation/SearchLocationScreen.dart';
import '../components/bottomsheet/GenderBottomSheet.dart';
import '../components/bottomsheet/LanguagesBottomSheet.dart';

class TrainerRegistrationView extends StatelessWidget {
  List<GenderData> _genderList = [];
  List<LanguageData> _languagesList = [];
  late BuildContext _context;
  late TrainerRegistrationViewModel _viewModel;

  TrainerRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TrainerRegistrationViewModel(),
      onViewModelReady: (viewModel) {
        _context = context;
        _viewModel = viewModel;
        _getGenders();
      },
      builder: (context, TrainerRegistrationViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.backgroundColor,
          appBar: AppBar(
            backgroundColor: ThemeColor.backgroundColor,
            leading: IconButton(
                onPressed: () {
                  viewModel.navigateToRole();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: ThemeColor.textfieldColor,
                )),
            scrolledUnderElevation: 0,
          ),
          body: PopScope(
            canPop: false,
            onPopInvokedWithResult: (status, _) {
              if (!status) {
                viewModel.navigateToRole();
              }
            },
            child: SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 30, 18),
                    child: Text(
                      "Now let's make you a TRAINR.",
                      style: TextStyle(
                          color: ThemeColor.textfieldColor,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField("First name", null,
                                      null, null, viewModel.fNameController),
                                ),
                                Expanded(
                                  child: _buildTextField("Last name", null,
                                      null, null, viewModel.lNameController),
                                ),
                              ],
                            ),
                            _buildTextField("Email Address", double.infinity,
                                null, null, viewModel.emailController),
                            _buildTextField("Password", double.infinity, null,
                                null, viewModel.passController),
                            _buildTextField("Mobile no", double.infinity, null,
                                null, viewModel.mobileNoController),
                            buildDateField(context, viewModel),
                            _buildTextField("Nationality", double.infinity,
                                null, null, viewModel.nationalityController),
                            _buildTextField(
                                "Country of residence",
                                double.infinity,
                                null,
                                null,
                                viewModel.residenceController),
                            _selectLocation(viewModel),
                            _buildGenderField(context, viewModel),
                            _certificatesTextField(viewModel),
                            _nationalIdTextField(viewModel),
                            _languageDropDown(context, viewModel),
                            _languageNote()
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 30, top: 10, bottom: 20),
                      child: GestureDetector(
                        onTap: () async {
                          bool errorCheck = _viewModel.validateData();
                          if (errorCheck) {
                            _showLoader();

                            final registerResponse =
                                await _viewModel.registerTrainer();

                            if (registerResponse != null) {
                              if (registerResponse?.data != null) {
                                final uploadFileResponse = await _viewModel
                                    .uploadCertificatesAndNationalCertificate(
                                        registerResponse?.data?.trainerId ?? 0);

                                Navigator.pop(context);

                                if (uploadFileResponse?.statusCode == 200) {
                                  _viewModel
                                      .navigateToOtp(registerResponse?.data);
                                } else {
                                  Navigator.pop(context);
                                  _showError(uploadFileResponse?.statusMessage);
                                }
                              } else {
                                Navigator.pop(context);
                                _showError(registerResponse?.message);
                              }
                            } else {
                              Navigator.pop(context);
                              _showError(_viewModel.formErrorMsg);
                            }
                          }
                        },
                        child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(13.0),
                            decoration: BoxDecoration(
                                color: ThemeColor.textfieldColor,
                                borderRadius: BorderRadius.circular(10)
                                // borderRadius: BorderRadius.circular(10.0),
                                ),
                            child: const Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                    fontSize: 17,
                                    color: ThemeColor.backgroundColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(String labelText, double? width,
      [Widget? suffixIcon,
      double? rightPadding,
      TextEditingController? controller]) {
    rightPadding ??= 15;
    width ??= 0;
    return Padding(
      padding: EdgeInsets.only(top: 8, left: 15, right: rightPadding),
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
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }

  Widget buildDateField(
      BuildContext context, TrainerRegistrationViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
      child: InkWell(
        onTap: () async {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  colorScheme: ColorScheme.light(
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Colors.white,
                  ),
                ),
                child: child!,
              );
            },
          );

          if (selectedDate != null) {
            viewModel.selectDate(selectedDate);
          }
        },
        child: AbsorbPointer(
          child: Container(
            decoration: BoxDecoration(
              color: ThemeColor.primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: viewModel.dob ?? "Date of birth",
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 12.0),
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderField(
      BuildContext context, TrainerRegistrationViewModel viewModel) {
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
              onTap: () async {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return GenderBottomSheet(
                        title: "Gender",
                        dataList: _genderList,
                        role: "Trainer",
                        onItemClick: (gender) {
                          viewModel.selectGender(gender);
                        },
                      );
                    });
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    viewModel.selectedGender() ?? "Gender",
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

  Widget _certificatesTextField(TrainerRegistrationViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 45,
        width: double.infinity,
        child: TextFormField(
          onTap: () {
            viewModel.uploadCertificates();
          },
          readOnly: true,
          decoration: InputDecoration(
            hintText: viewModel.uploadedCertificate?.path.isNotEmpty == true
                ? "Certificates (Uploaded)"
                : 'Upload Certificates',
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
            suffixIcon: const Icon(Icons.upload),
          ),
        ),
      ),
    );
  }

  Widget _nationalIdTextField(TrainerRegistrationViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 45,
        width: double.infinity,
        child: TextFormField(
          onTap: () {
            viewModel.uploadNationalId();
          },
          readOnly: true,
          decoration: InputDecoration(
            hintText: viewModel.uploadedNationalId?.path.isNotEmpty == true
                ? "National ID (Uploaded)"
                : 'Upload National ID',
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 12.0),
            suffixIcon: const Icon(Icons.upload),
          ),
        ),
      ),
    );
  }

  Widget _languageDropDown(
      BuildContext context, TrainerRegistrationViewModel viewModel) {
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
                      return LanguagesBottomSheet(
                          title: "Languages",
                          dataList: _languagesList,
                          role: "Trainer",
                          onItemClick: (lang) {
                            viewModel.selectLanguage(lang);
                          });
                    });
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    viewModel.selectedLang() ?? "Language",
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

  Widget _languageNote() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(top: 5, left: 20),
      child: const Text(
        "(You can select more than one)",
        style: TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
      ),
    );
  }

  Widget _selectLocation(TrainerRegistrationViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 8, left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeColor.primaryColor,
      ),
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                final selectedLocation = await Navigator.push(
                    _context,
                    MaterialPageRoute(
                        builder: (context) => const SearchLocationScreen()));
                viewModel.setLocation(selectedLocation);
                print("data: $selectedLocation");
              },
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    viewModel.selectedLocation() ?? "Select Location",
                    style: const TextStyle(
                        fontSize: 14,
                        color: ThemeColor.backgroundColor,
                        fontWeight: FontWeight.w400),
                  )),
            ),
          ),
          const Icon(
            Icons.location_on,
            color: ThemeColor.backgroundColor,
            size: 25,
          ),
        ],
      ),
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

  void _getGenders() async {
    final response = await _viewModel.getGenders();
    print("babar: $response");

    if (response != null) {
      // hide loader
      _genderList = response.data ?? [];

      _getLanguages();
    } else {
      _showError(response?.message);
    }
  }

  void _getLanguages() async {
    final response = await _viewModel.getLanguages();
    print("babar: $response");

    if (response != null) {
      // hide loader
      _languagesList = response.data ?? [];
    } else {
      _showError(response?.message);
    }
  }

  void _showError(String? message) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Center(
      child: Text(message ?? "Something went wrong"),
    )));
  }
}
