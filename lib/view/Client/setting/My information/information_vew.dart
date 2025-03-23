import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/components/RowClientPersonalService.dart';
import 'package:trainr/view/Client/setting/My%20information/information_ViewModel.dart';
import '../../../component/bottomsheet/SelectPersonalServicesBottomSheet.dart';
import '../../../component/bottomsheet/SelectSpecializationBottomSheet.dart';
import '../../../component/dialogs/loading_dialog.dart';
import '../../../searchlocation/SearchLocationScreen.dart';
import '../../components/RowClientProfileSpecialization.dart';

class InformationView extends StatelessWidget {
  InformationView({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return ViewModelBuilder.reactive(
      viewModelBuilder: () => InformationViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getClientProfile();
        await viewModel.getSpecializations();
        await viewModel.getPersonalServices();
      },
      builder: (context, InformationViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.primaryColor,
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
                          color: ThemeColor.secondaryColor,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.settings,
                      size: 30,
                      color: ThemeColor.secondaryColor,
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
                        color: ThemeColor.secondaryColor),
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
                                          File(viewModel?.profileImage?.path ??
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
                                    imageUrl:
                                        viewModel.clientData?.profileImage ??
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          child: Text(
                            "First Name",
                            style: TextStyle(
                                fontSize: 18, color: ThemeColor.secondaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            style: const TextStyle(
                                color: ThemeColor.fontColor, fontSize: 14),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                hintText: 'Enter First Name',
                                hintStyle: TextStyle(
                                    color: ThemeColor.fontColor, fontSize: 14)),
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
                                fontSize: 18, color: ThemeColor.secondaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            style: const TextStyle(
                                color: ThemeColor.fontColor, fontSize: 14),
                            onChanged: (str) {
                              // viewModel.lName = str;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                hintText: 'Enter Last Name',
                                hintStyle: TextStyle(
                                    color: ThemeColor.fontColor, fontSize: 14)),
                            controller: viewModel.lNameController,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Email Address",
                            style: TextStyle(
                                fontSize: 18, color: ThemeColor.secondaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            readOnly: true,
                            style: const TextStyle(
                                color: ThemeColor.fontColor, fontSize: 14),
                            onChanged: (str) {
                              // viewModel.email = str;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                hintText: 'Enter email address',
                                hintStyle: TextStyle(
                                    color: ThemeColor.fontColor, fontSize: 14)),
                            controller: viewModel.emailController,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Phone Number",
                            style: TextStyle(
                                fontSize: 18, color: ThemeColor.secondaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            style: const TextStyle(
                                color: ThemeColor.fontColor, fontSize: 14),
                            onChanged: (str) {
                              // viewModel.phone = str;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                hintText: 'Enter Phone Number',
                                hintStyle: TextStyle(
                                    color: ThemeColor.fontColor, fontSize: 14)),
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
                                        viewModel.selectedLocation() ??
                                            "Select Location",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: ThemeColor.secondaryColor,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              ),
                              const Icon(
                                Icons.location_on,
                                color: ThemeColor.secondaryColor,
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
                                fontSize: 18, color: ThemeColor.secondaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            style: const TextStyle(
                                color: ThemeColor.fontColor, fontSize: 14),
                            onChanged: (str) {
                              // viewModel.phone = str;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                hintText: 'Enter Nationality',
                                hintStyle: TextStyle(
                                    color: ThemeColor.fontColor, fontSize: 14)),
                            controller: viewModel.nationalityController,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Text(
                            "Country Residence",
                            style: TextStyle(
                                fontSize: 18, color: ThemeColor.secondaryColor),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            style: const TextStyle(
                                color: ThemeColor.fontColor, fontSize: 14),
                            onChanged: (str) {
                              // viewModel.phone = str;
                            },
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeColor.secondaryColor),
                                ),
                                hintText: 'Enter Country Residence',
                                hintStyle: TextStyle(
                                    color: ThemeColor.fontColor, fontSize: 14)),
                            controller: viewModel.residenceController,
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
                                            viewModel
                                                .selectedSpecialization.length,
                                            (index) {
                                              final speciality = viewModel
                                                      .selectedSpecialization[
                                                  index];
                                              return RowClientProfileSpecialization(
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
                                              color: ThemeColor.secondaryColor),
                                        ),
                                      ),
                              ),
                              viewModel.selectedSpecialization.isNotEmpty
                                  ? GestureDetector(
                                      onTap: () {
                                        viewModel.toggleSpecialization();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          "Edit",
                                          style: TextStyle(
                                              color: ThemeColor.secondaryColor,
                                              decorationColor:
                                                  ThemeColor.secondaryColor,
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
                                                ThemeColor.textfieldColor,
                                            context: context,
                                            builder: (ctx) {
                                              return SelectSpecializationBottomSheet(
                                                dataList: viewModel
                                                    .specializationList,
                                                role: "client",
                                                onItemClick: (specialization) {
                                                  viewModel.setSpecializations(
                                                      specialization);
                                                },
                                              );
                                            });
                                      },
                                      child: const Text(
                                        "Add",
                                        style: TextStyle(
                                            color: ThemeColor.secondaryColor,
                                            decorationColor:
                                                ThemeColor.secondaryColor,
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
                                              return RowClientPersonalService(
                                                serviceName: service.name ?? "",
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
                                              color: ThemeColor.secondaryColor),
                                        ),
                                      ),
                              ),
                              viewModel.selectedPersonalServices.isNotEmpty
                                  ? GestureDetector(
                                      onTap: () {
                                        viewModel.toggleServices();
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: const Text(
                                          "Edit",
                                          style: TextStyle(
                                              color: ThemeColor.secondaryColor,
                                              decorationColor:
                                                  ThemeColor.secondaryColor,
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
                                                ThemeColor.textfieldColor,
                                            builder: (ctx) {
                                              return SelectPersonalServiceBottomSheet(
                                                dataList: viewModel
                                                    .personalServicesList,
                                                role: "client",
                                                onItemClick: (services) {
                                                  viewModel.setPersonalServices(
                                                      services);
                                                },
                                              );
                                            });
                                      },
                                      child: const Text(
                                        "Add",
                                        style: TextStyle(
                                            color: ThemeColor.secondaryColor,
                                            decorationColor:
                                                ThemeColor.secondaryColor,
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
                                            .updateClientProfile();

                                        Navigator.pop(context);

                                        if (response?.statusCode == 200) {
                                          Navigator.pop(context);
                                        } else {
                                          _showError(response?.statusMessage ??
                                              "Something went wrong");
                                        }
                                      } else {
                                        _showError(viewModel.formErrorMsg);
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          ThemeColor.secondaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                    ),
                                    child: Text(
                                      "Update",
                                      style: TextStyle(
                                        color: ThemeColor.textfieldColor,
                                        fontSize:
                                            MediaQuery.of(context).size.width *
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
      },
    );
  }

  Widget _buildDateField(BuildContext context, InformationViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: InkWell(
        onTap: () async {},
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
                    color: ThemeColor.secondaryColor,
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
