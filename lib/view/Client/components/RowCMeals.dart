import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:trainr/assets/variables/themeColor.dart';

class RowCMeals extends StatelessWidget {
  final int index;
  final List plans;

  const RowCMeals({super.key, required this.index, required this.plans});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_mealText(), _headingList(), _mealsList()],
    );
  }

  Widget _mealText() {
    return SizedBox(
      height: 40,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Divider(
            color: ThemeColor.secondaryColor,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  color: ThemeColor.secondaryColor,
                  border: Border.all(color: ThemeColor.secondaryColor),
                  borderRadius: BorderRadius.circular(20)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: AutoSizeText(
                "Meal $index",
                style: const TextStyle(
                    color: ThemeColor.textfieldColor,
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
                    color: ThemeColor.secondaryColor,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "$quantity g",
                style: const TextStyle(
                    fontSize: 14, color: ThemeColor.secondaryColor),
              ),
              Text(
                "$cal g",
                style: const TextStyle(
                    fontSize: 14, color: ThemeColor.secondaryColor),
              ),
              Text(
                "$protein g",
                style: const TextStyle(
                    fontSize: 14, color: ThemeColor.secondaryColor),
              ),
              Text(
                "$carb g",
                style: const TextStyle(
                    fontSize: 14, color: ThemeColor.secondaryColor),
              ),
              Text(
                "$fat g",
                style: const TextStyle(
                    fontSize: 14, color: ThemeColor.secondaryColor),
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
      height: (50 * plans.length.toDouble()),
      child: ListView.builder(
          itemCount: plans.length,
          itemBuilder: (context, index) {
            final meal = plans[index];
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
