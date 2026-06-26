import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/core/errors/exceptions.dart';
import 'package:flutter_advanced/core/errors/failure.dart';
import 'package:flutter_advanced/core/errors/failure_mapper.dart';
import 'package:flutter_advanced/core/networking/api_consumer.dart';
import 'package:flutter_advanced/core/networking/end_points.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_model.dart';
import 'package:flutter_advanced/features/login/data/models/login_response_model.dart';
import 'package:flutter_advanced/features/login/data/repo/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiConsumer apiConsumer;

  LoginRepoImpl({required this.apiConsumer});
  @override
  Future<Either<Failure, LoginResponseModel>> loginRepo(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.login,
        data: loginRequestModel.toJson(),
      );

      return Right(LoginResponseModel.fromJson(response));
    } on AppException catch (e) {
      return Left(mapExceptionToFailure(e));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
