import 'package:json_annotation/json_annotation.dart';

part 'specializations_response_model.g.dart';

@JsonSerializable()
class SpecializationsResponseModel {
  final String? message;
  final List<SpecializationModel>? data;
  final bool? status;
  final int? code;

  const SpecializationsResponseModel({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  factory SpecializationsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationsResponseModelToJson(this);
}

@JsonSerializable()
class SpecializationModel {
  final int? id;
  final String? name;
  final List<DoctorModel>? doctors;

  const SpecializationModel({this.id, this.name, this.doctors});

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$SpecializationModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpecializationModelToJson(this);
}

@JsonSerializable()
class DoctorModel {
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? gender;
  final String? address;
  final String? description;
  final String? degree;

  final DoctorSpecializationModel? specialization;
  final CityModel? city;

  @JsonKey(name: "appoint_price")
  final num? appointPrice;

  @JsonKey(name: "start_time")
  final String? startTime;

  @JsonKey(name: "end_time")
  final String? endTime;

  const DoctorModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.photo,
    this.gender,
    this.address,
    this.description,
    this.degree,
    this.specialization,
    this.city,
    this.appointPrice,
    this.startTime,
    this.endTime,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}

@JsonSerializable()
class DoctorSpecializationModel {
  final int? id;
  final String? name;

  const DoctorSpecializationModel({this.id, this.name});

  factory DoctorSpecializationModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorSpecializationModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorSpecializationModelToJson(this);
}

@JsonSerializable()
class CityModel {
  final int? id;
  final String? name;
  final GovernrateModel? governrate;

  const CityModel({this.id, this.name, this.governrate});

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

@JsonSerializable()
class GovernrateModel {
  final int? id;
  final String? name;

  const GovernrateModel({this.id, this.name});

  factory GovernrateModel.fromJson(Map<String, dynamic> json) =>
      _$GovernrateModelFromJson(json);

  Map<String, dynamic> toJson() => _$GovernrateModelToJson(this);
}
