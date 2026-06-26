import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/core/errors/failure.dart';
import 'package:flutter_advanced/features/register/data/models/register_request_model.dart';
import 'package:flutter_advanced/features/register/data/models/register_response_model.dart';

abstract class RegisterRepo {
  Future<Either<Failure, RegisterResponseModel>> registerRepo(
    RegisterRequestModel registerRequestModel,
  );
}
