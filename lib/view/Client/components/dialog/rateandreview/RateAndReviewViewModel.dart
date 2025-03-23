import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../cache/MySharedPreferences.dart';
import '../../../repo/CTrainerProfileRepo.dart';

class RateAndReviewViewModel extends BaseViewModel {
  final commentController = TextEditingController();
  final _repo = locator<CTrainerProfileRepo>();

  double _rating = 0.0;

  void setRating(double rating) {
    _rating = rating;

    rebuildUi();
  }

  getRating() {
    return _rating;
  }

  Future<Response?> rateTrainer(int trainerId) async {
    final userData = await MySharedPreferences.getUser();
    final comments = commentController.text;

    return await _repo.rateTrainer(
        trainerId, userData?.clientId ?? 0, _rating.toInt(), comments);
  }
}
