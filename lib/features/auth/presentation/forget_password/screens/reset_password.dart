import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/validators.dart';
import 'package:online_exam/core/utils/widgets/app_text_form_field.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/features/auth/data/models/request/ResetPasswordRequest.dart';
import 'package:online_exam/features/auth/presentation/forget_password/ViewModel/forget_password_cubit.dart';
import 'package:online_exam/features/auth/presentation/widgets/screen_description.dart';
import 'package:online_exam/features/auth/presentation/widgets/screen_title.dart';

import 'forget_password_bloc_listener.dart';

class ResetPassword extends HookWidget {
  ResetPassword({super.key});

  final formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: const CustomAppBar(title: 'Password'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: formKye,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ForgetPasswordBlocListener(),
                    verticalSpacing(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Column(
                        children: [
                          const ScreenTitle(
                            title: 'Reset password',
                          ),
                          verticalSpacing(16),
                          const ScreenDescription(
                              title:
                                  'Password must not be empty and must contain 6 characters with upper case letter and one number at least '),
                        ],
                      ),
                    ),
                    verticalSpacing(32),
                    AppTextFormField(
                      controller: emailController,
                      hintText: 'Enter you email',
                      labelText: 'Email',
                      validator: (value) => Validators.validateNotEmpty(
                          title: 'Email', value: value),
                    ),
                    verticalSpacing(16),
                    AppTextFormField(
                      controller: passwordController,
                      hintText: 'Enter you email',
                      labelText: 'New password',
                      validator: (value) => Validators.validateNotEmpty(
                          title: 'Email', value: value),
                    ),
                    verticalSpacing(48),
                    CurvedButton(
                      color: MyColors.blue,
                      title: 'Continue',
                      onTap: () {
                        if (formKye.currentState!.validate()) {
                          context.read<ForgetPasswordCubit>().doAction(
                                  ResetPasswordAction(ResetPasswordRequest(
                                email: emailController.text,
                                newPassword: passwordController.text,
                              )));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
