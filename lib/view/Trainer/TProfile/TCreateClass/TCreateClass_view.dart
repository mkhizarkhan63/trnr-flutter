import 'package:flutter/material.dart';
import 'package:radio_group_v2/utils/radio_group_decoration.dart';
import 'package:radio_group_v2/widgets/views/radio_group.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/components/button.dart';
import 'package:trainr/view/Trainer/TProfile/TCreateClass/TCreateClass_viewModel.dart';
import 'package:trainr/view/Trainer/components/bottomsheet/DropDownBottomSheet.dart';
import 'package:trainr/view/searchlocation/SearchLocationScreen.dart';

import '../../../component/dialogs/loading_dialog.dart';
import '../../components/bottomsheet/ActivitiesBottomSheet.dart';

class TCreateClassView extends StatelessWidget {
  TCreateClassView({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    const String role = "trainer";
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TCreateClassViewModel(),
        onViewModelReady: (viewModel) async {
          viewModel.getSessionData();
          await viewModel.getActivities();
        },
        builder: (context, TCreateClassViewModel viewModel, index) {
          return Scaffold(
              backgroundColor: ThemeColor.backgroundColor,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: ThemeColor.textfieldColor,
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                              color: ThemeColor.textfieldColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              controller: viewModel.titleController,
                              decoration: const InputDecoration(
                                  hintText: "Enter Title",
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ThemeColor.textfieldColor,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    viewModel.datePicker(context);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        viewModel.dateController.value.text !=
                                                ""
                                            ? viewModel
                                                .dateController.value.text
                                            : "Select Date",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: ThemeColor.backgroundColor,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              ),
                              const Icon(
                                Icons.date_range_rounded,
                                color: ThemeColor.backgroundColor,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ThemeColor.textfieldColor,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    viewModel.timePicker(context);
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        viewModel.timeController.value.text !=
                                                ""
                                            ? viewModel
                                                .timeController.value.text
                                            : "Select Time",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: ThemeColor.backgroundColor,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              ),
                              const Icon(
                                Icons.access_time_filled_sharp,
                                color: ThemeColor.backgroundColor,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ThemeColor.textfieldColor,
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
                                          return ActivitiesBottomSheet(
                                            title: "Activities",
                                            dataList: viewModel.activities,
                                            role: "Trainer",
                                            onItemClick: (activity) {
                                              viewModel.setActivity(activity);
                                            },
                                          );
                                        });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        viewModel.selectedActivity() ??
                                            "Select Activity",
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
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ThemeColor.textfieldColor,
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
                                            title: "Capacity",
                                            dataList: viewModel.capacities,
                                            role: "Trainer",
                                            onItemClick: (capacity) {
                                              viewModel.setCapacity(capacity);
                                            },
                                          );
                                        });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        viewModel.selectedCapacity() ??
                                            "Select Capacity",
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
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
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
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: RadioGroup(
                              controller: viewModel.genderTypeController,
                              values: viewModel.genderTypes,
                              indexOfDefault: viewModel.findIndexForClassType(),
                              onChanged: (newValue) => {},
                              decoration: RadioGroupDecoration(
                                fillColor: WidgetStateProperty.all(
                                    ThemeColor.textfieldColor),
                                overlayColor: WidgetStateProperty.all(
                                    ThemeColor.primaryColor),
                                labelStyle: const TextStyle(
                                    color: ThemeColor.textfieldColor,
                                    fontSize: 18),
                              )),
                        ),
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ThemeColor.textfieldColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              controller: viewModel.descriptionController,
                              maxLines: 5,
                              maxLength: 250,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  hintText: "Enter Description",
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ThemeColor.textfieldColor,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: viewModel.priceController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    hintText: "Enter Price",
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Text(
                                "AED",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: ThemeColor.backgroundColor,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ThemeColor.textfieldColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: TextField(
                              controller: viewModel.whatsAppLinkController,
                              decoration: const InputDecoration(
                                  hintText: "Enter WhatsApp Link",
                                  border: InputBorder.none),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: MyButton(
                            onTap: () async {
                              final validate = await viewModel.validateForm();

                              if (validate.isEmpty) {
                                if (viewModel.isUpdate) {
                                  _showLoader();
                                  final response =
                                      await viewModel.updateSession();

                                  Navigator.pop(context);

                                  if (response?.statusCode == 200) {
                                    Navigator.pop(context, true);
                                  } else {
                                    _showError(response?.statusMessage ??
                                        "Something went wrong");
                                  }
                                } else {
                                  _showLoader();
                                  final response =
                                      await viewModel.createSession();

                                  Navigator.pop(context);

                                  if (response?.statusCode == 200) {
                                    Navigator.pop(context, true);
                                  } else {
                                    _showError(response?.statusMessage ??
                                        "Something went wrong");
                                  }
                                }
                              } else {
                                _showError(validate);
                              }
                            },
                            text:
                                "${viewModel.isUpdate ? "Update" : "Create"} Session",
                            role: role,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
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
