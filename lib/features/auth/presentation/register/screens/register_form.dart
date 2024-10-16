import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/features/auth/presentation/register/ViewModel/register_cubit.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/validators.dart';
import 'package:online_exam/core/utils/widgets/app_text_form_field.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/buttons/visibility_icon.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/features/auth/data/models/request/RegisterRequest.dart';
import 'package:online_exam/features/auth/presentation/register/screens/register_bloc_consumer.dart';

class RegisterForm extends HookWidget {
  final formKey = GlobalKey<FormState>();

   RegisterForm({super.key, required });

  @override
  Widget build(BuildContext context) {
    // Using Flutter Hooks to manage TextEditingControllers
    final userNameController = useTextEditingController(text: 'marco Nagy');
    final firstNameController = useTextEditingController(text: 'marco');
    final lastNameController = useTextEditingController(text: 'Nagy');
    final emailController = useTextEditingController(text: 'marconagy7000@gmail.com');
    final passwordController = useTextEditingController(text: 'Elevate@12');
    final confirmPasswordController = useTextEditingController(text: 'Elevate@12');
    final phoneNumberController = useTextEditingController(text: '01220407005');
    ValueNotifier<bool> passwordVisibility =ValueNotifier(false);

    return Form(
      key: formKey,
      child: Column(
        children: [
           const RegisterBlocConsumer(),
          verticalSpacing(16),
          AppTextFormField(
            controller: userNameController,
            hintText: 'Enter your user name',
            labelText: 'User name',
            validator: (value) => Validators.validateNotEmpty(title: "User name", value: value),
          ),
          verticalSpacing(16),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller: firstNameController,
                  hintText: 'Enter first name',
                  labelText: 'First name',
                  validator: (value) => Validators.validateNotEmpty(title: "First name", value: value),
                ),
              ),
              horizontalSpacing(16),
              Expanded(
                child: AppTextFormField(
                  controller: lastNameController,
                  hintText: 'Enter last name',
                  labelText: 'Last name',
                  validator: (value) => Validators.validateNotEmpty(title: "Last name", value: value),
                ),
              ),
            ],
          ),
          verticalSpacing(16),
          AppTextFormField(
            controller: emailController,
            hintText: 'Enter your email',
            labelText: 'Email',
            validator: (value) => Validators.validateEmail(value),
          ),
          verticalSpacing(16),
          ValueListenableBuilder(
            valueListenable: passwordVisibility,
            builder: (BuildContext context, bool value, Widget? child) => Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller: passwordController,
                    hintText: 'Enter password',
                    labelText: 'Password',
                    fontSize: 14.sp,
                    validator: (value) => Validators.validatePassword(value),
                    suffixIcon: VisibilityIcon(isVisible: passwordVisibility.value,),
                    obscureText: passwordVisibility.value,
                  ),
                ),
                horizontalSpacing(16),
                Expanded(
                  child: AppTextFormField(
                    controller: confirmPasswordController,
                    hintText: 'Confirm password',
                    labelText: 'Confirm password',
                    fontSize: 14.sp,
                    suffixIcon: VisibilityIcon(isVisible: passwordVisibility.value,),
                    obscureText: passwordVisibility.value,
                    validator: (value) => Validators.validatePasswordConfirmation(password: passwordController.text, confirmPassword: value),
                  ),
                ),
              ],
            ),
          ),
          verticalSpacing(16),
          AppTextFormField(
            controller: phoneNumberController,
            hintText: 'Enter phone number',
            labelText: 'Phone number',
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.phone,
            validator: (value) => Validators.validatePhoneNumber(value),
          ),
          verticalSpacing(24),
          CurvedButton(
            color: MyColors.blue,
            title: 'Signup',
            onTap: () {
              _onSubmit(
                context,
                userNameController.text,
                firstNameController.text,
                lastNameController.text,
                emailController.text,
                passwordController.text,
                confirmPasswordController.text,
                phoneNumberController.text,
              );
            },
          ),
          verticalSpacing(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.login);
                },
                child: Text(
                  'Login',
                  style: MyFonts.styleRegular400_16.copyWith(
                    color: MyColors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Submit logic refactored into a separate function
  void _onSubmit(
      BuildContext context,
      String userName,
      String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String phoneNumber,
      ) {
    if (formKey.currentState!.validate()) {
      final signUpRequest = RegisterRequest(
        username: userName,
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        rePassword: confirmPassword,
        phone: phoneNumber,
      );
      context.read<RegisterCubit>().doAction(RegisterAction(signUpRequest));
    }
  }
}
