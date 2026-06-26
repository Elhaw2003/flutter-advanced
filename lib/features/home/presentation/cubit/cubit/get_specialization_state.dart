part of 'get_specialization_cubit.dart';

sealed class GetSpecializationState extends Equatable {
  const GetSpecializationState();

  @override
  List<Object> get props => [];
}

final class GetSpecializationInitialState extends GetSpecializationState {}

final class GetSpecializationLoadingState extends GetSpecializationState {}

final class GetSpecializationFailureState extends GetSpecializationState {
  final String message;

  const GetSpecializationFailureState({required this.message});
  @override
  List<Object> get props => [message];
}

final class GetSpecializationSuccessState extends GetSpecializationState {
  final SpecializationsResponseModel specializationsResponseModel;

  const GetSpecializationSuccessState({
    required this.specializationsResponseModel,
  });

  @override
  List<Object> get props => [specializationsResponseModel];
}
