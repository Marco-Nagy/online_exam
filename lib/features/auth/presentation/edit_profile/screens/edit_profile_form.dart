import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/validators.dart';
import 'package:online_exam/core/utils/widgets/app_text_form_field.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/features/auth/data/models/request/user_request.dart';
import 'package:online_exam/features/auth/domain/entities/user.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/screens/edit_profile_bloc_listener.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/viewModel/edit_profile_cubit.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/viewModel/edit_profile_screen_actions.dart';

class EditProfileForm extends HookWidget {
  final formKey = GlobalKey<FormState>();
  final User user;

  EditProfileForm({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // Using Flutter Hooks to manage TextEditingControllers
    final userNameController = useTextEditingController();
    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final phoneNumberController = useTextEditingController();
    useEffect(() {
      userNameController.text = user.username ?? '';
      firstNameController.text = user.firstName ?? '';
      lastNameController.text = user.lastName ?? '';
      emailController.text = user.email ?? '';
      phoneNumberController.text = user.phone ?? '';
      return null;
    }, [user]);
    final hasChanged = useState(false);
    return Form(
      key: formKey,
      child: Column(
        children: [
          const EditProfileBlocListener(),
          verticalSpacing(16),
          AppTextFormField(
            controller: userNameController,
            hintText: 'Enter your user name',
            labelText: 'User name',
            onChanged: (value) => hasChanged.value = true,
            validator: (value) =>
                Validators.validateNotEmpty(title: "User name", value: value),
          ),
          verticalSpacing(16),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller: firstNameController,
                  hintText: 'Enter first name',
                  labelText: 'First name',
                  onChanged: (value) => hasChanged.value = true,
                  validator: (value) => Validators.validateNotEmpty(
                      title: "First name", value: value),
                ),
              ),
              horizontalSpacing(16),
              Expanded(
                child: AppTextFormField(
                  controller: lastNameController,
                  onChanged: (value) => hasChanged.value = true,
                  hintText: 'Enter last name',
                  labelText: 'Last name',
                  validator: (value) => Validators.validateNotEmpty(
                      title: "Last name", value: value),
                ),
              ),
            ],
          ),
          verticalSpacing(16),
          AppTextFormField(
            controller: emailController,
            hintText: 'Enter your email',
            labelText: 'Email',
            onChanged: (value) => hasChanged.value = true,
            validator: (value) => Validators.validateEmail(value),
          ),
          verticalSpacing(16),
          AppTextFormField(
            hintText: 'Enter your password',
            labelText: 'Password',
            readOnly: true,
            obscureText: true,
            onChanged: (value) => hasChanged.value = true,
            suffixIcon: InkWell(
              highlightColor: MyColors.lightBlue,
              onTap: () => context.pushNamed(AppRoutes.changePassWord),
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 8),
                child: Text(
                  'Change',
                  textAlign: TextAlign.center,
                  style: MyFonts.styleSemiBold600_12.copyWith(
                    color: MyColors.blue,
                  ),
                ),
              ),
            ),
            validator: (value) =>
                Validators.validateNotEmpty(title: "Password", value: value),
            controller: useTextEditingController(text: 'ooooooooooo'),
          ),
          verticalSpacing(16),
          AppTextFormField(
            controller: phoneNumberController,
            hintText: 'Enter phone number',
            labelText: 'Phone number',
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.phone,
            onChanged: (value) => hasChanged.value = true,
            validator: (value) => Validators.validatePhoneNumber(value),
          ),
          verticalSpacing(24),
          CurvedButton(
            color: hasChanged.value ? MyColors.blue : MyColors.gray30,
            title: 'Update',
            onTap: () => hasChanged.value
                ? _onSubmit(
                    context,
                    userNameController.text,
                    firstNameController.text,
                    lastNameController.text,
                    emailController.text,
                    phoneNumberController.text,
                  )
                : null,
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
    String phoneNumber,
  ) {
    if (formKey.currentState!.validate()) {
      final user = UserRequest(
        username: userName,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phoneNumber,
      );
      context
          .read<EditProfileCubit>()
          .doAction(UpdateProfileDataAction(userBody: user));
    }
  }
}
