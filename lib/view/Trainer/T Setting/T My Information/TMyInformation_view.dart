import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/T%20Setting/T%20My%20Information/TMyInformation_viewModel.dart';
import 'package:trainr/view/component/bottomsheet/SelectSpecializationBottomSheet.dart';
import '../../../component/bottomsheet/SelectPersonalServicesBottomSheet.dart';
import '../../../component/dialogs/loading_dialog.dart';
import '../../../searchlocation/SearchLocationScreen.dart';
import '../../components/RowTrainerPersonalService.dart';
import '../../components/RowTrainerProfileSpecialization.dart';

class TMyInformationView extends StatelessWidget {
  TMyInformationView({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TMyinformationViewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.getTrainerProfileById();
          await viewModel.getSpecializations();
          await viewModel.getPersonalServices();
        },
        builder: (context, TMyinformationViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.backgroundColor,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: ThemeColor.textfieldColor,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.settings,
                        size: 30,
                        color: ThemeColor.primaryColor,
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, bottom: 4, top: 8),
                    child: Text(
                      "My Information",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ThemeColor.primaryColor),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              var result = await FilePicker.platform.pickFiles(
                                  allowMultiple: false, type: FileType.image);
                              if (result == null) {
                                print("No file selected");
                              } else {
                                final imageFile =
                                    File(result.files.single.path ?? "");

                                viewModel.selectProfileImage(imageFile);
                              }
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              alignment: Alignment.center,
                              child: viewModel.profileImage != null
                                  ? Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(
                                            File(
                                                viewModel?.profileImage?.path ??
                                                    ""),
                                            scale: 1.0,
                                          ),
                                        ),
                                      ),
                                    )
                                  : CachedNetworkImage(
                                      fit: BoxFit.contain,
                                      placeholder: (context, url) =>
                                          const CircularProgressIndicator(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                      imageUrl: viewModel.trainerProfileData
                                              ?.profileImage ??
                                          "",
                                      imageBuilder: (context, imageProvider) {
                                        return CircleAvatar(
                                          radius: 50,
                                          backgroundImage: imageProvider,
                                        );
                                      },
                                    ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            child: Text(
                              "First Name",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ThemeColor.textfieldColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              style: const TextStyle(
                                  color: ThemeColor.textColor, fontSize: 14),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  hintText: 'Enter First Name',
                                  hintStyle: TextStyle(
                                      color: ThemeColor.textColor,
                                      fontSize: 14)),
                              onChanged: (str) {
                                // viewModel.fName = str;
                              },
                              controller: viewModel.fNameController,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Last Name",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ThemeColor.textfieldColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              style: const TextStyle(
                                  color: ThemeColor.textColor, fontSize: 14),
                              onChanged: (str) {
                                // viewModel.lName = str;
                              },
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  hintText: 'Enter Last Name',
                                  hintStyle: TextStyle(
                                      color: ThemeColor.textColor,
                                      fontSize: 14)),
                              controller: viewModel.lNameController,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Email Address",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ThemeColor.textfieldColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              readOnly: true,
                              style: const TextStyle(
                                  color: ThemeColor.textColor, fontSize: 14),
                              onChanged: (str) {
                                // viewModel.email = str;
                              },
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  hintText: 'Enter email address',
                                  hintStyle: TextStyle(
                                      color: ThemeColor.textColor,
                                      fontSize: 14)),
                              controller: viewModel.emailController,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Phone Number",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ThemeColor.textfieldColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              style: const TextStyle(
                                  color: ThemeColor.textColor, fontSize: 14),
                              onChanged: (str) {
                                // viewModel.phone = str;
                              },
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  hintText: 'Enter Phone Number',
                                  hintStyle: TextStyle(
                                      color: ThemeColor.textColor,
                                      fontSize: 14)),
                              controller: viewModel.phoneController,
                            ),
                          ),
                          _buildDateField(context, viewModel),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ThemeColor.primaryColor,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              color: ThemeColor.textfieldColor,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      final selectedLocation = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SearchLocationScreen()));
                                      viewModel.setLocation(selectedLocation);
                                      print("data: $selectedLocation");
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.all(10),
                                        child: Text(
                                          viewModel.selectedLocation
                                                  ?.locationName ??
                                              "Select Location",
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
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Nationality",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ThemeColor.textfieldColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              style: const TextStyle(
                                  color: ThemeColor.textColor, fontSize: 14),
                              onChanged: (str) {
                                // viewModel.phone = str;
                              },
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  hintText: 'Enter Nationality',
                                  hintStyle: TextStyle(
                                      color: ThemeColor.textColor,
                                      fontSize: 14)),
                              controller: viewModel.nationalityController,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "Country Residence",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ThemeColor.textfieldColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              style: const TextStyle(
                                  color: ThemeColor.textColor, fontSize: 14),
                              onChanged: (str) {
                                // viewModel.phone = str;
                              },
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  hintText: 'Enter Country Residence',
                                  hintStyle: TextStyle(
                                      color: ThemeColor.textColor,
                                      fontSize: 14)),
                              controller: viewModel.residenceController,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              "About Me",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: ThemeColor.textfieldColor),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              maxLines: 5,
                              style: const TextStyle(
                                  color: ThemeColor.textColor, fontSize: 14),
                              onChanged: (str) {
                                // viewModel.phone = str;
                              },
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: ThemeColor.textfieldColor),
                                  ),
                                  hintText: 'Enter Description',
                                  hintStyle: TextStyle(
                                      color: ThemeColor.textColor,
                                      fontSize: 14)),
                              controller: viewModel.descriptionController,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 20, left: 20, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: viewModel
                                          .selectedSpecialization.isNotEmpty
                                      ? SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Wrap(
                                            direction: Axis.horizontal,
                                            children: List.generate(
                                              viewModel.selectedSpecialization
                                                  .length,
                                              (index) {
                                                final speciality = viewModel
                                                        .selectedSpecialization[
                                                    index];
                                                return RowTrainerProfileSpecialization(
                                                  specializationName:
                                                      speciality.name ?? "",
                                                  isEditable: viewModel
                                                      .isSpecializationEditable(),
                                                  onDeleteClick: () {
                                                    viewModel
                                                        .removeSpecialization(
                                                            speciality);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      : Container(
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "No specializations added",
                                            style: TextStyle(
                                                color:
                                                    ThemeColor.textfieldColor),
                                          ),
                                        ),
                                ),
                                viewModel.selectedSpecialization.isNotEmpty
                                    ? GestureDetector(
                                        onTap: () {
                                          viewModel.toggleSpecialization();
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: const Text(
                                            "Edit",
                                            style: TextStyle(
                                                color:
                                                    ThemeColor.textfieldColor,
                                                decorationColor:
                                                    ThemeColor.textfieldColor,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 14),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              backgroundColor:
                                                  ThemeColor.backgroundColor,
                                              context: context,
                                              builder: (ctx) {
                                                return SelectSpecializationBottomSheet(
                                                  dataList: viewModel
                                                      .specializationList,
                                                  role: "trainer",
                                                  onItemClick:
                                                      (specialization) {
                                                    viewModel
                                                        .setSpecializations(
                                                            specialization);
                                                  },
                                                );
                                              });
                                        },
                                        child: const Text(
                                          "Add",
                                          style: TextStyle(
                                              color: ThemeColor.textfieldColor,
                                              decorationColor:
                                                  ThemeColor.textfieldColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 14),
                                        ),
                                      )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                top: 10, left: 20, right: 20),
                            child: Row(
                              children: [
                                Expanded(
                                  child: viewModel
                                          .selectedPersonalServices.isNotEmpty
                                      ? SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Wrap(
                                            children: List.generate(
                                              viewModel.selectedPersonalServices
                                                  .length,
                                              (index) {
                                                final service = viewModel
                                                        .selectedPersonalServices[
                                                    index];
                                                return RowTrainerPersonalService(
                                                  serviceName:
                                                      service.name ?? "",
                                                  isEditable: viewModel
                                                      .isServiceEditable(),
                                                  onDeleteClick: () {
                                                    viewModel
                                                        .removeService(service);
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      : Container(
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "No training services added",
                                            style: TextStyle(
                                                color:
                                                    ThemeColor.textfieldColor),
                                          ),
                                        ),
                                ),
                                viewModel.selectedPersonalServices.isNotEmpty
                                    ? GestureDetector(
                                        onTap: () {
                                          viewModel.toggleServices();
                                        },
                                        child: Container(
                                          margin:
                                              const EdgeInsets.only(left: 10),
                                          child: const Text(
                                            "Edit",
                                            style: TextStyle(
                                                color:
                                                    ThemeColor.textfieldColor,
                                                decorationColor:
                                                    ThemeColor.textfieldColor,
                                                decoration:
                                                    TextDecoration.underline,
                                                fontSize: 14),
                                          ),
                                        ),
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              backgroundColor:
                                                  ThemeColor.backgroundColor,
                                              builder: (ctx) {
                                                return SelectPersonalServiceBottomSheet(
                                                  dataList: viewModel
                                                      .personalServicesList,
                                                  role: "trainer",
                                                  onItemClick: (services) {
                                                    viewModel
                                                        .setPersonalServices(
                                                            services);
                                                  },
                                                );
                                              });
                                        },
                                        child: const Text(
                                          "Add",
                                          style: TextStyle(
                                              color: ThemeColor.textfieldColor,
                                              decorationColor:
                                                  ThemeColor.textfieldColor,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 14),
                                        ),
                                      )
                              ],
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        final errorMessage =
                                            await viewModel.validateForm();
                                        if (errorMessage) {
                                          _showLoader();
                                          final response = await viewModel
                                              .updateTrainerProfile();

                                          Navigator.pop(context);

                                          if (response?.statusCode == 200) {
                                            Navigator.pop(context);
                                          } else {
                                            _showError(
                                                response?.statusMessage ??
                                                    "Something went wrong");
                                          }
                                        } else {
                                          _showError(viewModel.formErrorMsg);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            ThemeColor.textfieldColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                      ),
                                      child: Text(
                                        "Update",
                                        style: TextStyle(
                                          color: ThemeColor.backgroundColor,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.05,
                                        ),
                                      ),
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _buildDateField(
      BuildContext context, TMyinformationViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
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
              color: ThemeColor.textfieldColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: viewModel.dob ?? "Date of birth",
                hintStyle: const TextStyle(
                    fontSize: 14,
                    color: ThemeColor.backgroundColor,
                    fontWeight: FontWeight.w400),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 12.0),
                suffixIcon: const Icon(
                  Icons.calendar_today,
                  color: ThemeColor.darkBackgroundColor,
                ),
              ),
            ),
          ),
        ),
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

  void _showError(String? message) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Center(
      child: Text(message ?? "Something went wrong"),
    )));
  }
}
