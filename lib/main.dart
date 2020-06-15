import 'package:flutter/material.dart';

import 'features/login/presentation/screens/01_onboarding_page/onboarding_page.dart';
import 'features/login/presentation/screens/03_create_account/create_account_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        OnboardingPage.id: (ctx) => OnboardingPage(),
        CreateAccountPage.id: (ctx) => CreateAccountPage()
      },
      initialRoute: OnboardingPage.id,
    );
  }
}
