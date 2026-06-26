import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_advanced/features/register/data/models/register_request_model.dart';
import 'package:flutter_advanced/features/register/data/models/register_response_model.dart';
import 'package:flutter_advanced/features/register/data/repo/register_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo registerRepo;
  RegisterCubit({required this.registerRepo}) : super(RegisterInitialState());

  Future<void> register(RegisterRequestModel registerRequestModel) async {
    emit(RegisterLoadingState());
    var result = await registerRepo.registerRepo(registerRequestModel);
    return result.fold(
      (left) {
        emit(RegisterFailureState(message: left.message));
      },
      (right) {
        emit(RegisterSuccessState(registerResponseModel: right));
      },
    );
  }
}
