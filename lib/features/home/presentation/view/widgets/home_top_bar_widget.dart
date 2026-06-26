import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/core/theming/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTopBarWidget extends StatelessWidget {
  const HomeTopBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hi, Omar!", style: AppTextStyles.font18BlackBold),
            CustomHeightSpacingWidget(height: 5),
            Text(
              "How Are you Today?",
              style: AppTextStyles.font11moreGreyColorNormal,
            ),
          ],
        ),
        CircleAvatar(
          radius: 25.r,
          backgroundColor: AppColors.moreLighterGreyColor,
          child: Icon(Icons.notifications_on, color: AppColors.blackColor),
        ),
      ],
    );
  }
}
