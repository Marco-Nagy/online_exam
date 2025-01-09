import 'package:flutter/material.dart';

class NavBarIcon extends StatelessWidget {
  final String imagePath;
  final bool isSelected;

  const NavBarIcon({super.key, required this.isSelected, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? const Color(0xffCCD7EB) : Colors.transparent,
          shape: BoxShape.circle),
      padding: const EdgeInsets.all(5),
      child: ImageIcon(AssetImage(imagePath),
          color: isSelected ? const Color(0xff02369C) : const Color(0xff878787)),
    );
  }
}
