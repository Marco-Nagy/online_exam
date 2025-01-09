import 'package:flutter/material.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';

class QuestionWidget extends StatelessWidget {
  final Question question;
  final List<CheckAnswers> selectedAnswers;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: MyColors.black,
            blurRadius: 8,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.question,
            style: MyFonts.styleMedium500_18,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          // Wrap the ListView in a ConstrainedBox
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 300, // Set a reasonable height limit
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: question.answers.length,
              itemBuilder: (context, index) {
           Color fillColor =     question.answers[index].key== question.correct
                    ? MyColors.green
                    : question.answers[index].key == selectedAnswers[index].correct &&question.answers[index].key!=question.correct
                    ? MyColors.red
                    : MyColors.blue;
                return Container(
                  margin: const EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: fillColor,
                    ),
                  ),
                  child: ListTile(
                    leading: Radio.adaptive(
                        activeColor: fillColor,
                        fillColor: WidgetStatePropertyAll(
                            WidgetStateColor.resolveWith((states) =>  fillColor,)),
                        value: question.answers[index].key == selectedAnswers[index].correct ,
                        groupValue: true,
                        onChanged: (value) {}),
                    title:  Text(
                      question.answers[index].answer,
                      style: MyFonts.styleMedium500_16,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
