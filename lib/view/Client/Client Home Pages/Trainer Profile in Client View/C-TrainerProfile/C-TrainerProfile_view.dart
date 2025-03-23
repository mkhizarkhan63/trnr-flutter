import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Trainer%20Profile%20in%20Client%20View/C-TrainerProfile/C-TrainerProfile_viewModel.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Trainer%20Profile%20in%20Client%20View/Tabs/C-Media%20Tab/C-MediaTab_view.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Trainer%20Profile%20in%20Client%20View/Tabs/C-Package%20Tab/C-PackageTab_view.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Trainer%20Profile%20in%20Client%20View/Tabs/C-ProfileTab/C-ProfileTab_view.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Trainer%20Profile%20in%20Client%20View/Tabs/C-ReviewTab/C-ReviewTab_view.dart';
import 'package:trainr/view/Trainer/components/RowService.dart';
import 'package:trainr/view/Trainer/components/RowSpeciality.dart';

class CTrainerProfileView extends StatelessWidget {
  const CTrainerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CTrainerProfileViewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.getTrainerProfileById(30);
        },
        builder: (context, CTrainerProfileViewModel viewModel, index) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ThemeColor.primaryColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: CachedNetworkImage(
                              fit: BoxFit.contain,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageUrl:
                                  'https://st4.depositphotos.com/22838822/25368/v/600/depositphotos_253680896-stock-illustration-person-icon-people-vector.jpg',
                              imageBuilder: (context, imageProvider) {
                                return CircleAvatar(
                                  radius: 32,
                                  backgroundImage: imageProvider,
                                );
                              },
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5, left: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${viewModel.trainerProfileData?.firstName} ${viewModel.trainerProfileData?.lastName}",
                                    // 'Trainer Name',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: ThemeColor.secondaryColor),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        '0 Reviews',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12),
                                      ),
                                      Container(
                                        height: 35,
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Row(
                                          children: List.generate(5, (index) {
                                            return const Icon(
                                              Icons.star,
                                              size: 15,
                                              color: ThemeColor.secondaryColor,
                                            );
                                          }),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            maxLines: 1,
                            viewModel.trainerProfileData?.nationality ?? "",
                            style: const TextStyle(
                                color: ThemeColor.secondaryColor, fontSize: 14),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.chat,
                              size: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (viewModel
                            .trainerProfileData?.specializations?.isNotEmpty ==
                        true)
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: viewModel.trainerProfileData
                                          ?.specializations?.length ??
                                      0,
                                  itemBuilder: (context, index) {
                                    final specialization = viewModel
                                        .trainerProfileData
                                        ?.specializations?[index];
                                    return RowSpeciality(
                                      speciality: specialization?.name ?? "",
                                      onSpecialityClick: () {},
                                      role: "client",
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    if (viewModel.trainerProfileData?.personalTrainingservices
                            ?.isNotEmpty ==
                        true)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: SizedBox(
                          height: 40,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.trainerProfileData
                                      ?.personalTrainingservices?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                final service = viewModel.trainerProfileData
                                    ?.personalTrainingservices?[index];
                                return RowService(
                                  serviceName: service?.name ?? "",
                                  role: "client",
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
                    Expanded(
                      child: DefaultTabController(
                        length: 4,
                        child: Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                    color: ThemeColor.secondaryColor,
                                    borderRadius: BorderRadius.circular(10)),
                                margin: const EdgeInsets.only(top: 20.0),
                                child: const TabBar(
                                  padding: EdgeInsets.all(0),
                                  labelPadding: EdgeInsets.all(0),
                                  indicatorColor: ThemeColor.primaryColor,
                                  dividerColor: ThemeColor.secondaryColor,
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
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    CProfileTabView(
                                      profileData: viewModel.trainerProfileData,
                                    ),
                                    CMediaTabView(
                                      trainerId:
                                          viewModel.trainerProfileData?.id ?? 0,
                                    ),
                                    CReviewTabView(
                                      trainerId:
                                          viewModel.trainerProfileData?.id ?? 0,
                                    ),
                                    CPackageTabView(
                                      trainerId:
                                          viewModel.trainerProfileData?.id ?? 0,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
