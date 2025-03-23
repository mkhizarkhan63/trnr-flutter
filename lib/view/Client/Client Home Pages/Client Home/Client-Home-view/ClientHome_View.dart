import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/Client%20Bottombar/Client_Bottombar_viewModel.dart';

class ClientHomeView extends StatelessWidget {
  const ClientHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ClientBottombarViewModel(),
        builder: (ctx, viewModel, index) {
          return PopScope(
            canPop: false,
            onPopInvokedWithResult: (status, _) {
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
              backgroundColor: ThemeColor.primaryColor,
              body: viewModel.screensList[viewModel.navIndex],
              bottomNavigationBar: _bottomBar(viewModel),
            ),
          );
        });
  }

  Widget _bottomBar(ClientBottombarViewModel viewModel) {
    return BottomAppBar(
      height: 50,
      padding: const EdgeInsets.only(left: 20, right: 20),
      color: Colors.black,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double iconSize = constraints.maxWidth / 8;
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                viewModel.bottomTabs.length,
                (index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: viewModel.bottomTabs[index]['selected']
                              ? Colors.white
                              : Colors.black,
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
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
