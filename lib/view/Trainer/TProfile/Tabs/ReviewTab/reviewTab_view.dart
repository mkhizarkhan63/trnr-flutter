import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:trainr/assets/variables/themeColor.dart';
import 'package:trainr/view/Trainer/TProfile/Tabs/ReviewTab/reviewTab_viewModel.dart';
import 'package:trainr/view/Trainer/components/RowReview.dart';

class ReviewTabView extends StatelessWidget {
  ReviewTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ReviewTabViewModel(),
      onViewModelReady: (viewModel) async {
        await viewModel.getTrainerReviews();
      },
      builder: (context, ReviewTabViewModel viewModel, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _rating(context, viewModel),
                _review(viewModel),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _rating(BuildContext context, ReviewTabViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Ratings',
          style: TextStyle(
            color: ThemeColor.primaryColor,
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
                    color: ThemeColor.textfieldColor,
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
                  color: ThemeColor.textfieldColor,
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
                  progressColor: ThemeColor.textfieldColor,
                  backgroundColor: Colors.white38,
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
                  color: ThemeColor.textfieldColor,
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
                  progressColor: ThemeColor.textfieldColor,
                  backgroundColor: Colors.white38,
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
                  color: ThemeColor.textfieldColor,
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
                  progressColor: ThemeColor.textfieldColor,
                  backgroundColor: Colors.white38,
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
                  color: ThemeColor.textfieldColor,
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
                  progressColor: ThemeColor.textfieldColor,
                  backgroundColor: Colors.white38,
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
                  color: ThemeColor.textfieldColor,
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
                  progressColor: ThemeColor.textfieldColor,
                  backgroundColor: Colors.white38,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _review(ReviewTabViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            'Reviews',
            style: TextStyle(
              color: ThemeColor.primaryColor,
              decoration: TextDecoration.underline,
              decorationColor: ThemeColor.primaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20),
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: viewModel.reviewsList.length,
            itemBuilder: (context, index) {
              final reviewData = viewModel.reviewsList[index];
              return RowReview(
                reviewData: reviewData,
              );
            },
          ),
        )
      ],
    );
  }
}
