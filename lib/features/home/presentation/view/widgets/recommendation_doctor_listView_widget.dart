import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationDoctorListviewWidget extends StatelessWidget {
  const RecommendationDoctorListviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (context, index) {
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
                      "Dr. Randy Wigham",
                      style: AppTextStyles.font18BlackBold,
                    ),
                    CustomHeightSpacingWidget(height: 5),
                    Text(
                      "RSUD Gatot Subroto",
                      style: AppTextStyles.font12greyNormal,
                    ),
                    CustomHeightSpacingWidget(height: 5),
                    Text(
                      "(4,279 reviews)",
                      style: AppTextStyles.font11moreGreyColorNormal,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) =>
          CustomHeightSpacingWidget(height: 24),
      itemCount: 5,
    );
  }
}
