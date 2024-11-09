import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/app_images.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';
import 'package:online_exam/features/questions/data/models/question_check_request.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_base-actions.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_cubit.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_state.dart';
import 'package:online_exam/features/questions/presentation/widgets/question_body.dart';
import 'package:online_exam/features/questions/presentation/widgets/question_card.dart';
import 'package:online_exam/features/questions/presentation/widgets/timer_widget.dart';

class QuestionScreen extends StatefulWidget {
  final Exam exam;

  const QuestionScreen({
    super.key,
    required this.exam,
  });

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: (){},
        ),
        title: const Text(
          'Exam',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TimerWidget(
            totalTime: widget.exam.duration*60,
            duration: ValueNotifier(widget.exam.duration*60),
          )
        ],
      ),
      body: const QuestionBody(),
    );
  }
}
