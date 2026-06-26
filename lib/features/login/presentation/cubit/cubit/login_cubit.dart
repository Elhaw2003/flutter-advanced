import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_advanced/core/di.dart';
import 'package:flutter_advanced/core/helper/cash/secure_storage_caching.dart';
import 'package:flutter_advanced/core/helper/cash/secure_storage_keys.dart';
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
      (right) async {
        await sl<SecureStorageCaching>().write(
          key: SecureStorageKeys.token,
          value: right.data.token,
        );

        emit(LoginSuccessState(loginResponseModel: right));
      },
    );
  }
}
