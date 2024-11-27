import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  static const String _fontFamily = 'Urbanist';

  static const TextStyle welcomeTextStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppColors.blackShade,
  );

  static const TextStyle inputTextStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle forgetPasswordTextStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: AppColors.darkGrey,
  );

  static const TextStyle keepLoggedInTextStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.blackShade,
  );

  static const TextStyle loginButtonTextStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle orTextStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w500,
    color: AppColors.blackShade,
  );

  static const TextStyle googleButtonTextStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.blackShade,
  );

  static const TextStyle signUpTextStyle = TextStyle(
    fontFamily: _fontFamily,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: AppColors.brighterGreen,
  );
}

