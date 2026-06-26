import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/core/errors/exceptions.dart';
import 'package:flutter_advanced/core/errors/failure.dart';
import 'package:flutter_advanced/core/errors/failure_mapper.dart';
import 'package:flutter_advanced/core/networking/api_consumer.dart';
import 'package:flutter_advanced/core/networking/end_points.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';
import 'package:flutter_advanced/features/home/data/repo/get_specialization/get_specialization_repo.dart';

class GetSpecializationRepoImpl implements GetSpecializationRepo {
  final ApiConsumer _apiConsumer;

  GetSpecializationRepoImpl({required this._apiConsumer});
  @override
  Future<Either<Failure, SpecializationsResponseModel>>
  getSpecialization() async {
    try {
      final response = await _apiConsumer.get(EndPoints.specilaization);
      return Right(SpecializationsResponseModel.fromJson(response));
    } on AppException catch (e) {
      return Left(mapExceptionToFailure(e));
    } catch (e) {
      return Left(UnexpectedFailure(e.toString()));
    }
  }
}
