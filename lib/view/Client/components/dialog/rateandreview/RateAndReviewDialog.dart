import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:stacked/stacked.dart';

import '../../../../../assets/variables/themeColor.dart';
import '../../../../component/dialogs/loading_dialog.dart';
import 'RateAndReviewViewModel.dart';

class RateAndReviewDialog extends StatelessWidget {
  RateAndReviewDialog({super.key, required this.trainerId});

  late BuildContext _context;
  int trainerId;

  @override
  Widget build(BuildContext context) {
    _context = context;

    return ViewModelBuilder.reactive(
        viewModelBuilder: () => RateAndReviewViewModel(),
        builder: (ctx, viewModel, index) {
          return Dialog(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: ThemeColor.primaryColor,
                  borderRadius: BorderRadius.circular(20)),
              child: Wrap(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: const Icon(
                            Icons.close,
                            color: ThemeColor.primaryColor,
                            size: 20,
                          ),
                        ),
                      ),
                      const Expanded(
                        child: Text(
                          textAlign: TextAlign.center,
                          "Rate & Review",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 20),
                    child: RatingStars(
                      starSize: 30,
                      value: viewModel.getRating(),
                      starCount: 5,
                      onValueChanged: (rating) {
                        viewModel.setRating(rating);
                      },
                      starOffColor: ThemeColor.textColor,
                      starColor: ThemeColor.secondaryColor,
                      valueLabelVisibility: false,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: ThemeColor.textfieldColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: TextField(
                        controller: viewModel.commentController,
                        maxLines: 5,
                        decoration: const InputDecoration(
                            counterText: "",
                            border: InputBorder.none,
                            hintText: "Enter your comment"),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 150,
                      margin: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () async {
                          _showLoader();

                          final response =
                              await viewModel.rateTrainer(trainerId);

                          Navigator.pop(context);

                          if (response?.statusCode == 200) {
                            Navigator.pop(context, true);
                          } else {
                            _showError(response?.statusMessage);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Text(
                            "Submit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: ThemeColor.primaryColor, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _showLoader() {
    showDialog(
        context: _context,
        barrierDismissible: false,
        builder: (ctx) {
          return const LoadingDialog(message: "Please wait....");
        });
  }

  void _showError(String? message) {
    ScaffoldMessenger.of(_context).showSnackBar(SnackBar(
        content: Center(
      child: Text(message ?? "Something went wrong"),
    )));
  }
}
