import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/client_registration/registration_viewModel.dart';

import '../../../models/GetGenderResponse.dart';
import '../../Trainer/components/bottomsheet/GenderBottomSheet.dart';
import '../../component/dialogs/loading_dialog.dart';
import '../../searchlocation/SearchLocationScreen.dart';

class RegistrationView extends StatelessWidget {
  RegistrationView({super.key});

  List<GenderData> _genderList = [];
  late BuildContext _context;
  late RegistrationViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => RegistrationViewModel(),
      onViewModelReady: (viewModel) {
        _context = context;
        _viewModel = viewModel;
        _getGenders();
      },
      builder: (context, RegistrationViewModel viewModel, index) {
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
          body: SafeArea(
            child: PopScope(
              canPop: false,
              onPopInvoked: (status) {
                if (!status) {
                  viewModel.navigateToRole();
                }
              },
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 30, 18), // top 38,
                    child: Text(
                      "Now let's make you a Member. ",
                      style: TextStyle(
                        fontSize: 32,
                        color: ThemeColor.textfieldColor,
                        fontWeight: FontWeight.bold,
                      ),
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
                                      null, 1, viewModel.firstNameController),
                                ),
                                Expanded(
                                  child: _buildTextField("Last name", null,
                                      null, null, viewModel.lastNameController),
                                ),
                              ],
                            ),
                            _buildTextField("Email Address", double.infinity,
                                null, null, viewModel.emailController),
                            _buildTextField("Password", double.infinity, null,
                                null, viewModel.passController),
                            _buildTextField("Mobile no", double.infinity, null,
                                null, viewModel.mobileNoController),
                            // _buildDateField(context),
                            _buildDateField(context, viewModel),
                            _buildTextField("Nationality", double.infinity,
                                null, null, viewModel.nationalityController),
                            _buildTextField(
                                "Country of residence",
                                double.infinity,
                                null,
                                null,
                                viewModel.residenceController),
                            _buildGenderField(context, viewModel),
                            _selectLocation(viewModel)
                            // _buildTextField("Gender", double.infinity),
                            // _buildGenderField(context, gender),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 30, top: 10, bottom: 45),
                      child: GestureDetector(
                        onTap: () async {
                          bool errorCheck = _viewModel.validateData();
                          if (errorCheck) {
                            _showLoader();

                            final response = await _viewModel.registerClient();
                            Navigator.pop(_context);
                            if (response?.data != null) {
                              _viewModel.navigateToClientOtp(response?.data);
                            } else {
                              _showError(response?.message);
                            }
                          } else {
                            _showError(_viewModel.formErrorMsg);
                          }
                        },
                        child: Container(
                            width: 100,
                            padding: EdgeInsets.all(13.0),
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

  Widget _buildDateField(
      BuildContext context, RegistrationViewModel viewModel) {
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
      BuildContext context, RegistrationViewModel viewModel) {
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

  Widget _selectLocation(RegistrationViewModel viewModel) {
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
