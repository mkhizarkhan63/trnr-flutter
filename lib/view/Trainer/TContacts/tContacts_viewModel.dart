import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class TContactsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  bool isDataLoaded = false;
  bool _isSearchBarShown = false;

  final searchTextController = TextEditingController(text: "");

  navigateToRequestView() {
    _navigationService.navigateToRequestView();
  }

  List<Map> tabs = [
    {
      'name': const Text('Clients'),
      'color': Colors.white,
      'fontColor': Colors.white,
      'selected': true,
    },
    {
      'name': const Text(
        'Requests',
      ),
      'color': Colors.black,
      'fontColor': Colors.white,
      'selected': false,
    },
  ];

  var searchSelected = false;

  changeTabColor({required int i}) {
    final color = tabs[i]['color'];

    if (tabs[i]['selected'] == false) {
      for (var x = 0; x < tabs.length; x++) {
        tabs[x]['color'] = Colors.black;
        tabs[x]['selected'] = false;
      }

      if (color == Colors.white) {
        tabs[i]['color'] = Colors.black;
      } else {
        tabs[i]['color'] = Colors.white;
      }
      tabs[i]['selected'] = true;
    }

    rebuildUi();
  }

  toggleSearch() {
    _isSearchBarShown = !_isSearchBarShown;

    rebuildUi();
  }

  isSearchBarShown() {
    return _isSearchBarShown;
  }

  navigateToClientSection() {
    _navigationService.navigateToTClientSectionView();
  }
}
