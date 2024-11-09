import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/features/questions/data/models/question_check_request.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_base-actions.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_cubit.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_state.dart';
import 'package:online_exam/features/questions/presentation/widgets/question_body_loading.dart';
import 'package:online_exam/features/questions/presentation/widgets/question_card.dart';

class QuestionBody extends StatefulWidget {
  const QuestionBody({Key? key}) : super(key: key);

  @override
  _QuestionBodyState createState() => _QuestionBodyState();
}

class _QuestionBodyState extends State<QuestionBody> {
  int currentQuestionIndex = 0;
  List<String?> selectedAnswers = [];

  QuestionCubit cubit = getIt.get<QuestionCubit>();
  void goToNextQuestion(int totalQuestions) {
    if (currentQuestionIndex < totalQuestions - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void goToPreviousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        if (state is GetQuestionLoading) {
          return const QuestionBodyLoading();
        } else if (state is GetQuestionError) {
          return Center(child: Text(state.errorMessage));
        } else if (state is GetQuestionSuccess) {
          final questions = state.questions;
          if (selectedAnswers.length < questions.length) {


            selectedAnswers = List<String?>.filled(questions.length, null);
          }

          return Container(
            color: MyColors.white,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LinearProgressIndicator(
                  value: (currentQuestionIndex + 1) / questions.length,
                  backgroundColor: Colors.grey[300],
                  color: Colors.blue,
                ),
                const SizedBox(height: 16),
                Text(
                  'Question ${currentQuestionIndex + 1} of ${questions.length}',
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 16),
                Text(
                  questions[currentQuestionIndex].question,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: questions[currentQuestionIndex].answers.length,
                    itemBuilder: (context, index) {
                      return OptionTile(
                        questionAnswer:
                        questions[currentQuestionIndex].answers[index],
                        isSelected: selectedAnswers[currentQuestionIndex] == questions[currentQuestionIndex].answers[index].key,
                        onTap: () {
                          setState(() {
                            selectedAnswers[currentQuestionIndex] = questions[currentQuestionIndex].answers[index].key;
                          });
                          cubit.doActions(SubmitQuestionAction(
                              body: CheckAnswers(
                                  questionId:
                                  questions[currentQuestionIndex].id,
                                  correct: questions[currentQuestionIndex]
                                      .answers[index]
                                      .key)));
                        },
                        questionId: questions[currentQuestionIndex].id,
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
                          onPressed: goToPreviousQuestion,
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
                          onPressed: () => goToNextQuestion(questions.length),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: const Color(0xff02369C),
                          ),
                          child: const Text(
                            'Next',
                            style:
                            TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text("No questions available."));
        }
      },
    );
  }
}
