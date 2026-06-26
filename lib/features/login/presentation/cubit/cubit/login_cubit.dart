import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_model.dart';
import 'package:flutter_advanced/features/login/data/models/login_response_model.dart';
import 'package:flutter_advanced/features/login/data/repo/login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit({required this.loginRepo}) : super(LoginInitialState());

  Future<void> login(LoginRequestModel loginRequestModel) async {
    emit(LoginLoadingState());
    var result = await loginRepo.loginRepo(loginRequestModel);
    return result.fold(
      (left) {
        emit(LoginFailureState(message: left.message));
      },
      (right) {
        emit(LoginSuccessState(loginResponseModel: right));
      },
    );
  }
}
