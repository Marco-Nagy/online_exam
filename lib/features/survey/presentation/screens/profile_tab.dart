import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/screens/edit_profile_form.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/viewModel/edit_profile_cubit.dart';
import 'package:online_exam/features/auth/presentation/edit_profile/viewModel/edit_profile_screen_actions.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt.get<EditProfileCubit>()
        ..doAction(GetProfileDataAction()),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.white,
          appBar: const CustomAppBar(title: 'Profile'),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
                child: BlocBuilder<EditProfileCubit, EditProfileState>(
                  builder: (context, state) {
                    if(state is GetProfileDataSuccess ) {
                      return EditProfileForm(user: state.user,);
                    }else if(state is EditProfileSuccess){
                      return  EditProfileForm(user: state.user,);
                    }else{
                      return const SizedBox();
                    }

                  },
                )),
          ),
        ),
      ),
    );
  }
}
