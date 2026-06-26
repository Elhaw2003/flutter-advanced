import 'package:flutter/material.dart';
import 'package:flutter_advanced/core/helper/custom_animated_snack_bar.dart';
import 'package:flutter_advanced/core/helper/exetension.dart';
import 'package:flutter_advanced/core/shared_widgets/custom_button_widget.dart';
import 'package:flutter_advanced/core/theming/app_colors.dart';
import 'package:flutter_advanced/features/register/data/models/register_request_model.dart';
import 'package:flutter_advanced/features/register/presentation/cubit/cubit/register_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterButtonWidget extends StatelessWidget {
  const RegisterButtonWidget({
    super.key,
    required this.formKey,
    required this.email,
    required this.password,
    required this.name,
    required this.confirmPassword,
    required this.phone,
  });
  final GlobalKey<FormState> formKey;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController name;
  final TextEditingController confirmPassword;
  final TextEditingController phone;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
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
        } else if (state is RegisterSuccessState) {
          context.pop();
          CustomAnimatedShowSnackBar.successSnackBar(
            context: context,
            // message: state.registerResponseModel.message,
            message: "Register Successfully........",
          );
        } else if (state is RegisterFailureState) {
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
              context.read<RegisterCubit>().register(
                RegisterRequestModel(
                  email: email.text.trim(),
                  password: password.text.trim(),
                  gender: 0,
                  name: name.text.trim(),
                  passwordConfirmation: confirmPassword.text.trim(),
                  phone: phone.text.trim(),
                ),
              );
            }
          },
          buttonWidth: double.infinity,
          title: "Register",
        );
      },
    );
  }
}
