import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/doctor_speciality_item_list_view_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListViewWidget extends StatelessWidget {
  const DoctorSpecialityListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return DoctorSpecialityItemListViewWidget();
        },
        separatorBuilder: (context, index) =>
            CustomWidthSpacingWidget(width: 16),
      ),
    );
  }
}
