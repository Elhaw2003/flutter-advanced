import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/doctor_speciality_item_list_view_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListViewWidget extends StatelessWidget {
  const DoctorSpecialityListViewWidget({
    super.key,
    required this.specializations,
  });
  final List<SpecializationModel> specializations;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: specializations.length,
        itemBuilder: (context, index) {
          return DoctorSpecialityItemListViewWidget(
            specializationModel: specializations[index],
          );
        },
        separatorBuilder: (context, index) =>
            CustomWidthSpacingWidget(width: 16),
      ),
    );
  }
}
