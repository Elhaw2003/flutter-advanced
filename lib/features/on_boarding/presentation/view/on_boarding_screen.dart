import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/features/on_boarding/presentation/view/widgets/description_and_button_widget.dart';
import 'package:flutter_advanced/features/on_boarding/presentation/view/widgets/doc_logo_widget.dart';
import 'package:flutter_advanced/features/on_boarding/presentation/view/widgets/on_boarding_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 31.h, horizontal: 31.h),
            child: Column(
              children: [
                const DocLogoWidget(),
                const OnBoardingItemWidget(),
                CustomHeightSpacingWidget(height: 18),
                DescriptionAndButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
