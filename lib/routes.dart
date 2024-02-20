import 'package:flutter/material.dart';
import 'package:flutter_app/pages/login_page.dart';
import 'package:flutter_app/pages/onboarding_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> list =
      <String, WidgetBuilder>{
    '/': (BuildContext context) => const OnboardingPage(),
    '/login': (BuildContext context) => const LoginPage(),
    // '/client': (BuildContext context) => ClientPage(),
  };

  static String initial = '/';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
