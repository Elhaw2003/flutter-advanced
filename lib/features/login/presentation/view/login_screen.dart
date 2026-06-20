import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_text_field_widget.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/features/login/presentation/view/widgets/already_have_an_account_widget.dart';
import 'package:flutter_advanced/features/login/presentation/view/widgets/login_button_widget.dart';
import 'package:flutter_advanced/features/login/presentation/view/widgets/terms_and_privacy_widget.dart';
import 'package:flutter_advanced/features/login/presentation/view/widgets/title_and_desc_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObsecureText = true;
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
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFieldWidget(hintText: "Email"),
                      CustomHeightSpacingWidget(height: 16),
                      CustomTextFieldWidget(
                        obscureText: isObsecureText,
                        suffixIcon: isObsecureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        suffixSize: 20,
                        suffixOnPressed: () {
                          setState(() {
                            isObsecureText = !isObsecureText;
                          });
                        },
                        hintText: "Password",
                      ),
                      CustomHeightSpacingWidget(height: 46),
                      LoginButtonWidget(),
                      CustomHeightSpacingWidget(height: 46),
                      TermsAndPrivacyWidget(),
                      CustomHeightSpacingWidget(height: 16),
                      AlreadyHaveAnAccountWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
