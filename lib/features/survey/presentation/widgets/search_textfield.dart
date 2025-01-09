import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: "search",
        hintStyle: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 14.sp,
          color: const Color(0xff535353),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).primaryColor,
          size: 24.sp,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(
              color: Color(0xff535353),
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(
              color: Color(0xff535353),
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: const BorderSide(
              color: Color(0xff535353),
            )),
      ),
    );
  }
}
