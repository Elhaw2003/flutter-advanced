import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/app_validation/password_validation_state.dart';
import 'package:flutter_advanced/core/app_validation/validation_message_mapper.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_text_field_widget.dart';
import 'package:flutter_advanced/core/app_validation/validation.dart';
import 'package:flutter_advanced/features/login/presentation/view/widgets/terms_and_privacy_widget.dart';
import 'package:flutter_advanced/features/register/presentation/view/widgets/already_have_an_account_widget.dart';
import 'package:flutter_advanced/features/register/presentation/view/widgets/password_requirement_widget.dart';
import 'package:flutter_advanced/features/register/presentation/view/widgets/register_button_widget.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObsecureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  late PasswordValidationState passwordState;

  @override
  void initState() {
    super.initState();

    passwordState = AppValidator.passwordValidationState("");

    passwordController.addListener(passwordValidationListener);
  }

  void passwordValidationListener() {
    setState(() {
      passwordState = AppValidator.passwordValidationState(
        passwordController.text.trim(),
      );
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFieldWidget(
            controller: nameController,
            hintText: "Name",
            validator: (value) {
              final error = AppValidator.nameValidation(value?.trim());
              switch (error) {
                case NameValidationResult.empty:
                  return "Name Required";

                case NameValidationResult.tooShort:
                  return "Name is short";

                case null:
                  return null;
              }
            },
          ),
          CustomHeightSpacingWidget(height: 16),
          CustomTextFieldWidget(
            controller: emailController,
            hintText: "Email",
            validator: (value) {
              final error = AppValidator.emailValidation(value?.trim());
              switch (error) {
                case EmailValidationResult.empty:
                  return "Email Required";

                case EmailValidationResult.invalid:
                  return "Invalid Email";

                case null:
                  return null;
              }
            },
          ),
          CustomHeightSpacingWidget(height: 16),
          CustomTextFieldWidget(
            controller: phoneController,
            keyboardType: TextInputType.number,
            hintText: "Phone",
            validator: (value) {
              final error = AppValidator.phoneValidation(value?.trim());
              switch (error) {
                case PhoneValidationResult.empty:
                  return "Phone Required";

                case PhoneValidationResult.invalid:
                  return "Invalid Phone";

                case null:
                  return null;
              }
            },
          ),
          CustomHeightSpacingWidget(height: 16),
          CustomTextFieldWidget(
            controller: passwordController,
            obscureText: isObsecureText,
            suffixIcon: isObsecureText
                ? Icons.visibility_off
                : Icons.visibility,
            suffixSize: 20,
            suffixOnPressed: () {
              setState(() {
                isObsecureText = !isObsecureText;
              });
            },
            hintText: "Password",
            validator: (value) {
              final error = AppValidator.passwordValidation(value?.trim());
              return ValidationMessageMapper.mapPassword(error);
            },
          ),
          CustomHeightSpacingWidget(height: 15),
          PasswordRequirementWidget(
            title: "At least 8 characters",
            isValid: passwordState.hasMinLength,
          ),
          PasswordRequirementWidget(
            title: "One uppercase letter",
            isValid: passwordState.hasUppercase,
          ),
          PasswordRequirementWidget(
            title: "One lowercase letter",
            isValid: passwordState.hasLowercase,
          ),
          PasswordRequirementWidget(
            title: "One digit number",
            isValid: passwordState.hasNumber,
          ),
          PasswordRequirementWidget(
            title: "One special character",
            isValid: passwordState.hasSpecialCharacter,
          ),
          CustomHeightSpacingWidget(height: 16),
          CustomTextFieldWidget(
            controller: confirmPasswordController,
            hintText: "Confirm Password",
            validator: (value) {
              final error = AppValidator.confirmPasswordValidation(
                password: passwordController.text.trim(),
                confirmPassword: confirmPasswordController.text.trim(),
              );
              switch (error) {
                case ConfirmPasswordValidationResult.empty:
                  return "Confirm Password Required";

                case ConfirmPasswordValidationResult.notMatch:
                  return "Password Not Match";

                case null:
                  return null;
              }
            },
          ),
          CustomHeightSpacingWidget(height: 46),
          RegisterButtonWidget(
            formKey: formKey,
            email: emailController,
            password: passwordController,
            confirmPassword: confirmPasswordController,
            name: nameController,
            phone: phoneController,
          ),
          CustomHeightSpacingWidget(height: 46),
          Center(child: TermsAndPrivacyWidget()),
          CustomHeightSpacingWidget(height: 16),
          Center(child: AlreadyHaveAnAccountWidget()),
        ],
      ),
    );
  }
}
