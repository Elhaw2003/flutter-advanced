import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/doctor_speciality_list_view_widget.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/doctor_speciality_see_all.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/home_card_banner_widget.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/home_top_bar_widget.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/recommendation_doctor_listView_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: HomeTopBarWidget()),
              SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 16)),
              SliverToBoxAdapter(child: HomeCardBannerWidget()),
              SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 24)),
              SliverToBoxAdapter(child: DoctorSpecialitySeeAll()),
              SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 16)),
              SliverToBoxAdapter(child: DoctorSpecialityListViewWidget()),
              SliverToBoxAdapter(child: CustomHeightSpacingWidget(height: 30)),
              RecommendationDoctorListviewWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
