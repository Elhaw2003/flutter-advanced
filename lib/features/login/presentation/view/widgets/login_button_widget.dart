import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helper/custom_animated_snack_bar.dart';
import 'package:flutter_advanced/core/helper/exetension.dart';
import 'package:flutter_advanced/core/routing/app_routes.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_button_widget.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/features/login/data/models/login_request_model.dart';
import 'package:flutter_advanced/features/login/presentation/cubit/cubit/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.formKey,
    required this.email,
    required this.password,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            barrierColor: Colors.transparent,
            barrierDismissible: false,
            builder: (context) {
              return Container(
                width: double.infinity,
                color: AppColors.blackColor.withValues(alpha: .2),
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: AppColors.blackColor,
                    ),
                    child: CircularProgressIndicator(
                      color: AppColors.primaryBlueColor,
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is LoginSuccessState) {
          context.pop();
          CustomAnimatedShowSnackBar.successSnackBar(
            context: context,
            message: state.loginResponseModel.message,
          );
          Future.delayed(Duration(seconds: 2), () {
            context.pushReplaceMentNamed(AppRoutes.homeScreen);
          });
        } else if (state is LoginFailureState) {
          context.pop();
          CustomAnimatedShowSnackBar.failureSnackBar(
            context: context,
            message: state.message,
          );
        }
      },
      builder: (context, state) {
        return CustomButtonWidget(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<LoginCubit>().login(
                LoginRequestModel(
                  email: email.text.trim(),
                  password: password.text.trim(),
                ),
              );
            }
          },
          buttonWidth: double.infinity,
          title: "Login",
        );
      },
    );
  }
}
