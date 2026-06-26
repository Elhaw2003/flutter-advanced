import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';

class PasswordRequirementWidget extends StatelessWidget {
  const PasswordRequirementWidget({
    super.key,
    required this.title,
    required this.isValid,
  });
  final String title;
  final bool isValid;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: isValid
          ? AppTextStyles.font12greyNormal.copyWith(
              decoration: TextDecoration.lineThrough,
            )
          : AppTextStyles.font12greyNormal,
    );
  }
}
