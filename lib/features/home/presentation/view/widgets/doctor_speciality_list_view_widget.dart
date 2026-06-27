import 'package:flutter/widgets.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/features/home/presentation/cubit/cubit/get_specialization_cubit.dart';
import 'package:flutter_advanced/features/home/presentation/view/widgets/doctor_speciality_item_list_view_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListViewWidget extends StatelessWidget {
  const DoctorSpecialityListViewWidget({super.key, required this.state});
  final GetSpecializationSuccessState state;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: state.specializationsResponseModel.data!.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.read<GetSpecializationCubit>().changeIndex(index);
            },
            child: DoctorSpecialityItemListViewWidget(
              specializationModel:
                  state.specializationsResponseModel.data![index],
              seletedIndex: state.selectedIndex,
              index: index,
            ),
          );
        },
        separatorBuilder: (context, index) =>
            CustomWidthSpacingWidget(width: 16),
      ),
    );
  }
}
