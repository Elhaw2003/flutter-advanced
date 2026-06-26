import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/recommendation_doctor_item_list.dart';

class RecommendationDoctorListViewWidget extends StatelessWidget {
  const RecommendationDoctorListViewWidget({super.key, required this.doctors});
  final List<DoctorModel> doctors;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return RecommendationDoctorItemList(doctorModel: doctors[index]);
      },
      separatorBuilder: (context, index) =>
          CustomHeightSpacingWidget(height: 24),
      itemCount: doctors.length,
    );
  }
}
