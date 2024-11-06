import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_cubit.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_state.dart';
import 'package:online_exam/features/questions/presentation/widgets/question_card.dart';

class QuestionScreen extends StatefulWidget {
  static const String routeName = 'questionScreen';

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  List<String?> selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    context.read<QuestionCubit>().getQuestions("examId123");
  }

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: goToPreviousQuestion,
        ),
        title: Text(
          'Exam',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              children: [
                Icon(Icons.timer, color: Colors.grey),
                SizedBox(width: 5),
                Text(
                  '25:00',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
      body: BlocBuilder<QuestionCubit, QuestionState>(
        builder: (context, state) {
          if (state is GetQuestionLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetQuestionError) {
            return Center(child: Text(state.errorMessage));
          } else if (state is GetQuestionSuccess) {
            final questions = state.questions;

            if (selectedAnswers.length < questions.length) {
              selectedAnswers = List<String?>.filled(questions.length, null);
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(
                    value: (currentQuestionIndex + 1) / questions.length,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Question ${currentQuestionIndex + 1} of ${questions.length}',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  SizedBox(height: 16),
                  Text(
                    questions[currentQuestionIndex].question,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: questions[currentQuestionIndex].answers.length,
                      itemBuilder: (context, index) {
                        return OptionTile(
                          text: questions[currentQuestionIndex].answers[index].answer,
                          isSelected: selectedAnswers[currentQuestionIndex] == questions[currentQuestionIndex].answers[index].key,
                          onTap: () {
                            setState(() {
                              selectedAnswers[currentQuestionIndex] = questions[currentQuestionIndex].answers[index].key;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: goToPreviousQuestion,
                            child: Text(
                              'Back',
                              style: TextStyle(fontSize: 16, color: Color(0xff02369C)),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Color(0xff02369C)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () => goToNextQuestion(questions.length),
                            child: Text(
                              'Next',
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Color(0xff02369C),
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
            return Center(child: Text("No questions available."));
          }
        },
      ),
    );
  }
}
