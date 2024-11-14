import 'package:flutter/material.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_base-actions.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_cubit.dart';
import 'package:online_exam/features/questions/presentation/widgets/question_card.dart';

class QuestionBody extends StatelessWidget {
 final int currentQuestionIndex;
 final QuestionCubit cubit;
 const QuestionBody(this.currentQuestionIndex, this.cubit, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LinearProgressIndicator(
            value: (currentQuestionIndex+1) / (cubit.questions.length),
            backgroundColor: Colors.grey[300],
            color: Colors.blue,
          ),
          const SizedBox(height: 16),
          Text(
            'Question ${currentQuestionIndex+1}  of ${cubit.questions.length}',
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 16),
          Text(
            cubit.questions[currentQuestionIndex].question,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: cubit.questions[currentQuestionIndex].answers.length,
              itemBuilder: (context, index) {
                return OptionTile(
                  questionAnswer:
                  cubit.questions[currentQuestionIndex].answers[index],
                  isSelected:  cubit.isAnswerSelected(cubit.questions[currentQuestionIndex].answers[index].key),
                  onTap: () {
                    cubit.doActions(SelectQuestionAction(
                        body: CheckAnswers(
                            questionId:
                            cubit.questions[currentQuestionIndex].id,
                            correct: cubit.questions[currentQuestionIndex]
                                .answers[index]
                                .key)));
                  },
                  questionId: cubit.questions[currentQuestionIndex].id,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: cubit.goToPreviousQuestion,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side:
                        const BorderSide(color: Color(0xff02369C)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Back',
                      style: TextStyle(
                          fontSize: 16, color: Color(0xff02369C)),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if((currentQuestionIndex + 1) == cubit.questions.length)  {
                        cubit.doActions(SubmitFinishExamAction());
                      }else {
                        cubit
                          .goToNextQuestion(cubit.questionCount + 1);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: const Color(0xff02369C),
                    ),
                    child: Text(
                      (currentQuestionIndex+1)==cubit.questions.length?"Submit":'Next',
                      style:
                      const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
