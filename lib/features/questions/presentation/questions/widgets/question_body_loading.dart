import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/utils/widgets/loading_shimmer.dart';

class QuestionBodyLoading extends StatefulWidget {
  const QuestionBodyLoading({super.key});

  @override
  _QuestionBodyLoadingState createState() => _QuestionBodyLoadingState();
}

class _QuestionBodyLoadingState extends State<QuestionBodyLoading> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.white,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const SizedBox(height: 16),
          LoadingShimmer(
            height: 10.h,
            width: 60.w,
          ),
          const SizedBox(height: 16),
          LoadingShimmer(
              height: 20.h,
              width: 150.w,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount:4,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 16.0),
                  decoration: BoxDecoration(
                    color: MyColors.lightBlue ,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: LoadingShimmer(
                      height: 10.h,
                      width: 10.w,
                      borderRadius: 50,
                    ),
                    title: LoadingShimmer(
                      height: 20.h,
                      width: 180.w,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
