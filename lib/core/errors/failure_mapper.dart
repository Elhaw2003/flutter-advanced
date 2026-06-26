import 'exceptions.dart';
import 'failure.dart';

Failure mapExceptionToFailure(AppException exception) {
  if (exception is AuthException) {
    return AuthFailure(exception.message, exception.code);
  }

  if (exception is NetworkException) {
    return NetworkFailure(exception.message, exception.code);
  }

  if (exception is ValidationException) {
    return ValidationFailure(
      exception.message,
      fieldErrors: exception.fieldErrors,
    );
  }

  if (exception is PermissionException) {
    return PermissionFailure(exception.message, exception.code);
  }

  if (exception is CacheException) {
    return CacheFailure(exception.message, exception.code);
  }

  if (exception is StorageException) {
    return StorageFailure(exception.message, exception.code);
  }

  if (exception is LocationException) {
    return LocationFailure(exception.message, exception.code);
  }

  if (exception is ServerException) {
    return ServerFailure(exception.message, exception.code);
  }

  return UnexpectedFailure(exception.message, exception.code);
}
