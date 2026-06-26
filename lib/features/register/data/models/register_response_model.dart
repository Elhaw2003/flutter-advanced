import 'package:json_annotation/json_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RegisterResponseModel {
  final String message;
  final RegisterDataModel data;
  final bool status;
  final int code;

  const RegisterResponseModel({
    required this.message,
    required this.data,
    required this.status,
    required this.code,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseModelToJson(this);
}

@JsonSerializable()
class RegisterDataModel {
  final String token;
  final String username;

  const RegisterDataModel({required this.token, required this.username});

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterDataModelToJson(this);
}
