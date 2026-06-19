import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/routing/app_routes.dart';
import 'package:flutter_advanced/core/routing/router_generator.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Docdoc App',
          theme: ThemeData(primaryColor: AppColors.primaryBlueColor),
          initialRoute: AppRoutes.onBoardingScreen,
          onGenerateRoute: (settings) =>
              RouterGenerator.routerGenerator(settings),
        );
      },
    );
  }
}
