import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/features/questions/domain/entities/checked_exam.dart';
import 'package:online_exam/features/questions/presentation/results/viewModel/result_cubit.dart';
import 'package:online_exam/features/questions/presentation/results/widgets/result_exam_widget.dart';

class ResultView extends StatefulWidget {
  const ResultView({super.key});

  @override
  State<ResultView> createState() => _ResultViewState();
}

class _ResultViewState extends State<ResultView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<ResultCubit>()
        ..getSubmittedExamsList(),
      child: BlocBuilder<ResultCubit, ResultState>(
        builder: (context, state) {
          if (state is GetSubmittedExamsListSuccessState) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Results',
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge,
                    ),
                  ),
                  Expanded(

                    child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context, index) {
                          if (index < (state.examsList.length)) {
                            return
                              ResultExamWidget(
                                state.examsList[index],
                                'Question',
                                'minutes',
                                "correct of",
                                    (CheckedExam exam) {
                                  context.pushNamed(AppRoutes.answers, arguments: state.examsList[index]);

                                },

                              );
                          } else {
                            return const Padding(
                              padding: EdgeInsets.all(24),
                              child: Center(
                                  child: CircularProgressIndicator()),
                            );
                          }
                        },
                        separatorBuilder: (context, index) =>
                        const SizedBox(
                          height: 16,
                        ),
                        itemCount: state.examsList.length),

                  ),
                ],
              ),
            );

          }  else{
            return const SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'No submitted exams yet.',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

