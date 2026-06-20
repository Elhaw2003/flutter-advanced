import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';

class AlreadyHaveAnAccountWidget extends StatelessWidget {
  const AlreadyHaveAnAccountWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Already have an account yet? ",
        style: AppTextStyles.font11NormalDarkBlueNormal,
        children: [
          TextSpan(
            text: "Sign Up",
            style: AppTextStyles.font13primarySemiBold,
            // recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
