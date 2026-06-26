import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityItemListViewWidget extends StatelessWidget {
  const DoctorSpecialityItemListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.moreLightestGreyColor,
          radius: 30.r,
          child: Image.asset(
            height: 24.h,
            width: 24.w,
            Assets.imagesPngImageBanner,
          ),
        ),
        CustomHeightSpacingWidget(height: 10),
        Text("General", style: AppTextStyles.font11NormalDarkBlueNormal),
      ],
    );
  }
}
