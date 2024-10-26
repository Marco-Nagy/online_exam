import 'package:flutter/material.dart';
import 'package:online_exam/features/exam/domain/entities/exam.dart';

import 'exam_card_item.dart';

class ExamList extends StatelessWidget {
  final List<Exam> examList;
  const ExamList({super.key, required this.examList});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: examList.length,
        itemBuilder: (context, index) {
          return ExamCardItem(
            item: examList[index],
          );
        },
      ),
    );
  }
}
