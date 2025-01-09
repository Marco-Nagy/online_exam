import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/core/utils/widgets/buttons/carved_button.dart';
import 'package:online_exam/core/utils/widgets/buttons/curved_border_button.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';
import 'package:online_exam/features/questions/presentation/questions/viewModel/question_base-actions.dart';
import 'package:online_exam/features/questions/presentation/questions/viewModel/question_cubit.dart';
import 'package:radial_progress/radial_progress.dart';

class ScoreScreen extends StatelessWidget {
  final QuestionCubit cubit;
  const ScoreScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        color: MyColors.white,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              'Your score',
              style:MyFonts.styleSemiBold600_20 ,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: RadialProgressWidget(
                  enableAnimation: true,
                    animationDuration: const Duration(seconds: 2),
                    diameter: 150,
                    progressLineWidth: 10,
                    startAngle: StartAngle.top,
                    percent: cubit.gradePercent,
                    centerChild:  Text(
                      ((cubit.gradePercent*100).toInt()).toString(),
                      style: MyFonts.styleBold700_24,
                    ),
                    progressLineColors: const [MyColors.blue],
                    bgLineColor: MyColors.red,
                  ),
                ),

                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           Text(
                            'Correct',
                            style: MyFonts.styleSemiBold600_16.copyWith(color: MyColors.blue),
                          ),
                          horizontalSpacing( 20),

                          CurvedBorderButton(
                            width: 50,
                            height: 50,
                            color: MyColors.blue,
                            title: cubit.totalCorrectAnswers.toString(),
                            onTap: (){},
                          ),
                        ],
                      ),
                       verticalSpacing( 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                           Text(
                            'Incorrect',
                            style: MyFonts.styleSemiBold600_16.copyWith(color: MyColors.red),
                          ),
                          horizontalSpacing( 20),
                          CurvedBorderButton(
                            width: 50,
                            height: 50,
                            color: MyColors.red,
                            title: cubit.totalWrongAnswers.toString(),
                            onTap: (){},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CurvedButton(
              onTap: () {
                context.pushNamed(AppRoutes.answers, arguments: cubit.exam);

              },
              title: 'Show results',
              color: MyColors.blue,
            ),
            const SizedBox(height: 16),
            CurvedBorderButton(
              onTap: () {
                cubit.doActions(StartExamActionAgain());
              },
              title: 'Start again',
              color: MyColors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
