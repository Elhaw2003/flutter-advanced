import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/features/login/presentation/view/widgets/login_form_widget.dart';
import 'package:flutter_advanced/features/login/presentation/view/widgets/title_and_desc_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 50.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleAndDescLogin(),
                const CustomHeightSpacingWidget(height: 36),
                const LoginFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
