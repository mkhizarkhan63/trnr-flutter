import 'package:flutter/material.dart';
import 'package:radio_group_v2/utils/radio_group_decoration.dart';
import 'package:radio_group_v2/widgets/views/radio_group.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/components/button.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Client%20Home/Client%20Create%20Class/ClientCreateC_viewModel.dart';
import 'package:trainr/view/Trainer/components/bottomsheet/ActivitiesBottomSheet.dart';

import '../../../../Trainer/components/bottomsheet/DropDownBottomSheet.dart';
import '../../../../component/dialogs/loading_dialog.dart';
import '../../../../searchlocation/SearchLocationScreen.dart';

class ClientCreateCView extends StatelessWidget {
  ClientCreateCView({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    const String role = "client";
    _context = context;
    return ViewModelBuilder.reactive(
        onViewModelReady: (viewModel) async {
          await viewModel.getActivities();
        },
        viewModelBuilder: () => ClientCreateCViewModel(),
        builder: (context, ClientCreateCViewModel viewModel, index) {
          return Scaffold(
              backgroundColor: ThemeColor.primaryColor,
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
                              Navigator.of(context).pop();
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: ThemeColor.secondaryColor,
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
                                border: InputBorder.none,
                                hintText: "Enter Title",
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            viewModel.datePicker(context);
                          },
                          child: Container(
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
                                              color: ThemeColor.secondaryColor,
                                              fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ),
                                const Icon(
                                  Icons.date_range_rounded,
                                  color: ThemeColor.secondaryColor,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            viewModel.timePicker(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ThemeColor.textfieldColor,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
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
                                              color: ThemeColor.secondaryColor,
                                              fontWeight: FontWeight.w400),
                                        )),
                                  ),
                                ),
                                const Icon(
                                  Icons.access_time_filled_sharp,
                                  color: ThemeColor.secondaryColor,
                                  size: 25,
                                ),
                              ],
                            ),
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
                                            color: ThemeColor.secondaryColor,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: ThemeColor.secondaryColor,
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
                                            color: ThemeColor.secondaryColor,
                                            fontWeight: FontWeight.w400),
                                      )),
                                ),
                              ),
                              const Icon(
                                Icons.arrow_drop_down,
                                color: ThemeColor.secondaryColor,
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
                        Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          child: RadioGroup(
                              controller: viewModel.genderTypeController,
                              values: viewModel.genderTypes,
                              onChanged: (newValue) => {},
                              decoration: RadioGroupDecoration(
                                fillColor: WidgetStateProperty.all(
                                    ThemeColor.secondaryColor),
                                overlayColor: WidgetStateProperty.all(
                                    ThemeColor.primaryColor),
                                labelStyle: const TextStyle(
                                    color: ThemeColor.secondaryColor,
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
                                    color: ThemeColor.secondaryColor,
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
                                  border: InputBorder.none,
                                  hintText: "Enter WhatsApp Link"),
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
                                _showLoader();
                                final response =
                                    await viewModel.createSession();

                                Navigator.pop(context);

                                if (response?.statusCode == 200) {
                                  Navigator.pop(context);
                                } else {
                                  _showError(response?.statusMessage ??
                                      "Something went wrong");
                                }
                              } else {
                                _showError(validate);
                              }
                            },
                            text: "Create Session",
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
