import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/utils/widgets/loading_shimmer.dart';
import 'package:online_exam/core/utils/widgets/spacing.dart';

class ExamLoading extends StatelessWidget {
  const ExamLoading({
    super.key,});



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => SizedBox(
        child: Card(
          color: MyColors.white,
          elevation: 11,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LoadingShimmer(
                height: 71.h,
                width: 60.w,
              ),
              // Placeholder for custom image
              horizontalSpacing( 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoadingShimmer(
                      height: 19.h,
                      width: 75.w,
                    ),
                    verticalSpacing(5),
                    LoadingShimmer(
                      height: 16.h,
                      width: 75.w,
                    ),
                    verticalSpacing(5),
                    LoadingShimmer(
                      height: 16.h,
                      width: 126.w,
                    ),


                  ],
                ),
              ),
              LoadingShimmer(
                height: 16.h,
                width: 69.w,
              ),
            ],
          ),
        ),
            ),
      ),);
  }
}
