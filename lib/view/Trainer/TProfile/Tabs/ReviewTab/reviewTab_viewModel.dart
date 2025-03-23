import 'package:stacked/stacked.dart';
import 'package:trainr/cache/MySharedPreferences.dart';
import 'package:trainr/models/GetTrainerReviewResponse.dart';

import '../../../../../app/app.locator.dart';
import '../../../repo/TrainerDashboardRepo.dart';

class ReviewTabViewModel extends BaseViewModel {
  final _repo = locator<TrainerDashboardRepo>();
  final List<TrainerReviewData> reviewsList = [];

  Future<void> getTrainerReviews() async {
    final userData = await MySharedPreferences.getUser();

    if (userData != null) {
      final response = await _repo.getTrainerReviews(userData.trainerId ?? 0);

      if (response != null) {
        reviewsList.clear();
        reviewsList.addAll(response.data ?? []);
      }
    }

    rebuildUi();
  }

  double getOneStarRating() {
    var totalRating = 0.0;
    final finalRatings = reviewsList.where((rate) => rate.ratings == 1).length;
    totalRating = finalRatings / 10;
    return totalRating;
  }

  double getTwoStarRating() {
    var totalRating = 0.0;
    final finalRatings = reviewsList.where((rate) => rate.ratings == 2).length;
    totalRating = finalRatings / 10;
    return totalRating;
  }

  double getThreeStarRating() {
    var totalRating = 0.0;
    final finalRatings = reviewsList.where((rate) => rate.ratings == 3).length;

    totalRating = finalRatings / 10;
    return totalRating;
  }

  double getFourStarRating() {
    var totalRating = 0.0;
    final finalRatings = reviewsList.where((rate) => rate.ratings == 4).length;

    totalRating = finalRatings / 10;
    return totalRating;
  }

  double getFiveStarRating() {
    var totalRating = 0.0;
    final finalRatings = reviewsList.where((rate) => rate.ratings == 5).length;

    totalRating = finalRatings / 10;
    return totalRating;
  }
}
