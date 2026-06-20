import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';

class TermsAndPrivacyWidget extends StatelessWidget {
  const TermsAndPrivacyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "By logging, you agree to our ",
        style: AppTextStyles.font13GreyNormal,
        children: [
          TextSpan(
            text: "Terms & Conditions ",
            style: AppTextStyles.font13NormalDarkBlueSemiBold,
            // recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
          TextSpan(
            text: "and ",
            style: AppTextStyles.font13GreyNormal,
            // recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
          TextSpan(
            text: "PrivacyPolicy.",
            style: AppTextStyles.font13NormalDarkBlueSemiBold,
            // recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
