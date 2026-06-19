import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';
import 'package:flutter_advanced/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(Assets.imagesSvgDocoLogoWithOpacity),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white.withOpacity(0.1)],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              stops: [.14, .4],
            ),
          ),
          child: Image.asset(Assets.imagesPngOnBoardingImage),
        ),
        Positioned(
          // top: 0,
          bottom: 30.h,
          left: 30.w,
          child: Text(
            "Best Doctor \nAppointment App",
            textAlign: TextAlign.center,
            style: AppTextStyles.font32primaryBlue700Weight.copyWith(
              height: 1.4.h,
            ),
          ),
        ),
      ],
    );
  }
}
