import 'package:flutter/material.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';

class CurvedBorderButton extends StatelessWidget {
  const CurvedBorderButton({super.key, required this.color, required this.title, required this.onTap, this.height, this.width});
  final Color color;
  final String title;
  final VoidCallback onTap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??50,
      width: width??double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          backgroundColor: MyColors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: color, width: 1.5),
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: MyFonts.styleMedium500_18.copyWith(color: color),
          ),
        ),
      ),
    );
  }
}
