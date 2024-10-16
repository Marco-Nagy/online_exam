import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/validators.dart';
import 'package:online_exam/core/utils/widgets/app_text_form_field.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/buttons/visibility_icon.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/presentation/login/ViewModel/login_contract.dart';
import 'package:online_exam/features/auth/presentation/login/ViewModel/login_view_model.dart';
import 'package:online_exam/features/auth/presentation/login/screens/login_bloc_consumer.dart';

class LoginForm extends HookWidget {
  final formKey = GlobalKey<FormState>();

  LoginForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    // Using Flutter Hooks to manage the TextEditingControllers

    final isRememberMe = useValueNotifier(false);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    ValueNotifier<bool> passwordVisibility =ValueNotifier(false);
    return Form(
      key: formKey,
      child: Column(
        children: [
          const LoginBlocConsumer(),
          AppTextFormField(
            controller: emailController,
            hintText: 'Enter your email',
            labelText: 'Email',
            validator: (value) =>
                Validators.validateNotEmpty(title: "Email", value: value),
          ),
          verticalSpacing(24),
          ValueListenableBuilder(
            valueListenable: passwordVisibility,
          builder: (context, value, child) => AppTextFormField(
              controller: passwordController,
              hintText: 'Enter your password',
              labelText: 'Password',
              obscureText: passwordVisibility.value,
            suffixIcon: VisibilityIcon(isVisible: passwordVisibility.value,),
            validator: (value) =>
                  Validators.validateNotEmpty(title: "Password", value: value),
            ),
          ),
          Row(
            children: [
              ValueListenableBuilder(
                valueListenable: isRememberMe,
                builder: (BuildContext context, bool value, Widget? child)=> Checkbox(
                  value:
                  isRememberMe.value ,
                  onChanged: (bool? value) {
                    isRememberMe.value = value! ;
                  },
                ),
              ),
              const Text('Remember me'),
              const Spacer(),
              TextButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.forgetPassword);
                },
                child: Text(
                  'Forgot password?',
                  style: MyFonts.styleRegular400_12.copyWith(
                    color: MyColors.black,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          verticalSpacing(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.register);
                },
                child: Text(
                  'Sign up',
                  style: MyFonts.styleRegular400_16.copyWith(
                    color: MyColors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          CurvedButton(
            color: MyColors.blue,
            title: 'Login',
            onTap: () {
              _onSubmit(context, emailController.text, passwordController.text,
                  isRememberMe.value);
            },
          ),
        ],
      ),
    );
  }

  // Moved the submit logic into a separate function
  void _onSubmit(
    BuildContext context,
    String email,
    String password,
    bool isRememberMeChecked,
  ) {
    if (formKey.currentState!.validate()) {
      final SignInRequest signInRequest = SignInRequest(
        email: email,
        password: password,
      );
      BlocProvider.of<LoginViewModel>(context)
          .doAction(LoginAction(signInRequest, isRememberMeChecked));
    }
  }
}
