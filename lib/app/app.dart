import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/Client_services/ClientForm.dart';
import 'package:trainr/customServices/trainerForm.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/C%20-%20Nutrition%20Plan/C-NutritionPlan_view.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/C-Trainer%20CheckIn/C-tainerCheckIn_view.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/Client%20Cardio/ClientCardio_view.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/Client%20Suplement/ClientSuplement_view.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/Client%20Training%20Shedule/C-Trainning%20Shedule/CTrainingShedule_view.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/Client%20k%20Trainer/ClientTrainer_view.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/ClientGoals/Goals_view.dart';
import 'package:trainr/view/Client/C%20-%20Trainer%20sec/WeeklyCheckIn/CWeeklyCheckInScreen.dart';
import 'package:trainr/view/Client/Client%20Calendar/ClientCalendar_view.dart';
import 'package:trainr/view/Client/Client%20Chatting%20Pages/Client%20Chatting/ClientChatting_view.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Add%20to%20Cart/AddToCart_view.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/CCreditCard_view.dart/CCreditCard_view.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Client%20Home/C-BookSpot_view.dart/CBookSpot_view.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Client%20Home/Client%20Create%20Class/ClientCreateC_view.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Client%20Home/Client-Home-view/ClientHome_View.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Filter/FilterScreen.dart';
import 'package:trainr/view/Client/Client%20Home%20Pages/Trainer%20Profile%20in%20Client%20View/C-TrainerProfile/C-TrainerProfile_view.dart';
import 'package:trainr/view/Client/Client%20Profile/Client%20Profile%20View/client_profile_view.dart';
import 'package:trainr/view/Client/Notification/NotificationScreen.dart';
import 'package:trainr/view/Client/client_registration/registration_view.dart';
import 'package:trainr/view/Client/setting/My%20information/information_vew.dart';
import 'package:trainr/view/Client/setting/Payment%20Method/Payment%20Method%20page2/paymentPage2_view.dart';
import 'package:trainr/view/Client/setting/Payment%20Method/payment%20Method%20Page1/PaymentPage1_view.dart';
import 'package:trainr/view/Client/setting/setting%20view/setting_view.dart';
import 'package:trainr/view/Forget%20Password/ForgetPass/ForgetPass_view.dart';
import 'package:trainr/view/Forget%20Password/New%20Password/NewPass_view.dart';
import 'package:trainr/view/Forget%20Password/Verify%20Email/VerifyEmail_view.dart';
import 'package:trainr/view/Login/login_view.dart';
import 'package:trainr/view/RoleSelect/roleSelect_view.dart';
import 'package:trainr/view/Trainer/T%20Setting/T%20My%20Information/TMyInformation_view.dart';
import 'package:trainr/view/Trainer/T%20Setting/T%20payment%20Method/T%20Payment%20Page%201/TPaymentPage1_view.dart';
import 'package:trainr/view/Trainer/T%20Setting/T%20payment%20Method/T%20Payment%20Page%202/TPaymentPage2_view.dart';
import 'package:trainr/view/Trainer/T%20Setting/T_Setting_View/TSetting_view.dart';
import 'package:trainr/view/Trainer/TBankDetails/tBankDetails_view.dart';
import 'package:trainr/view/Trainer/TCalendar/tCalendar_view.dart';
import 'package:trainr/view/Trainer/TChat/tChatContacts/tChatContacts_view.dart';
import 'package:trainr/view/Trainer/TChat/tChat_view.dart';
import 'package:trainr/view/Trainer/TClientSection/TCardio/tCardio_view.dart';
import 'package:trainr/view/Trainer/TClientSection/TGoals/tGoals_view.dart';
import 'package:trainr/view/Trainer/TClientSection/TNutrition/tNutrition_view.dart';
import 'package:trainr/view/Trainer/TClientSection/TSupplements/tSupplements_view.dart';
import 'package:trainr/view/Trainer/TClientSection/TTraining/tTraining_view.dart';
import 'package:trainr/view/Trainer/TClientSection/tClientSection_view.dart';
import 'package:trainr/view/Trainer/TContacts/Request/Request_view.dart';
import 'package:trainr/view/Trainer/TContacts/tContacts_view.dart';
import 'package:trainr/view/Trainer/TProfile/TCreateClass/TCreateClass_view.dart';
import 'package:trainr/view/Trainer/TProfile/tProfile_view.dart';
import 'package:trainr/view/Trainer/trainer_registration/trainerRegistration_view.dart';
import 'package:trainr/view/splash/splash_view.dart';

