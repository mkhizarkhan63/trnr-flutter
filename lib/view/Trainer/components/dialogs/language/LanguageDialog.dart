import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/GetLanguagesResponse.dart';
import 'package:trainr/view/Trainer/components/bottomsheet/DropDownBottomSheet.dart';
import 'package:trainr/view/Trainer/components/bottomsheet/LanguagesBottomSheet.dart';
import 'package:trainr/view/Trainer/components/dialogs/language/LanguageViewModel.dart';

class LanguageDialog extends StatelessWidget {
  List<LanguageData> langauges;
  final Function(List<int>) onAddClick;

  LanguageDialog(
      {super.key, required this.langauges, required this.onAddClick});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => LanguageViewModel(),
        builder: (ctx, viewModel, index) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: ThemeColor.textfieldColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Wrap(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.close,
                            color: ThemeColor.textfieldColor,
                            size: 20,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Language",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ThemeColor.textfieldColor,
                        border: Border.all(color: ThemeColor.backgroundColor)),
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
                                      title: "Language",
                                      dataList: langauges,
                                      role: "Trainer",
                                      onItemClick: (lang) {
                                        viewModel.setLanguage(lang);
                                      },
                                    );
                                  });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  viewModel
                                      .selectedLang()
                                      .map((lang) => lang.name)
                                      .join(","),
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
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () {
                          onAddClick(viewModel
                              .selectedLang()
                              .map((lang) => lang.id ?? 0)
                              .toList());
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Add",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ThemeColor.textfieldColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
