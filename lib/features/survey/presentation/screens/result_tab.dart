import 'package:flutter/material.dart';
import 'package:online_exam/features/questions/presentation/results/screens/result_view.dart';

class ResultTab extends StatelessWidget {
  const ResultTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:const ResultView(),
    );
  }
}
