import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_exam/core/styles/animated_image.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';

class ResultExamWidget extends StatelessWidget {
  final CheckedExam exam;
  final String questionTitle;
  final String minutesTitle;
  final String correctTitle;
  final Function onPress;

  const ResultExamWidget(this.exam, this.questionTitle, this.minutesTitle,
      this.correctTitle, this.onPress,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress(exam);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(
                color: MyColors.gray,
                blurRadius: 8,
                offset: Offset(0, 0),
              )
            ]),
        child: Row(
          children: [
            Lottie.asset(
                (exam.correctAnswers) >= ((exam.checkedQuestions.length) / 2)
                    ? AnimatedImage.success
                    : AnimatedImage.error,
                height: 64,
                width: 64),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${exam.correctAnswers} $correctTitle ${exam.checkedQuestions.length}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${exam.duration} $minutesTitle",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: MyColors.blue,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
