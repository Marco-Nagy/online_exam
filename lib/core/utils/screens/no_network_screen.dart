import 'package:flutter/material.dart';
import 'package:online_exam/core/styles/app_images.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';


class NoNetworkScreen extends StatelessWidget {
  const NoNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('No Network',
              style: MyFonts.styleSemiBold600_18.copyWith(color: Colors.black),
          ),
        ),
        body: Container(
          constraints: const BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.noNetwork),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
