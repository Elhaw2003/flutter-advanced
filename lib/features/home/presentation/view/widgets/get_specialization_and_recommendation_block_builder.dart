import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/features/home/presentation/cubit/cubit/get_specialization_cubit.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/doctor_speciality_list_view_widget.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/recommendation_doctor_list_view_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetSpecializationAndRecommendationBlockBuilder extends StatelessWidget {
  const GetSpecializationAndRecommendationBlockBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSpecializationCubit, GetSpecializationState>(
      builder: (context, state) {
        return state is GetSpecializationLoadingState
            ? _setupLoading()
            : state is GetSpecializationSuccessState
            ? _setupSuccess(state)
            : state is GetSpecializationFailureState
            ? Center(child: Text(state.message))
            : SizedBox.shrink();
      },
    );
  }
}

Widget _setupLoading() {
  return Center(child: CircularProgressIndicator());
}

Widget _setupSuccess(GetSpecializationSuccessState state) {
  return Column(
    children: [
      DoctorSpecialityListViewWidget(
        specializations: state.specializationsResponseModel.data ?? [],
      ),
      CustomHeightSpacingWidget(height: 30),
      RecommendationDoctorListViewWidget(
        doctors: state.specializationsResponseModel.data?[0].doctors ?? [],
      ),
    ],
  );
}
