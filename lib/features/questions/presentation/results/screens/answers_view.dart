import 'package:flutter/material.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/presentation/results/widgets/question_widget.dart';

class AnswersView extends StatelessWidget {
  final CheckedExam exam;

  const AnswersView(this.exam, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results',
          style: MyFonts.styleMedium500_18,
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context,int  index) {
          return QuestionWidget(
          selectedAnswers:exam.checkAnswers,

          question: exam.checkedQuestions[index],
        );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: exam.checkedQuestions.length,
      ),
    );
  }
}
