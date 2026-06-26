import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Doctor Speciality",
          style: AppTextStyles.font16whiteSemiBold.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        Text("See All", style: AppTextStyles.font13primarySemiBold),
      ],
    );
  }
}
