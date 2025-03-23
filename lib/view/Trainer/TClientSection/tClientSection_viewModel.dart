import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class TClientSectionViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToWeeklyCheckInView() {
    _navigationService.navigateToWeeklyCheckInView();
  }

  void navigateToDailyCheckInView() {
    _navigationService.navigateToDailyCheckInView();
  }

  void navigateToDailyProgressView() {
    _navigationService.navigateToDailyProgressView();
  }

  navigateToTraining() {
    _navigationService.navigateToTTrainingView();
  }

  navigateToSupplements() {
    _navigationService.navigateToTSupplementsView();
  }

  navigateToNutrition() {
    _navigationService.navigateToTNutritionView();
  }

  navigateToTGoals() {
    _navigationService.navigateToTGoalsView();
  }

  navigateToTDaily() {
    _navigationService.navigateToTDailyView();
  }

  navigatetoTCardio() {
    _navigationService.navigateToTCardioView();
  }

  navigatetoTChat() {
    _navigationService.navigateToTChatView();
  }
}
