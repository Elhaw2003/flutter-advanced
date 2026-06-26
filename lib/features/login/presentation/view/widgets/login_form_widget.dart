import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/app_validation/password_validation_state.dart';
import 'package:flutter_advanced/core/app_validation/validation_message_mapper.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_spacing_widget.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_text_field_widget.dart';
import 'package:flutter_advanced/core/app_validation/validation.dart';
import 'package:flutter_advanced/features/login/presentation/view/widgets/dont_have_an_account_widget.dart';
import 'package:flutter_advanced/features/login/presentation/view/widgets/login_button_widget.dart';
import 'package:flutter_advanced/features/login/presentation/view/widgets/terms_and_privacy_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isObsecureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
          CustomHeightSpacingWidget(height: 46),
          LoginButtonWidget(
            formKey: formKey,
            email: emailController,
            password: passwordController,
          ),
          CustomHeightSpacingWidget(height: 46),
          Center(child: TermsAndPrivacyWidget()),
          CustomHeightSpacingWidget(height: 16),
          Center(child: DontHaveAnAccountWidget()),
        ],
      ),
    );
  }
}
