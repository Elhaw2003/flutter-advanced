import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helper/exetension.dart';
import 'package:flutter_advanced/core/routing/app_routes.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Don't have an account yet? ",
        style: AppTextStyles.font11NormalDarkBlueNormal,
        children: [
          TextSpan(
            text: "Sign Up",
            style: AppTextStyles.font13primarySemiBold,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplaceMentNamed(AppRoutes.registerScreen);
              },
          ),
        ],
      ),
    );
  }
}
