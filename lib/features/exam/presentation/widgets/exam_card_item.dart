import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/styles/app_images.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';

class ExamCardItem extends StatelessWidget {
  const ExamCardItem({
    super.key,
    required this.item,
  });

  final Exam item;

  @override
  Widget build(BuildContext context) {
    return Card(
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
            Image.asset(
              AppImages.examIco,
              height: 71.h,
              width: 60.w,
            ), // Placeholder for custom image
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: MyFonts.styleMedium500_16
                        .copyWith(color: MyColors.black),
                  ),
                  Text(
                    '${item.numberOfQuestions} Questions',
                    style: MyFonts.styleRegular400_13
                        .copyWith(color: MyColors.gray),
                  ),
                  Text(
                    'From: 1.00   To: 6.00',
                    style: MyFonts.styleRegular400_13
                        .copyWith(color: MyColors.black),
                  ),
                ],
              ),
            ),
            Text(
              '${item.duration} Minutes',
              style: MyFonts.styleRegular400_13.copyWith(color: MyColors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
