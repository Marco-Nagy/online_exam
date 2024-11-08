import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/app_images.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_cubit.dart';
import 'package:online_exam/features/questions/presentation/widgets/time_out_dialog.dart';



class TimerWidget extends StatefulWidget {
   final ValueNotifier<int> duration;
   final int totalTime;

   const TimerWidget( {super.key, required this.totalTime,required this.duration,});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
Timer? _timer ;
QuestionCubit cubit = getIt.get<QuestionCubit>();

  @override
  void initState() {
    super.initState();

    startCountdown();
  }
  void startCountdown() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.duration.value > 0) {
        setState(() {
          widget.duration.value --;

        });
      } else {
        _timer?.cancel();

        TimeOutDialog.show();

      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: widget.duration,
      builder: (context, value, child) {
        String minutes =
        (value ~/ 60).toString().padLeft(2, '0');
        String seconds = (value % 60).toString().padLeft(2, '0');


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
                '$minutes:$seconds',
                style: TextStyle(color:value>=(widget.totalTime/2)? Colors.green:Colors.red, fontSize: 16),
              ),
            ],
          ),
        );
      },
    );
  }
}
