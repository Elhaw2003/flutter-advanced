import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';

class TitleAndDescLogin extends StatelessWidget {
  const TitleAndDescLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome Back", style: AppTextStyles.font24primaryBlueBold),
        CustomHeightSpacingWidget(height: 8),
        Text(
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          style: AppTextStyles.font14greyNormal,
        ),
      ],
    );
  }
}
