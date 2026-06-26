import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/data/repo/get_specialization/get_specialization_repo.dart';

part 'get_specialization_state.dart';

class GetSpecializationCubit extends Cubit<GetSpecializationState> {
  final GetSpecializationRepo _getSpecializationRepo;
  GetSpecializationCubit({required this._getSpecializationRepo})
    : super(GetSpecializationInitialState());

  Future<void> getSpecialization() async {
    emit(GetSpecializationLoadingState());
    final result = await _getSpecializationRepo.getSpecialization();
    return result.fold(
      (error) {
        emit(GetSpecializationFailureState(message: error.message));
      },
      (right) {
        emit(
          GetSpecializationSuccessState(specializationsResponseModel: right),
        );
      },
    );
  }
}
