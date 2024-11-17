import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/app_images.dart';
import 'package:online_exam/features/exam/data/mappers/exam_mapper.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';
import 'package:online_exam/features/questions/data/mappers/question_mapper.dart';
import 'package:online_exam/features/questions/presentation/viewModel/questions/question_cubit.dart';


class TimerWidget extends StatefulWidget {
  final Exam exam;
  const TimerWidget({
    super.key,
    required this.exam,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {

  @override
  void initState() {
    super.initState();
    QuestionCubit cubit = context.read<QuestionCubit>();

    cubit.exam = QuestionMapper.toQuestionResponseModel(widget.exam);
  }



  @override
  Widget build(BuildContext context) {
    QuestionCubit cubit = context.read<QuestionCubit>();

    return ValueListenableBuilder(
      valueListenable: cubit.timeMessage,
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            children: [
              Image.asset(
                AppImages.timer,
                height: 30.h,
                width: 24.w,
              ),
              const SizedBox(width: 5),
              Text(
                cubit.timeMessage.value,
                style: TextStyle(
                    color: cubit.isWarning() ? Colors.green : Colors.red,
                    fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
