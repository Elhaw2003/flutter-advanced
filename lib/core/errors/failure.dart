import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure(this.message, [this.code]);

  @override
  List<Object?> get props => [message, code];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, [super.code]);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message, [super.code]);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message, [super.code]);
}

class AuthFailure extends Failure {
  const AuthFailure(super.message, [super.code]);
}

class PermissionFailure extends Failure {
  const PermissionFailure(super.message, [super.code]);
}

class ValidationFailure extends Failure {
  final Map<String, List<String>> fieldErrors;

  const ValidationFailure(super.message, {this.fieldErrors = const {}});

  @override
  List<Object?> get props => [...super.props, fieldErrors];
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message, [super.code]);
}

class LocationFailure extends Failure {
  const LocationFailure(super.message, [super.code]);
}

class StorageFailure extends Failure {
  const StorageFailure(super.message, [super.code]);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message, [super.code]);
}
