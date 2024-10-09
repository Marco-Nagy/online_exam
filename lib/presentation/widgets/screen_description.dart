import 'package:flutter/material.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';

class ScreenDescription extends StatelessWidget {
  const ScreenDescription({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(title,
      textAlign: TextAlign.center,
      style: MyFonts.styleRegular400_14.copyWith(color: MyColors.gray),
    );
  }
}
