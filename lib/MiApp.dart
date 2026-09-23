
import 'package:dam2_2627_a/views/LoginView.dart';
import 'package:dam2_2627_a/views/HomeView.dart';
import 'package:dam2_2627_a/views/MessagesView.dart';
import 'package:dam2_2627_a/views/OnboardingView.dart';
import 'package:dam2_2627_a/views/RegisterView.dart';
import 'package:flutter/material.dart';

import 'views/ProfileView.dart';

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
        "/MessagesView" : (context) => MessagesView(),
      },
      initialRoute: "/OnboardingView",
    );
  }
}