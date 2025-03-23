import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Trainer%20Profile%20in%20Client%20View/Tabs/C-ReviewTab/C-ReviewTab_viewModel.dart';
import 'package:trainr/view/Client/components/dialog/rateandreview/RateAndReviewDialog.dart';

import '../../../../../../assets/variables/themeColor.dart';
import '../../../../components/RowCReview.dart';

class CReviewTabView extends StatelessWidget {
  CReviewTabView({super.key, required this.trainerId});

  int trainerId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => CReviewTabViewModel(),
        onViewModelReady: (viewModel) async {
          await viewModel.getTrainerReviews(trainerId);
        },
        builder: (context, CReviewTabViewModel viewModel, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () async {
                      final data = await showDialog(
                          context: context,
                          builder: (ctx) {
                            return RateAndReviewDialog(trainerId: trainerId);
                          });

                      if (data) {}

                      print("babar dialog closed $data");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ThemeColor.secondaryColor,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Rate & Review',
                        style: TextStyle(
                          color: ThemeColor.secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  _rating(context, viewModel),
                  _review(viewModel),
                ],
              ),
            ),
          );
        });
  }

  Widget _rating(BuildContext context, CReviewTabViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ratings',
            style: TextStyle(
              color: ThemeColor.secondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Row(
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return const Icon(
                      Icons.star,
                      size: 20,
                      color: ThemeColor.secondaryColor,
                    );
                  }),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              children: [
                const Text(
                  '5 Stars',
                  style: TextStyle(
                    color: ThemeColor.secondaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: LinearPercentIndicator(
                    width: (MediaQuery.of(context).size.width / 2),
                    lineHeight: 3.5,
                    percent: viewModel.getFiveStarRating(),
                    progressColor: ThemeColor.secondaryColor,
                    backgroundColor: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                const Text(
                  '4 Stars',
                  style: TextStyle(
                    color: ThemeColor.secondaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: LinearPercentIndicator(
                    width: (MediaQuery.of(context).size.width / 2),
                    lineHeight: 3.5,
                    percent: viewModel.getFourStarRating(),
                    progressColor: ThemeColor.secondaryColor,
                    backgroundColor: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                const Text(
                  '3 Stars',
                  style: TextStyle(
                    color: ThemeColor.secondaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: LinearPercentIndicator(
                    width: (MediaQuery.of(context).size.width / 2),
                    lineHeight: 3.5,
                    percent: viewModel.getThreeStarRating(),
                    progressColor: ThemeColor.secondaryColor,
                    backgroundColor: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                const Text(
                  '2 Stars',
                  style: TextStyle(
                    color: ThemeColor.secondaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: LinearPercentIndicator(
                    width: (MediaQuery.of(context).size.width / 2),
                    lineHeight: 3.5,
                    percent: viewModel.getTwoStarRating(),
                    progressColor: ThemeColor.secondaryColor,
                    backgroundColor: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                const Text(
                  '1 Stars',
                  style: TextStyle(
                    color: ThemeColor.secondaryColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: LinearPercentIndicator(
                    width: (MediaQuery.of(context).size.width / 2),
                    lineHeight: 3.5,
                    percent: viewModel.getOneStarRating(),
                    progressColor: ThemeColor.secondaryColor,
                    backgroundColor: Colors.black38,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _review(CReviewTabViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Reviews',
            style: TextStyle(
              color: ThemeColor.secondaryColor,
              decoration: TextDecoration.underline,
              decorationColor: ThemeColor.secondaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 250,
          child: ListView.builder(
            shrinkWrap: false,
            scrollDirection: Axis.vertical,
            itemCount: viewModel.reviewsList.length,
            itemBuilder: (context, index) {
              final reviewData = viewModel.reviewsList[index];
              return RowCReview(
                reviewData: reviewData,
              );
            },
          ),
        )
      ],
    );
  }
}
