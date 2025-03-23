import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowMeals extends StatelessWidget {
  final int index;
  final List? plans;
  final bool isEditable;
  final Function() onDeleteClick;

  const RowMeals(
      {super.key,
      required this.index,
      required this.plans,
      required this.isEditable,
      required this.onDeleteClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_mealText(), _headingList(), _mealsList()],
    );
  }

  Widget _deleteIcon() {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: isEditable ? onDeleteClick : null,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            Icons.delete,
            color: isEditable
                ? ThemeColor.textfieldColor
                : ThemeColor.backgroundColor,
          ),
        ),
      ),
    );
  }

  Widget _mealText() {
    return SizedBox(
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(
            color: ThemeColor.primaryColor,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: ThemeColor.backgroundColor,
                  border: Border.all(color: ThemeColor.primaryColor),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: AutoSizeText(
                "Meal $index",
                style: const TextStyle(
                    color: ThemeColor.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _mealPlan(name, quantity, cal, protein, carb, fat) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                name,
                style: const TextStyle(
                    fontSize: 16,
                    color: ThemeColor.textfieldColor,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "$quantity g",
                style: const TextStyle(
                    fontSize: 14, color: ThemeColor.textfieldColor),
              ),
              Text(
                "$cal g",
                style: const TextStyle(
                    fontSize: 14, color: ThemeColor.textfieldColor),
              ),
              Text(
                "$protein g",
                style: const TextStyle(
                    fontSize: 14, color: ThemeColor.textfieldColor),
              ),
              Text(
                "$carb g",
                style: const TextStyle(
                    fontSize: 14, color: ThemeColor.textfieldColor),
              ),
              Text(
                "$fat g",
                style: const TextStyle(
                    fontSize: 14, color: ThemeColor.textfieldColor),
              )
            ],
          ),
          const Divider()
        ],
      ),
    );
  }

  Widget _headingList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          _deleteIcon(),
          _heading("Qty", Colors.black),
          _heading("Kcal", Colors.green),
          _heading("Protein", Colors.blue),
          _heading("Carbs", Colors.orange),
          _heading("Fat", Colors.brown)
        ],
      ),
    );
  }

  Widget _mealsList() {
    return SizedBox(
      height: (50 * plans!.length.toDouble()),
      child: ListView.builder(
          itemCount: plans!.length,
          itemBuilder: (context, index) {
            final meal = plans![index];
            print(meal);
            return _mealPlan(meal["name"], meal["quantity"], meal["cal"],
                meal["protein"], meal["carb"], meal["fat"]);
          }),
    );
  }

  Widget _heading(String heading, Color color) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              color: ThemeColor.textfieldColor,
              borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: AutoSizeText(
            heading,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14,
              decoration: TextDecoration.underline,
              decorationColor: color,
              color: color,
            ),
          )),
    );
  }
}
