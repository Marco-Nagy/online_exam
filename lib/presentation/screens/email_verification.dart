import 'package:flutter/material.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/core/utils/widgets/app_text_form_field.dart';
import 'package:online_exam/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/presentation/widgets/verification_code.dart';
import 'package:online_exam/presentation/widgets/screen_description.dart';
import 'package:online_exam/presentation/widgets/screen_title.dart';

class EmailVerification extends StatelessWidget {
   EmailVerification({super.key});
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
                     VerificationCode(),
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
