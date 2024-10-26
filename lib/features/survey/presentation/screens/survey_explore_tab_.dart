import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/utils/widgets/error_indicator.dart';
import 'package:online_exam/core/utils/widgets/loading_indicator.dart';
import 'package:online_exam/di/di.dart';
import 'package:online_exam/features/survey/presentation/cubit/survey_cubit.dart';
import 'package:online_exam/features/survey/presentation/cubit/survey_states.dart';
import 'package:online_exam/features/survey/presentation/widgets/search_textfield.dart';
import 'package:online_exam/features/survey/presentation/widgets/subject_card.dart';

class SurveyTab extends StatelessWidget {
  static const String routeName = "surveyTab";

  const SurveyTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SubjectCubit>()..getSubject(),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35.h, left: 16.w),
                child: Text(
                  "Survey",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.h, left: 16.w),
                child: SearchTextField(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.h, left: 16.w),
                child: Text(
                  "Browse by subject",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: BlocBuilder<SubjectCubit, SubjectState>(
                    builder: (context, state) {
                      // if (state is GetSubjectLoading) {
                      //   return LoadingIndicator();
                      // } else if (state is GetSubjectError) {
                      //   return ErrorIndicator();
                       if (state is GetSubjectSuccess) {
                        return Padding(
                          padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 20),
                          child:  GridView.builder(
                              itemBuilder: (context, index) {
                                return SubjectCard(state.subject[index]);
                              },
                              itemCount: state.subject.length,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 1 / 0.32,
                                mainAxisSpacing: 8.h,
                              )),
                        );
                      }else{
                        return SizedBox();
                      }
                    }),
              ),
              // SubjectCard(),
              // SubjectCard(),
              // SubjectCard(),
              // SubjectCard(),
            ],
          ),
        ),
      ),
    );
  }
}
