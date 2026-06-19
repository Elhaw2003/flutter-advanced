import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routing/app_routes.dart';
import 'package:flutter_advanced/features/login/presentation/view/login_screen.dart';
import 'package:flutter_advanced/features/on_boarding/presentation/view/on_boarding_screen.dart';

class RouterGenerator {
  static Route routerGenerator(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text("There no found this route"))),
        );
    }
  }
}
