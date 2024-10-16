import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/features/auth/presentation/widgets/screen_description.dart';
import 'package:online_exam/features/auth/presentation/widgets/screen_title.dart';
import 'package:online_exam/features/auth/presentation/forget_password/screens/verification_code.dart';

import 'forget_password_bloc_listener.dart';




class EmailVerification extends HookWidget {

  EmailVerification({super.key});
  final formKye = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();

    return SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.white,
          appBar: const CustomAppBar(title: 'Password'),
          body: Padding(
            padding:  EdgeInsets.all(16.0.sp),
            child: Center(
              child: Form(
                key: formKye,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const ForgetPasswordBlocListener(),
                    verticalSpacing(40),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 50.0.w),
                      child: Column(
                        children: [
                          const ScreenTitle(
                            title: 'Email verification',
                          ),
                          verticalSpacing(16),
                          const ScreenDescription(
                              title:
                              'Please enter your code that send to your email address '),
                        ],
                      ),
                    ),
                    verticalSpacing(32),
                     const VerificationCode(),
                    verticalSpacing(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Didn't receive code?" ,
                          textAlign: TextAlign.center,
                          style: MyFonts.styleRegular400_16.copyWith(color: MyColors.black),
                        ),
                        horizontalSpacing(8),
                        InkWell(
                          onTap: (){

                          },
                          child: Text("Resend" ,
                            textAlign: TextAlign.center,
                            style: MyFonts.styleRegular400_16.copyWith(color: MyColors.blue),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
