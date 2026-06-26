import 'package:flutter_advanced/core/app_validation/validation.dart';

class ValidationMessageMapper {
  ValidationMessageMapper._();

  static String? mapPassword(PasswordValidationResult? result) {
    switch (result) {
      case PasswordValidationResult.empty:
        return "Password Required";
      case PasswordValidationResult.short:
        return "Password Is Short";
      case PasswordValidationResult.noLowercase:
        return "Password Require Atleast One LowerCase";
      case PasswordValidationResult.noUppercase:
        return "Password Require Atleast One UpperCase";
      case PasswordValidationResult.noNumber:
        return "Password Require Atleast One Digit Number";
      case PasswordValidationResult.noSpecialCharacter:
        return "Password Require Atleast One Special Character";
      case null:
        return null;
    }
  }
}
