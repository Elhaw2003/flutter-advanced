import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_button_widget.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButtonWidget(buttonWidth: double.infinity, title: "Login");
  }
}
