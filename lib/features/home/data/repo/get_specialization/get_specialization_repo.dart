import 'package:dartz/dartz.dart';
import 'package:flutter_advanced/core/errors/failure.dart';
import 'package:flutter_advanced/features/home/data/models/specializations_response_model.dart';

abstract class GetSpecializationRepo {
  Future<Either<Failure, SpecializationsResponseModel>> getSpecialization();
}
