import 'package:duds/Components/onboarding_two_screen.dart';
import 'package:duds/Components/testing_screen.dart';
import 'package:duds/Components/loading_screen.dart';
import 'package:duds/constants.dart';
import 'package:flutter/material.dart';
import 'Components/login_screen.dart';
import 'Components/onboarding_one_screen.dart';
import 'Components/payment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/onboarding_one',
      routes: {
        '/': (context) => const LoadingScreen(),
        '/welcome': (context) => const OnboardingOneScreen(),
        '/welcome2': (context) => const OnboardingTwoScreen(),
        '/testing': (context) =>  TestingScreen(),
        '/payment': (context) =>  const PaymentMethodPage(),
        '/login': (context) =>  LoginScreen(),
      },
    );
  }
}