import '../view/ChooseSpecialization/SelectSpecializationView.dart';
import '../view/ChooseTrainingService/SelectTrainingService_view.dart';
import '../view/Client/C - Trainer sec/CDailyCheckIn/CDailyCheckInScreen.dart';
import '../view/Client/Client Chatting Pages/chat/ClientChat_view.dart';
import '../view/Trainer/TClientSection/DailyCheckIn/DailyCheckInScreen.dart';
import '../view/Trainer/TClientSection/DailyProgress/DailyProgressScreen.dart';
import '../view/Trainer/TClientSection/WeeklyCheckIn/WeeklyCheckInScreen.dart';
import '../view/tCode_confirmation/tCodeConfirmation_view.dart';

@StackedApp(routes: [
  // COMMON ROUTES

  MaterialRoute(page: SplashView, initial: true),
  CustomRoute(
    page: LoginView,
  ),
  CustomRoute(
    page: RoleSelectView,
  ),
  CustomRoute(
    page: ForgetPassView,
  ),
  CustomRoute(
    page: VerifyEmailView,
  ),
  CustomRoute(
    page: NewPassView,
  ),

  // CLIENT ROUTES

  CustomRoute(
    page: RegistrationView,
  ),
  CustomRoute(
    page: ClientHomeView,
  ),
  CustomRoute(
    page: SettingView,
  ),
  CustomRoute(
    page: InformationView,
  ),
  CustomRoute(
    page: PaymentPage1View,
  ),
  CustomRoute(
    page: PaymentPage2View,
  ),
  CustomRoute(
    page: ClientProfileView,
  ),
  CustomRoute(
    page: CTrainerCheckInView,
  ),
  CustomRoute(
    page: ClientCardioView,
  ),
  CustomRoute(
    page: ClientSuplementView,
  ),
  CustomRoute(
    page: ClientChattingView,
  ),
  CustomRoute(
    page: ClientChatView,
  ),
  CustomRoute(
    page: CTrainerProfileView,
  ),
  CustomRoute(
    page: AddToCartView,
  ),
  CustomRoute(
    page: CTrainingSheduleView,
  ),
  CustomRoute(
    page: CNutritionPlanView,
  ),
  CustomRoute(
    page: ClientTrainerView,
  ),
  CustomRoute(
    page: ClientCreateCView,
  ),
  CustomRoute(
    page: CBookSpotView,
  ),
  CustomRoute(
    page: CCreditCardView,
  ),
  CustomRoute(
    page: ClientCalendarView,
  ),
  CustomRoute(
    page: GoalsView,
  ),
  CustomRoute(
    page: CDailyCheckInScreen,
  ),
  CustomRoute(
    page: CWeeklyCheckInScreen,
  ),
  CustomRoute(
    page: FiltersScreen,
  ),

  // TRAINER ROUTES

  CustomRoute(
    page: TrainerRegistrationView,
  ),
  CustomRoute(
    page: TBankDetailsView,
  ),
  CustomRoute(
    page: VerifyOtpView,
  ),
  CustomRoute(
    page: SelectSpecializationView,
  ),
  CustomRoute(
    page: SelectTrainingServiceView,
  ),
  CustomRoute(
    page: TProfileView,
  ),
  CustomRoute(
    page: TContactsView,
  ),
  CustomRoute(
    page: TChatView,
  ),
  CustomRoute(
    page: TChatContactsView,
  ),
  CustomRoute(
    page: TCalendarView,
  ),
  CustomRoute(
    page: TClientSectionView,
  ),
  CustomRoute(
    page: TCardioView,
  ),
  CustomRoute(
    page: TGoalsView,
  ),
  CustomRoute(
    page: TNutritionView,
  ),
  CustomRoute(
    page: TSupplementsView,
  ),
  CustomRoute(
    page: TTrainingView,
  ),
  CustomRoute(
    page: TCreateClassView,
  ),
  CustomRoute(
    page: TSettingView,
  ),
  CustomRoute(
    page: TMyInformationView,
  ),
  CustomRoute(
    page: RequestView,
  ),
  CustomRoute(
    page: TPaymentPage1View,
  ),
  CustomRoute(
    page: TPaymentpage2View,
  ),
  CustomRoute(page: NotificationScreen),
  CustomRoute(page: DailyProgressScreen),
  CustomRoute(page: DailyCheckInScreen),
  CustomRoute(page: WeeklyCheckInScreen)

  // ROUTES END
], dependencies: [
  Singleton(classType: NavigationService),
  LazySingleton(classType: TrainerForm),
  LazySingleton(classType: ClientForm),
])
class App {}
