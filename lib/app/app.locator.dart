// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';
import 'package:trainr/Client_services/DailyCheckInForm.dart';
import 'package:trainr/Client_services/WeeklyCheckInForm.dart';
import 'package:trainr/customServices/CreateSessionFrom.dart';
import 'package:trainr/customServices/FilterForm.dart';
import 'package:trainr/view/Client/repo/ClientDashboardRepo.dart';
import 'package:trainr/view/Trainer/repo/MyInformationRepo.dart';
import 'package:trainr/view/Trainer/repo/TrainerDashboardRepo.dart';
import 'package:trainr/view/Trainer/repo/TrainerPersonalTrainingRepo.dart';
import 'package:trainr/view/Trainer/repo/TrainerRegistrationRepo.dart';
import 'package:trainr/view/Trainer/repo/VerifyOtpRepo.dart';
import 'package:trainr/view/repo/LoginRepo.dart';
import 'package:trainr/view/repo/RoleRepo.dart';

import '../Client_services/ClientData.dart';
import '../Client_services/ClientForm.dart';
import '../customServices/ChatMessage.dart';
import '../customServices/UpdateClientProfile.dart';
import '../customServices/UpdateTrainerProfile.dart';
import '../customServices/socialLoginData.dart';
import '../customServices/trainerForm.dart';
import '../view/Client/repo/AddToCartRepo.dart';
import '../view/Client/repo/BookSpotRepo.dart';
import '../view/Client/repo/CTrainerProfileRepo.dart';
import '../view/Client/repo/ClientChatRepo.dart';
import '../view/Client/repo/ClientProfileRepo.dart';
import '../view/Client/repo/ClientRegistrationRepo.dart';
import '../view/Client/repo/ClientSessionsRepo.dart';
import '../view/Client/repo/ClientUpdateProfileRepo.dart';
import '../view/Client/repo/FilterRepo.dart';
import '../view/Trainer/repo/TrainerSessionsRepo.dart';
import '../view/Trainer/repo/TrainerSpecializationRepo.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => LoginRepo());
  locator.registerLazySingleton(() => TrainerRegistrationRepo());
  locator.registerLazySingleton(() => ClientRegistrationRepo());
  locator.registerLazySingleton(() => TrainerSpecializationRepo());
  locator.registerLazySingleton(() => TrainerDashboardRepo());
  locator.registerLazySingleton(() => UserPersonalTrainingRepo());
  locator.registerLazySingleton(() => MyInformationRepo());
  locator.registerLazySingleton(() => RoleRepo());
  locator.registerLazySingleton(() => VerifyOtpRepo());
  locator.registerLazySingleton(() => CTrainerProfileRepo());
  locator.registerLazySingleton(() => ClientDashboardRepo());
  locator.registerLazySingleton(() => TrainerSessionsRepo());
  locator.registerLazySingleton(() => ClientSessionsRepo());
  locator.registerLazySingleton(() => FilterRepo());
  locator.registerLazySingleton(() => ClientProfileRepo());
  locator.registerLazySingleton(() => BookSpotRepo());
  locator.registerLazySingleton(() => AddToCartRepo());
  locator.registerLazySingleton(() => ClientChatRepo());
  locator.registerLazySingleton(() => ClientUpdateProfileRepo());
  locator.registerSingleton(FilterForm());
  locator.registerSingleton(NavigationService());
  locator.registerLazySingleton(() => TrainerForm());
  locator.registerLazySingleton(() => ClientForm());
  locator.registerLazySingleton(() => UpdateClientProfile());
  locator.registerLazySingleton(() => ChatUser());
  locator.registerLazySingleton(() => UpdateTrainerProfile());
  locator.registerLazySingleton(() => ClientData());
  locator.registerLazySingleton(() => CreateSessionForm());
  locator.registerLazySingleton(() => DailyCheckInForm());
  locator.registerLazySingleton(() => WeeklyCheckInForm());
  locator.registerLazySingleton(() => SocialLoginModel());
}
