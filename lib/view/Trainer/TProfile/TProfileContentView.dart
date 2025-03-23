import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Trainer/TProfile/tProfile_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowTrainerPersonalService.dart';
import 'package:trainr/view/Trainer/components/RowTrainerProfileSpecialization.dart';
import '../../../assets/variables/themeColor.dart';
import 'Tabs/MediaTab/mediaTab_view.dart';
import 'Tabs/PackagesTab/packagesTab_view.dart';
import 'Tabs/ProfileTab/profileTab_view.dart';
import 'Tabs/ReviewTab/reviewTab_view.dart';

class TProfileContentView extends StatelessWidget {
  TProfileContentView({super.key});

  late BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => TProfileViewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.getTrainerProfileById();
          await viewModel.getFirebaseToken();
        },
        builder: (context, TProfileViewModel viewModel, index) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: ThemeColor.backgroundColor,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CachedNetworkImage(
                              fit: BoxFit.contain,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageUrl: viewModel
                                      .trainerProfileData?.profileImage ??
                                  'https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg',
                              imageBuilder: (context, imageProvider) {
                                return CircleAvatar(
                                  radius: 32,
                                  backgroundImage: imageProvider,
                                );
                              },
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, bottom: 5, left: 10),
                                child: Wrap(
                                    direction: Axis.vertical,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.start,
                                    children: [
                                      Text(
                                        "${viewModel.trainerProfileData?.firstName} ${viewModel.trainerProfileData?.lastName}",
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: ThemeColor.textfieldColor),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            '0 Reviews',
                                            style: TextStyle(
                                                color: ThemeColor.textColor,
                                                fontSize: 12),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              children:
                                                  List.generate(5, (index) {
                                                return const Icon(
                                                  Icons.star,
                                                  size: 15,
                                                  color: ThemeColor
                                                      .lightGrey1Color,
                                                );
                                              }),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ])),
                            Expanded(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () async {
                                    viewModel.navigateToTSettingView();
                                  },
                                  icon: const Icon(
                                    Icons.settings,
                                    color: ThemeColor.textfieldColor,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: AutoSizeText(
                                viewModel.trainerProfileData?.nationality ?? "",
                                maxLines: 1,
                                style: const TextStyle(
                                    color: ThemeColor.textfieldColor,
                                    fontSize: 14),
                              ),
                            ),
                            Stack(children: [
                              Positioned(
                                  right: 0,
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: const BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle),
                                    child: const Center(
                                      child: AutoSizeText(
                                        "1",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: ThemeColor.textfieldColor,
                                            fontSize: 10),
                                      ),
                                    ),
                                  )),
                              Align(
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.notifications,
                                    size: 25,
                                    color: ThemeColor.textfieldColor,
                                  ),
                                  onPressed: () {
                                    viewModel.navigateToTNotificationView();
                                  },
                                ),
                              )
                            ]),
                          ],
                        ),
                        if (viewModel.trainerProfileData?.specializations
                                ?.isNotEmpty ==
                            true)
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 30,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: viewModel.trainerProfileData
                                              ?.specializations?.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        final specialization = viewModel
                                            .trainerProfileData
                                            ?.specializations?[index];
                                        return RowTrainerProfileSpecialization(
                                          specializationName:
                                              specialization?.name ?? "",
                                          isEditable: false,
                                          onDeleteClick: () {},
                                        );
                                      }),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.share,
                                  size: 25,
                                  color: ThemeColor.textfieldColor,
                                ),
                              ),
                            ],
                          ),
                        if (viewModel.trainerProfileData
                                ?.personalTrainingservices?.isNotEmpty ==
                            true)
                          Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: SizedBox(
                              height: 30,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: viewModel.trainerProfileData
                                          ?.personalTrainingservices?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    final service = viewModel.trainerProfileData
                                        ?.personalTrainingservices?[index];
                                    return RowTrainerPersonalService(
                                      serviceName: service?.name ?? "",
                                      isEditable: false,
                                      onDeleteClick: () {},
                                    );
                                  }),
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            color: Colors.black,
                            height: 1.2,
                            width: double.infinity,
                          ),
                        ),
                        DefaultTabController(
                          length: 4,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: ThemeColor.darkBackgroundColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const TabBar(
                                  padding: EdgeInsets.all(0),
                                  labelPadding: EdgeInsets.all(0),
                                  indicatorColor: ThemeColor.textfieldColor,
                                  labelColor: Colors.transparent,
                                  dividerColor: Colors.transparent,
                                  tabs: [
                                    Icon(
                                      Icons.person_2,
                                      size: 50,
                                      color: ThemeColor.primaryColor,
                                    ),
                                    Icon(
                                      Icons.image,
                                      size: 40,
                                      color: ThemeColor.primaryColor,
                                    ),
                                    Icon(
                                      Icons.chat,
                                      size: 40,
                                      color: ThemeColor.primaryColor,
                                    ),
                                    Icon(
                                      Icons.shopping_cart,
                                      size: 40,
                                      color: ThemeColor.primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 500,
                                width: double.infinity,
                                child: Expanded(
                                  child: TabBarView(
                                    children: [
                                      ProfileTabView(
                                        profileData:
                                            viewModel.trainerProfileData,
                                        onSuccess: () async {
                                          await viewModel
                                              .getTrainerProfileById();
                                        },
                                      ),
                                      MediaTabView(),
                                      ReviewTabView(),
                                      PackagesTabView(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}
