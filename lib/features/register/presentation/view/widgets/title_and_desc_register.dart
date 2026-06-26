import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';

class TitleAndDescRegister extends StatelessWidget {
  const TitleAndDescRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Create Account", style: AppTextStyles.font24primaryBlueBold),
        CustomHeightSpacingWidget(height: 8),
        Text(
          "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
          style: AppTextStyles.font14greyNormal,
        ),
      ],
    );
  }
}
