import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationDoctorItemList extends StatelessWidget {
  const RecommendationDoctorItemList({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              Assets.imagesPngImageBanner,
              width: 110.w,
              height: 110.h,
              fit: BoxFit.fill,
            ),
          ),
          CustomWidthSpacingWidget(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctorModel.name ?? "UnKnown",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTextStyles.font18BlackBold,
                ),
                CustomHeightSpacingWidget(height: 5),
                Text(
                  doctorModel.email ?? "",
                  style: AppTextStyles.font12greyNormal,
                ),
                CustomHeightSpacingWidget(height: 5),
                Text(
                  doctorModel.degree ?? "",
                  style: AppTextStyles.font11moreGreyColorNormal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
