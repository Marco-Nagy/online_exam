import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/validators.dart';
import 'package:online_exam/core/utils/widgets/animated_status_dialog.dart';
import 'package:online_exam/core/utils/widgets/app_text_form_field.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/features/auth/data/models/request/SignInRequest.dart';
import 'package:online_exam/features/auth/presentation/ViewModel/login/login_contract.dart';
import 'package:online_exam/features/auth/presentation/ViewModel/login/login_view_model.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'marconlb@gmail.com');
    _passwordController = TextEditingController(text: 'Elevate@12');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formKey,
        child: Column(
          children: [
            AppTextFormField(
              controller: _emailController,
              hintText: 'Enter you email',
              labelText: 'Email',
              validator: (value) =>
                  Validators.validateNotEmpty(title: "Email", value: value),
            ),
            verticalSpacing(24),
            AppTextFormField(
              controller: _passwordController,
              hintText: 'Enter you password ',
              labelText: 'Password',
              obscureText: true,
              validator: (value) =>
                  Validators.validateNotEmpty(title: "Password", value: value),
            ),
            Row(
              children: [
                BlocBuilder<LoginViewModel, LoginScreenState>(
                  builder: (context, state) {
                    return Checkbox(
                      value:
                          context.watch<LoginViewModel>().isRememberMe ?? false,
                      onChanged: (value) {
                        context.read<LoginViewModel>().isRememberMe =
                            value ?? false;
                      },
                    );
                  },
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
                        decoration: TextDecoration.underline),
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
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
            CurvedButton(
              color: MyColors.blue,
              title: 'Login',
              onTap: () {
                _onSubmit(context);
              },
            )
          ],
        ));
  }

  void _onSubmit(context) {
    if (widget.formKey.currentState!.validate()) {
      final SignInRequest signInRequest = SignInRequest(
          email: _emailController.text, password: _passwordController.text);
      BlocProvider.of<LoginViewModel>(context)
          .doAction(LoginAction(signInRequest));
    }
  }
}
