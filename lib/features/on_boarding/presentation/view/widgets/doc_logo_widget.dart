import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:flutter_svg/svg.dart';

class DocLogoWidget extends StatelessWidget {
  const DocLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.imagesSvgDocoLogo),
        CustomWidthSpacingWidget(width: 8),
        Text("Docdoc", style: AppTextStyles.font22BlackBold),
      ],
    );
  }
}
