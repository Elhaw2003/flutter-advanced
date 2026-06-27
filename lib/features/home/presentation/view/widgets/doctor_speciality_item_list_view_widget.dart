import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/core/theming/app_font_weight.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityItemListViewWidget extends StatelessWidget {
  const DoctorSpecialityItemListViewWidget({
    super.key,
    required this.specializationModel,
    required this.seletedIndex,
    required this.index,
  });
  final SpecializationModel specializationModel;
  final int seletedIndex;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        seletedIndex == index
            ? Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.primaryBlueColor,
                    width: 2,
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.moreLightestGreyColor,
                  radius: 30.r,
                  child: Image.asset(
                    height: 28.h,
                    width: 28.w,
                    Assets.imagesPngImageBanner,
                  ),
                ),
              )
            : CircleAvatar(
                backgroundColor: AppColors.moreLightestGreyColor,
                radius: 30.r,
                child: Image.asset(
                  height: 24.h,
                  width: 24.w,
                  Assets.imagesPngImageBanner,
                ),
              ),
        CustomHeightSpacingWidget(height: 10),
        Text(
          specializationModel.name ?? "UnKnown",
          style: seletedIndex == index
              ? AppTextStyles.font11NormalDarkBlueNormal.copyWith(
                  fontWeight: AppFontWeight.bold,
                )
              : AppTextStyles.font12greyNormal,
        ),
      ],
    );
  }
}
