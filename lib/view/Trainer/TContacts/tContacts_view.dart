import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TContacts/tContacts_viewModel.dart';

import '../components/RowClients.dart';

class TContactsView extends StatelessWidget {
  const TContactsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => TContactsViewModel(),
      builder: (context, viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.backgroundColor,
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  _topContent(viewModel),
                  _divider(),
                  _searchBar(viewModel),
                  _loadClient(viewModel)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _topContent(TContactsViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          _clientContainer(),
          const Expanded(child: SizedBox()),
          _searchIcon(viewModel)
        ],
      ),
    );
  }

  Widget _searchIcon(TContactsViewModel viewModel) {
    return GestureDetector(
      onTap: () {
        viewModel.toggleSearch();
      },
      child: const Icon(
        Icons.search,
        color: ThemeColor.primaryColor,
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: const Divider(
        thickness: 2,
        color: ThemeColor.textfieldColor,
      ),
    );
  }

  Widget _searchBar(TContactsViewModel viewModel) {
    return viewModel.isSearchBarShown()
        ? Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: ThemeColor.textfieldColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
                controller: viewModel.searchTextController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                )),
          )
        : Container();
  }

  Widget _clientContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: ThemeColor.textfieldColor,
          borderRadius: BorderRadius.circular(5)),
      child: const Text(
        "Clients",
        style: TextStyle(
            color: ThemeColor.backgroundColor,
            fontSize: 16,
            fontWeight: FontWeight.w800),
      ),
    );
  }

  Widget _loadClient(TContactsViewModel viewModel) {
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return RowClients(
            onClientClick: () {
              viewModel.navigateToClientSection();
            },
            clientName: "",
          );
        },
      ),
    );
  }
}
