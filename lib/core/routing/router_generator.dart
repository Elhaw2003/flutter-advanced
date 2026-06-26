import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/di.dart';
import 'package:flutter_advanced/core/routing/app_routes.dart';
import 'package:flutter_advanced/features/home/presentation/view/home_screen.dart';
import 'package:flutter_advanced/features/login/presentation/cubit/cubit/login_cubit.dart';
import 'package:flutter_advanced/features/login/presentation/view/login_screen.dart';
import 'package:flutter_advanced/features/on_boarding/presentation/view/on_boarding_screen.dart';
import 'package:flutter_advanced/features/register/presentation/cubit/cubit/register_cubit.dart';
import 'package:flutter_advanced/features/register/presentation/view/register_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RouterGenerator {
  static Route routerGenerator(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.onBoardingScreen:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen());
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => sl<RegisterCubit>(),
            child: RegisterScreen(),
          ),
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(body: Center(child: Text("There no found this route"))),
        );
    }
  }
}
