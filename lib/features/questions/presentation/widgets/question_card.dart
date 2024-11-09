import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/features/questions/data/models/question_check_request.dart';
import 'package:online_exam/features/questions/domain/entities/question.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_base-actions.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_cubit.dart';
import 'package:online_exam/features/questions/presentation/viewModel/question_state.dart';

class OptionTile extends StatelessWidget {
  final QuestionAnswers questionAnswer;
  final bool isSelected;
  final VoidCallback onTap;

  OptionTile({required this.questionAnswer, required this.isSelected, required this.onTap, required String questionId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionCubit, QuestionState>(
      builder: (context, state) {
        return GestureDetector(
          onTap:()  =>onTap(),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            decoration: BoxDecoration(
              color: isSelected ? MyColors.lightBlue_10 : MyColors.lightBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: Radio.adaptive(
                activeColor: MyColors.blue,
                toggleable: true,
                useCupertinoCheckmarkStyle: true,
                fillColor: WidgetStatePropertyAll(
                    WidgetStateColor.resolveWith((states) => MyColors.blue,)),
                value: isSelected ,
                groupValue: true,
                onChanged: (value) => onTap()),
              title: Text(questionAnswer.answer),
            ),
          ),
        );
      },
    );
  }
}
