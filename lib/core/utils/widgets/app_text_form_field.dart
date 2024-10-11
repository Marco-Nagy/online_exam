import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_exam/core/styles/colors/my_colors.dart';
import 'package:online_exam/core/styles/fonts/my_fonts.dart';


class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    required this.controller,
    required this.hintText,
    super.key,
    this.filled = false,
    this.obscureText = false,
    this.readOnly = false,
    this.validator,
    this.fillColour,
    this.suffixIcon,
    this.keyboardType,
    this.hintStyle,
    this.overrideValidator = false,
    this.prefixIcon,
    this.onChanged,
    this.maxLength,
    this.maxLines ,
    this.height ,
    this.width = double.infinity,
    required this.labelText,
    this.autofocus=false,
    this.inputFormatters = const [],

  });

  final String? Function(String?)? validator;
  final Function? onChanged;
  final TextEditingController controller;
  final bool filled;
  final Color? fillColour;
  final bool obscureText;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final bool overrideValidator;
  final TextStyle? hintStyle;
  final int? maxLength;
  final int? maxLines;
  final double? height ;
  final double? width ;
  final bool autofocus ;
  final List<TextInputFormatter> inputFormatters ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      cursorColor: MyColors.gray,
      style:  TextStyle(
        height:height,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: MyColors.gray,
      ),
      validator: (value) {
        return validator!(value);
      },
      onChanged: onChanged == null ? (value) {} : (value) => onChanged!(value),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLines: maxLines,
      readOnly: readOnly,
      maxLength: maxLength,
      decoration: InputDecoration(
        isDense: true,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: MyColors.gray),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: MyColors.gray),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.red),

        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: Colors.red),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        filled: filled,
        fillColor: fillColour,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        labelText: labelText,

        labelStyle:
            MyFonts.styleRegular400_14.copyWith(
              color: MyColors.gray,
            ),
        hintText: hintText,
        hintStyle: hintStyle ??
            MyFonts.styleRegular400_14.copyWith(
              color: MyColors.placeHolder,
            ),
        errorStyle: MyFonts.styleRegular400_12.copyWith(
          color: Colors.red,
        ),
      ),
    );
  }
}
