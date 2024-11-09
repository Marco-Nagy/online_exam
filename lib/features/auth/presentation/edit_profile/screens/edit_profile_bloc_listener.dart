import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/widgets/animated_status_dialog.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/viewModel/edit_profile_cubit.dart';
import 'package:online_exam/features/auth/presentation/forget_password/ViewModel/forget_password_cubit.dart';

class EditProfileBlocListener extends StatelessWidget {
  const EditProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
        listener: (context, state) {
          if(state is ProfileLoading){
            AnimatedStatusDialog.show(status: Status.loading, message: '');
          }else if(state is EditProfileSuccess){
            AnimatedStatusDialog.show(status: Status.success, message: 'Your Profile Updated Successfully');

          }else if(state is ProfileError){
            context.pop();
            AnimatedStatusDialog.show(status: Status.error, message: state.errorModel.message??'Error');
            Future.delayed(const Duration(seconds: 3)).then((value) {
              context.pop();
            },);
          }else
            if(state is ChangePasswordSuccess){
            AnimatedStatusDialog.show(status: Status.success, message: 'Your Password Changed Successfully');
            context.pop();
          }
        },
        child: Container());
  }
}
