import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helper/exetension.dart';
import 'package:flutter_advanced/core/routing/app_routes.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButtonWidget extends StatelessWidget {
  const GetStartedButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14.h)),
          backgroundColor: WidgetStatePropertyAll(AppColors.primaryBlueColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          ),
        ),
        onPressed: () {
          context.pushNamed(AppRoutes.loginScreen);
        },
        child: Text("Get Started", style: AppTextStyles.font16whiteSemiBold),
      ),
    );
  }
}
