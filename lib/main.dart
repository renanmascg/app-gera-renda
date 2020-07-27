import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './injection_container.dart' as injection_container;
import 'features/app_routes/app_routes.dart';
import 'features/login/presentation/screens/01_onboarding_page/onboarding_page.dart';
import 'features/login/presentation/screens/02_login_page/login_page.dart';
import 'features/login/presentation/screens/03_create_account/create_account_page.dart';
import 'features/login/presentation/screens/04_create_account_pass/create_account_pass.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injection_container.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        OnboardingPage.id: (ctx) => OnboardingPage(),
        CreateAccountPage.id: (ctx) => CreateAccountPage(),
        CreateAccountPassPage.id: (ctx) => CreateAccountPassPage(),
        LoginPage.id: (ctx) => LoginPage(),
        AppRoutes.id: (ctx) => AppRoutes()
      },
      initialRoute: OnboardingPage.id,
    );
  }
}
