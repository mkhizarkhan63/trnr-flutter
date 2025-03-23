import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../assets/variables/themeColor.dart';
import '../../../../../models/trainer_model.dart';
import '../../../components/CustomHorizontalCalendar.dart';
import '../../../components/RowCommunity.dart';
import '../../../components/RowTrainer.dart';
import '../../../components/dialog/searchlocation/SearchLocationDialog.dart';
import '../../../components/dialog/sortby/SortByDialog.dart';
import 'ClientHome_ViewModel.dart';

class ClientHomeContentView extends StatelessWidget {
  const ClientHomeContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ClientHomeViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getFirebaseToken();

        final currentLoc = await viewModel.getCurrentLocation();
        final currentDate =
            "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}";
        viewModel.selectedDate = currentDate;

        await viewModel.getAllSessions(currentDate);

        print(currentDate);

        if (currentLoc.latitude != 0.0 && currentLoc.longitude != 0.0) {
          print("lat long: $currentLoc");
        }
      },
      builder: (context, ClientHomeViewModel viewModel, index) {
        return Scaffold(
          backgroundColor: ThemeColor.primaryColor,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          onTap: () {
                            viewModel.navigateToClientProfileView();
                          },
                          child: Builder(builder: (context) {
                            return CachedNetworkImage(
                              fit: BoxFit.contain,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageUrl:
                                  'https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg',
                              imageBuilder: (context, imageProvider) {
                                return CircleAvatar(
                                  radius:
                                      MediaQuery.of(context).size.width * 0.05,
                                  backgroundImage: imageProvider,
                                );
                              },
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 45,
                          padding: const EdgeInsets.only(
                            left: 10,
                            top: 0,
                            bottom: 0,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeColor.textfieldColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      ),
                      Stack(children: [
                        Positioned(
                            right: 0,
                            child: Container(
                              width: 15,
                              height: 15,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: const BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: const Center(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            )),
                        Align(
                          alignment: Alignment.center,
                          child: IconButton(
                            icon: const Icon(Icons.notifications),
                            onPressed: () {
                              viewModel.navigateToNotificationView();
                            },
                          ),
                        )
                      ]),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            height: 40,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ThemeColor.secondaryColor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return const SortByDialog();
                                    });
                              },
                              child: const Center(
                                  child: Text(
                                "Sort By",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15.5),
                              )),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: GestureDetector(
                            onTap: () {
                              viewModel.toggleSection();
                            },
                            child: Container(
                              height: 40,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ThemeColor.secondaryColor,
                              ),
                              child: Center(
                                child: AutoSizeText(
                                  viewModel.isTrainer()
                                      ? "Community"
                                      : "Trainers",
                                  maxLines: 1,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ThemeColor.secondaryColor,
                            ),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return const SearchLocationDialog();
                                    });
                              },
                              child: const Center(
                                child: Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ThemeColor.secondaryColor,
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () async {
                            final data = await viewModel.navigateToFilterView();

                            if (data) {
                              if (viewModel.isTrainer()) {
                              } else {
                                await viewModel
                                    .getAllSessions(viewModel.selectedDate);
                              }
                            }
                            print("filter data: $data");
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: ThemeColor.secondaryColor,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.filter_alt_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: viewModel.isTrainer()
                        ? _getTrainers(viewModel)
                        : _communitySection(context, viewModel))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _communitySection(
      BuildContext context, ClientHomeViewModel viewModel) {
    return Column(
      children: [
        CustomHorizontalCalendar(
          locale: const Locale("en", "us"),
          onDateSelected: (selectedDate) async {
            final currentDate =
                "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";

            viewModel.selectedDate = currentDate;

            await viewModel.getAllSessions(currentDate);
            print("babar: $selectedDate");
          },
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.add_circle,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  viewModel.navigateTOClientCreateCView();
                },
                child: const Text(
                  "Create class",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        const Divider(),
        Expanded(
            child: viewModel.sessionList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.sessionList.length,
                    itemBuilder: (context, index) {
                      final session = viewModel.sessionList[index];
                      return RowCommunity(
                          data: session,
                          onCommunityClick: () {
                            viewModel.navigateTOCBookSpotView(session);
                          });
                    },
                  )
                : Container(
                    alignment: Alignment.center,
                    child: const Text(
                      textAlign: TextAlign.center,
                      "No community found",
                      style: TextStyle(
                          color: ThemeColor.fontColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ))
      ],
    );
  }

  Widget _getTrainers(ClientHomeViewModel viewModel) {
    return FutureBuilder(
      future: viewModel.getTrainers(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          print(snapshot);
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).length,
            itemBuilder: (context, index) {
              Trainer trainerData = snapshot.data![index].data;
              return RowTrainer(
                  trainerData: trainerData,
                  onTrainerClick: () {
                    viewModel.navigateToTrainerProfile(trainerId: 38);
                  });
            },
          );
        }
      },
    );
  }
}
