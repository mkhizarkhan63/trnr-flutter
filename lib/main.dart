import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:trainr/app/app.locator.dart';
import 'package:trainr/app/app.router.dart';

import 'firebase/firebase_options.dart';

void main() async {
  await setupLocator();

  //Assign publishable key to flutter_stripe

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey = "pk_test_51PwPXRF7fds5HQ4WHBErKtYUtrbrEHYvfpCUn8du9xMc2224MQlrwaLgfdRdCHrarmHxB53klF3Nsu51cUc9MElX005vaQAftM";
  Stripe.merchantIdentifier = "merchant.com.example.trainr";

  // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // theme: ThemeData(fontFamily: 'verdanab'),
        debugShowCheckedModeBanner: false,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute);
  }
}
