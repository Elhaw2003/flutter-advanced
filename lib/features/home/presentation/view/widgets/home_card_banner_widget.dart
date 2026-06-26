import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCardBannerWidget extends StatelessWidget {
  const HomeCardBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
            clipBehavior: Clip.none,
            height: 165.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              image: DecorationImage(
                image: AssetImage(Assets.imagesPngBanner),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book and\nschedule with\nnearest doctor",
                  style: AppTextStyles.font18whiteMeduim,
                ),
                CustomHeightSpacingWidget(height: 15),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48.r),
                    ),
                  ),
                  child: Text(
                    "Find Nearby",
                    style: AppTextStyles.font12primaryNormal,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 15.w,
            child: Image.asset(
              Assets.imagesPngImageBanner,
              width: 136.w,
              height: 197.h,
            ),
          ),
        ],
      ),
    );
  }
}
