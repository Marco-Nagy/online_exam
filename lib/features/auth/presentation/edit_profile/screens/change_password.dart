import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/utils/validators.dart';
import 'package:online_exam/core/utils/widgets/app_text_form_field.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/features/auth/data/models/request/change_password_request.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/viewModel/edit_profile_cubit.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/viewModel/edit_profile_screen_actions.dart';

import 'edit_profile_bloc_listener.dart';

class ChangePasswordScreen extends HookWidget {
  ChangePasswordScreen({super.key});

  final formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final hasChanged = useState(false);

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: const CustomAppBar(title: 'Change Password'),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Center(
              child: Form(
                key: formKye,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const EditProfileBlocListener(),

                    verticalSpacing(40),

                    AppTextFormField(
                      controller: currentPasswordController,
                      hintText: 'Enter your Current Password',
                      labelText: 'Current password',
                      onChanged: (value) => hasChanged.value = true,

                      validator: (value) => Validators.validatePassword(value),
                    ),
                    verticalSpacing(16),
                    AppTextFormField(
                      controller: newPasswordController,
                      hintText: 'Enter your New Password',
                      labelText: 'New password',
                      onChanged: (value) => hasChanged.value = true,
                      validator: (value) => Validators.validatePassword(value),
                    ),
                    verticalSpacing(16),
                    AppTextFormField(
                      controller: confirmPasswordController,
                      hintText: 'Confirm Password',
                      labelText: 'Confirm password',
                      onChanged: (value) => hasChanged.value = true,
                      validator: (value) => Validators.validatePassword(value),
                    ),
                    verticalSpacing(48),
                    CurvedButton(
                      color: MyColors.blue,
                      title: 'Update',
                      onTap: () {
                        if (formKye.currentState!.validate()) {
                          context
                              .read<EditProfileCubit>()
                              .doAction(ChangePasswordAction(
                                  body: ChangePasswordRequest(
                                currentPasswordController.text,
                                newPasswordController.text,
                                confirmPasswordController.text,
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
