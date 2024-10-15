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
import 'package:online_exam/features/auth/data/models/request/ForgetPasswordRequest.dart';
import 'package:online_exam/features/auth/presentation/forget_password/ViewModel/forget_password_cubit.dart';
import 'package:online_exam/features/auth/presentation/forget_password/screens/forget_password_bloc_listener.dart';
import 'package:online_exam/features/auth/presentation/widgets/screen_description.dart';
import 'package:online_exam/features/auth/presentation/widgets/screen_title.dart';


class ForgetPassword extends HookWidget {
  ForgetPassword({super.key});

  final formKye = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();

    return SafeArea(
        child: Scaffold(
      backgroundColor: MyColors.white,
      appBar: const CustomAppBar(title: 'Password'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                        title: 'Forget password',
                      ),
                      verticalSpacing(16),
                      const ScreenDescription(
                          title:
                              'Please enter your email associated to your account'),
                    ],
                  ),
                ),
                verticalSpacing(32),
                AppTextFormField(
                  controller: emailController,
                  hintText: 'Enter you email',
                  labelText: 'Email',
                    validator: (value) =>Validators.validateNotEmpty(title: 'Email',value: value),
                ),
                verticalSpacing(48),
                CurvedButton(
                  color: MyColors.blue,
                  title: 'Continue',
                  onTap: () {
                      if (formKye.currentState!.validate()) {
                        context.read<ForgetPasswordCubit>().doAction(
                            ForgetPasswordAction(ForgetPasswordRequest(
                                email: emailController.text)));
                      }
                    },
                  ),

              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
