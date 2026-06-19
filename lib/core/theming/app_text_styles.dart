import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  static TextStyle font22Black700Weight = TextStyle(
    color: AppColors.blackColor,
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font32primaryBlue700Weight = TextStyle(
    color: AppColors.primaryBlueColor,
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font12grey400Weight = TextStyle(
    color: AppColors.greyColor,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle font16white600Weight = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
}
