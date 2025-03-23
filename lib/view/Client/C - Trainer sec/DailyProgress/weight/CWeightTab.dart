import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../../assets/variables/themeColor.dart';
import '../../../../../models/SalesData.dart';
import 'CWeightViewModel.dart';

class CWeightTab extends StatelessWidget {
  CWeightTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CWeightViewModel(),
        builder: (context, CWeightViewModel viewModel, index) {
          return Scaffold(
            backgroundColor: ThemeColor.primaryColor,
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _topContent(context, viewModel),
                  _lineChartWithDetails(viewModel)
                ],
              ),
            ),
          );
        });
  }

  Widget _topContent(BuildContext context, CWeightViewModel viewModel) {
    return Row(
      children: [
        _monthWeekText(viewModel),
        _toggle(viewModel),
        _backForwardButtons(viewModel)
      ],
    );
  }

  Widget _toggle(CWeightViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          _toggleMonth(viewModel),
          _toggleWeek(viewModel),
        ],
      ),
    );
  }

  Widget _monthWeekText(CWeightViewModel viewModel) {
    return Expanded(
      child: viewModel.isMonthView
          ? const Text(
              "Jan,2024",
              style: TextStyle(color: ThemeColor.secondaryColor, fontSize: 14),
            )
          : const Text(
              "27 - 02 Jun,2024",
              style: TextStyle(color: ThemeColor.secondaryColor, fontSize: 14),
            ),
    );
  }

  Widget _toggleMonth(CWeightViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.toggleMonthWeek(true);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: viewModel.isMonthView ? Colors.white : Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Month",
            style: TextStyle(
                color: viewModel.isMonthView ? Colors.black : Colors.white,
                fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget _toggleWeek(CWeightViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.toggleMonthWeek(false);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: viewModel.isMonthView ? Colors.black : Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Week",
            style: TextStyle(
                color: viewModel.isMonthView ? Colors.white : Colors.black,
                fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget _backForwardButtons(CWeightViewModel viewModel) {
    return Row(
      children: [_backButton(), _forwardButton()],
    );
  }

  Widget _backButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
            color: ThemeColor.secondaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: ThemeColor.textfieldColor,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _forwardButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: ThemeColor.secondaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(5),
          child: Icon(
            Icons.arrow_forward_ios,
            color: ThemeColor.textfieldColor,
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _lineChartWithDetails(CWeightViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: SfCartesianChart(
                primaryXAxis: const CategoryAxis(
                    labelStyle: TextStyle(fontSize: 10),
                    rangePadding: ChartRangePadding.auto),
                series: <LineSeries<SalesData, String>>[
                  LineSeries<SalesData, String>(
                      color: ThemeColor.secondaryColor,
                      // Bind data source
                      dataSource: <SalesData>[
                        SalesData("Jan", 0),
                        SalesData("Feb", 28),
                        SalesData("Mar", 34),
                        SalesData("Apr", 32),
                        SalesData("May", 40),
                        SalesData("June", 50),
                        SalesData("July", 55),
                        SalesData("Aug", 58),
                        SalesData("Sept", 82),
                        SalesData("Oct", 83),
                        SalesData("Nov", 84),
                        SalesData("Dec", 90),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales)
                ]),
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                  "Average weight for the ${viewModel.isMonthView ? "month" : "week"}: ${viewModel.averageWeight}",
                  style: const TextStyle(
                      fontSize: 12, color: ThemeColor.secondaryColor))),
          Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                  "Difference from last ${viewModel.isMonthView ? "month" : "week"}: ${viewModel.lastWeekWeight}",
                  style: const TextStyle(
                      fontSize: 12, color: ThemeColor.secondaryColor)))
        ],
      ),
    );
  }
}
