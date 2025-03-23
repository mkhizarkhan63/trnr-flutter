import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/models/DataModel.dart';

import '../../../models/SalesData.dart';
import '../TClientSection/DailyProgress/Data/DataViewModel.dart';


class RowData extends StatelessWidget {
  DataModel? _model;
  DataViewModel? _viewModel;
  int _index = -1;

  RowData(
      {super.key,
      required DataModel data,
      required DataViewModel viewModel,
      required int index}) {
    _model = data;
    _viewModel = viewModel;
    _index = index;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _viewModel!.expand(_index);
      },
      child: Wrap(
        children: [
          const Divider(
            color: ThemeColor.textfieldColor,
          ),
          _header(),
          const Divider(
            color: ThemeColor.textfieldColor,
          ),
          _model!.isExpanded ? _monthWeek() : Container(),
          _model!.isExpanded ? _lineChartDetails() : Container()
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
              child: Text(
            "${_model!.title}",
            style:
                const TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
          )),
          Container(
            margin: const EdgeInsets.only(left: 10),
            child: _model!.isExpanded
                ? const Icon(
                    Icons.keyboard_arrow_up_sharp,
                    color: ThemeColor.textfieldColor,
                  )
                : const Icon(Icons.keyboard_arrow_down_sharp,
                    color: ThemeColor.textfieldColor),
          )
        ],
      ),
    );
  }

  Widget _monthWeek() {
    return Row(
      children: [
        Expanded(
          child: Text(
            _model!.isMonthView
                ? _model!.months[_model!.counter]
                : _model!.weekDays[_model!.counter],
            style:
                const TextStyle(color: ThemeColor.textfieldColor, fontSize: 14),
          ),
        ),
        _toggle(),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                _viewModel!.previousDay(_index);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: ThemeColor.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _viewModel!.nextDay(_index);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    color: ThemeColor.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.all(5),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _toggle() {
    return Container(
      padding: const EdgeInsets.all(2),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          _toggleMonth(),
          _toggleWeek(),
        ],
      ),
    );
  }

  Widget _toggleMonth() {
    return GestureDetector(
      onTap: () {
        _viewModel!.toggleMonthWeek(_index, true);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _model!.isMonthView ? Colors.white : Colors.black),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Month",
            style: TextStyle(
                color: _model!.isMonthView ? Colors.black : Colors.white,
                fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget _toggleWeek() {
    return GestureDetector(
      onTap: () {
        _viewModel!.toggleMonthWeek(_index, false);
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _model!.isMonthView ? Colors.black : Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            "Week",
            style: TextStyle(
                color: _model!.isMonthView ? Colors.white : Colors.black,
                fontSize: 10),
          ),
        ),
      ),
    );
  }

  Widget _lineChartDetails() {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: SfCartesianChart(
                  primaryXAxis: const CategoryAxis(
                      labelStyle: TextStyle(fontSize: 10),
                      rangePadding: ChartRangePadding.auto),
                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                        color: ThemeColor.textfieldColor,
                        // Bind data source
                        dataSource: _model!.isMonthView
                            ? _model!.monthData
                            : _model!.weekData,
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales)
                  ]),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                    "Average weight for the ${_model!.isMonthView ? "month" : "week"}: ${_model!.isMonthView ? _model!.avgMonthValue : _model!.avgWeekValue}",
                    style: const TextStyle(
                        fontSize: 12, color: ThemeColor.textColor))),
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: Text(
                    "Difference from last ${_model!.isMonthView ? "month" : "week"}: ${_model!.isMonthView ? _model!.lastMonthValue : _model!.lastWeekValue}",
                    style: const TextStyle(
                        fontSize: 12, color: ThemeColor.textColor)))
          ],
        ));
  }
}
