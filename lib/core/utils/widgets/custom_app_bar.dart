import 'package:flutter/material.dart';
import 'package:online_exam/core/styles/app_images.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.actionButtons});

  final bool isMain = true;
  final String title;
  final List<Widget>? actionButtons;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: isMain
          ? Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppImages.arrowBack,
                    width: 24,
                    height: 24,
                    color: MyColors.black,
                  )),
            ],
          )
          : const SizedBox.shrink(),
      title: Text(
        title,
        style: MyFonts.styleMedium500_20.copyWith(color: MyColors.black),
      ),
      titleSpacing: 0,
      titleTextStyle: MyFonts.styleMedium500_20.copyWith(color: MyColors.black),
      centerTitle: false,
      elevation: 0,
      actions: actionButtons,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
