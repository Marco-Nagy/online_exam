import 'package:flutter/material.dart';

class NavBarIcon extends StatelessWidget {
  final String imagePath;
  final bool isSelected;

  NavBarIcon({required this.isSelected, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isSelected ? Color(0xffCCD7EB) : Colors.transparent,
          shape: BoxShape.circle),
      padding: EdgeInsets.all(5),
      child: ImageIcon(AssetImage(imagePath),
          color: isSelected ? Color(0xff02369C) : Color(0xff878787)),
    );
  }
}
