import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/styles/app_images.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';

class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key, required this.item});
  final Exam item;

  @override
  build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: const CustomAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exam Header with Icon, Title, Level, Questions, and Duration
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Exam Icon
                Image.asset(
                  AppImages.examIco, // Replace with your image URL or AssetImage if using local assets
                  width: 48,
                  height: 48,
                ),
                 horizontalSpacing(8),
                // Exam Title, Level, and Questions
                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style:MyFonts.styleSemiBold600_20.copyWith(color: MyColors.black),
                      ),
                      verticalSpacing( 4),
                      Row(
                        children: [
                          Text(
                            item.title,
                            style:MyFonts.styleMedium500_18.copyWith(color: MyColors.gray)
                          ),
                          Text(
                            ' | ',
                            style:  MyFonts.styleRegular400_16.copyWith(color: MyColors.gray),
                          ),
                          Text(
                            '${item.numberOfQuestions} Questions',
                            style: MyFonts.styleRegular400_16.copyWith(color: MyColors.gray),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Exam Duration
                 Text(
                  '${item.duration} Minutes',
                  style:  MyFonts.styleRegular400_13.copyWith(color: MyColors.blue),
                ),
              ],
            ),
            verticalSpacing(  32),

            // Instructions Section
             Text(
              'Instructions',
              style:  MyFonts.styleMedium500_18.copyWith(color: MyColors.black),
            ),
            verticalSpacing(  16),
            // Instructions List
             Text(
              '• Lorem ipsum dolor sit amet consecrate.\n'
                  '• Lorem ipsum dolor sit amet consectetur.\n'
                  '• Lorem ipsum dolor sit amet consectetur.\n'
                  '• Lorem ipsum dolor sit amet consectetur.',
              style:  MyFonts.styleMedium500_14.copyWith(color: MyColors.gray),
            ),

            verticalSpacing(  48),
            // Start Button
        CurvedButton(
          color: MyColors.blue,
          title: 'Start',
          onTap: () {
            context.pushNamed(AppRoutes.questions, arguments: item);

          },
        ),

          ],
        ),
      ),
    );
  }
}
