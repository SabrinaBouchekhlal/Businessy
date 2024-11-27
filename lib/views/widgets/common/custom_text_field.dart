import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool obscureText;
  final double width;
  final double height;
  final double borderRadius;
  final double borderWidth;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    required this.width,
    required this.height,
    this.borderRadius = 0.0,
    this.borderWidth = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(width: borderWidth, color: AppColors.inputBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(width: 2, color: AppColors.brighterGreen),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: const BorderSide(width: 2, color: Colors.red),
          ),
          labelStyle: TextStyles.inputTextStyle,
          hintStyle: TextStyles.inputTextStyle.copyWith(color: AppColors.inputPlaceholder),
          contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        ),
      ),
    );
  }
}