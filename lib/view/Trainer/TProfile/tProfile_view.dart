import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';

import '../TBottomNav/tBottomNav_viewModel.dart';

class TProfileView extends StatelessWidget {
  const TProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TBottomNavViewModel(),
        builder: (context, TBottomNavViewModel viewModel, index) {
          return PopScope(
            canPop: false,
            onPopInvoked: (status) {
              if (!status) {
                if (viewModel.navIndex != 0) {
                  viewModel.navIndex = 0;
                  viewModel.selectBottomTab(i: viewModel.navIndex);
                } else {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else {
                    exit(0);
                  }
                }
              }
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ThemeColor.backgroundColor,
              body: viewModel.screenList[viewModel.navIndex],
              bottomNavigationBar: _bottomBar(viewModel),
            ),
          );
        });
  }

  Widget _bottomBar(TBottomNavViewModel viewModel) {
    return BottomAppBar(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 0),
      color: ThemeColor.darkBackgroundColor,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double iconSize = constraints.maxWidth / 8;

          return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  children: List.generate(viewModel.bottomTabs.length, (index) {
                return Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: viewModel.bottomTabs[index]["selected"]
                              ? ThemeColor.primaryColor
                              : ThemeColor.darkBackgroundColor,
                          width: 5,
                        ),
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        viewModel.selectBottomTab(i: index);
                      },
                      icon: Image.asset(
                        viewModel.bottomTabs[index]['icon'],
                        // "lib/assets/Icons/calender.png",
                        width: iconSize,
                        height: iconSize,
                        color: ThemeColor.primaryColor,
                      ),
                    ),
                  ),
                );
              })));
        },
      ),
    );
  }
}
