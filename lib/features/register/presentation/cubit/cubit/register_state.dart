part of 'register_cubit.dart';

sealed class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterFailureState extends RegisterState {
  final String message;

  const RegisterFailureState({required this.message});
  @override
  List<Object> get props => [message];
}

final class RegisterSuccessState extends RegisterState {
  final RegisterResponseModel registerResponseModel;

  const RegisterSuccessState({required this.registerResponseModel});
  @override
  List<Object> get props => [registerResponseModel];
}
