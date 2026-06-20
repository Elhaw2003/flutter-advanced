import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';
import 'package:flutter_advanced/features/on_boarding/presentation/view/widgets/get_started_button_widget.dart';

class DescriptionAndButtonWidget extends StatelessWidget {
  const DescriptionAndButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Manage and schedule all of your medical appointments \neasily with Docdoc to get a new experience.",
          style: AppTextStyles.font12greyNormal,
          textAlign: TextAlign.center,
        ),
        CustomHeightSpacingWidget(height: 32),
        GetStartedButtonWidget(),
      ],
    );
  }
}
