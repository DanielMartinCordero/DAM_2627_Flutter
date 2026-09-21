
import 'package:dam2_2627_a/LoginView.dart';
import 'package:dam2_2627_a/HomeView.dart';
import 'package:dam2_2627_a/OnboardingView.dart';
import 'package:dam2_2627_a/RegisterView.dart';
import 'package:flutter/material.dart';

import 'ProfileView.dart';

class MiApp extends StatelessWidget {
  double dbNumber = 0.0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "MI APP 1",
      routes: {
        "/LoginView": (context) => LoginView(),
        "/HomeView" : (context) => HomeView(),
        "/RegisterView" : (context) => RegisterView(),
        "/OnboardingView" : (context) => OnboardingView(),
        "/ProfileView" : (context) => ProfileView(),
      },
      initialRoute: "/OnboardingView",
    );
  }
}