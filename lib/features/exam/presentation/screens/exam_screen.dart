import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/utils/widgets/custom_app_bar.dart';
import 'package:online_exam/features/exam/presentation/viewModel/exam_cubit.dart';
import 'package:online_exam/features/exam/presentation/widgets/exam_list.dart';
import 'package:online_exam/features/exam/presentation/widgets/exam_loading.dart';

class ExamScreen extends StatelessWidget {
  const ExamScreen({super.key, required this.subjectId});

  final String subjectId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ExamCubit, ExamState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: MyColors.white,
            appBar: const CustomAppBar(title: 'Exams'),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: state is SuccessExamList
                  ? ExamList(examList: state.exams)
                  : const ExamLoading(),
            ),
          );
        },
      ),
    );
  }
}
