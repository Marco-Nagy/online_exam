import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/validators.dart';
import 'package:online_exam/core/utils/widgets/app_text_form_field.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/features/auth/presentation/widgets/screen_description.dart';
import 'package:online_exam/features/auth/presentation/widgets/screen_title.dart';


class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();

  final formKye = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
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
                    setState(() {
                      if (formKye.currentState!.validate()) {
                        context.pushReplacementNamed(
                              AppRoutes.emailVerification);
                        }
                      });

                  },
                )
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}
