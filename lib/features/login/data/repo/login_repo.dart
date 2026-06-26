import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/core/errors/failure.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_model.dart';
import 'package:flutter_advanced/features/login/data/models/login_response_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, LoginResponseModel>> loginRepo(
    LoginRequestModel loginRequestModel,
  );
}
