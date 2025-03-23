import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

class CTrainerCheckInViewModel extends BaseViewModel {
  final navigationService = locator<NavigationService>();

  void navigateToDailyProgressView() {
    navigationService.navigateToCDailyProgressView();
  }

  void navigateToDailyCheckInView() {
    navigationService.navigateToCDailyCheckInView();
  }

  void navigateToWeeklyCheckInView() {
    navigationService.navigateToCWeeklyCheckInView();
  }

  void navigateToClientCardioView() {
    navigationService.navigateToClientCardioView();
  }

  void navigateToClientSuplementView() {
    navigationService.navigateToClientSuplementView();
  }

  void navigateToClientChatView() {
    navigationService.navigateToClientChatView();
  }

  void navigateToCTrainingSheduleView() {
    navigationService.navigateToCTrainingSheduleView();
  }

  void navigateToCNutritionPlanView() {
    navigationService.navigateToCNutritionPlanView();
  }

  void navigateToCGoalsView() {
    navigationService.navigateToCGoalsView();
  }

  navigatetoClientChat() {
    navigationService.navigateToClientChattingView();
  }
}
