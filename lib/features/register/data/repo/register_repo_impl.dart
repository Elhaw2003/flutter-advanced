import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/core/errors/exceptions.dart';
import 'package:flutter_advanced/core/errors/failure.dart';
import 'package:flutter_advanced/core/errors/failure_mapper.dart';
import 'package:flutter_advanced/core/networking/api_consumer.dart';
import 'package:flutter_advanced/core/networking/end_points.dart';
import 'package:flutter_advanced/features/register/data/models/register_request_model.dart';
import 'package:flutter_advanced/features/register/data/models/register_response_model.dart';
import 'package:flutter_advanced/features/register/data/repo/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  final ApiConsumer apiConsumer;

  RegisterRepoImpl({required this.apiConsumer});

  @override
  Future<Either<Failure, RegisterResponseModel>> registerRepo(
    RegisterRequestModel registerRequestModel,
  ) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.register,
        data: registerRequestModel.toJson(),
      );

      return Right(RegisterResponseModel.fromJson(response));
    } on AppException catch (e) {
      return Left(mapExceptionToFailure(e));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
