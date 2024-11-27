import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/custom_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
/*
class GoogleSignInButton extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets padding;
  final double borderRadius;
  final double borderWidth;

  const GoogleSignInButton({
    Key? key,
    required this.width,
    required this.height,
    required this.padding,
    required this.borderRadius,
    required this.borderWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        // Handle Google sign-in
      },
      text: 'Sign in with Google',
      width: width,
      height: height,
      padding: padding,
      backgroundColor: Colors.white,
      textStyle: TextStyles.googleButtonTextStyle,
      buttonType: ButtonType.outlined,
    );
  }
}*/

import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/custom_button.dart';
import 'package:businessy/views/themes/style/typography.dart';

class GoogleSignInButton extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsets padding;
  final double borderRadius;
  final double borderWidth;

  const GoogleSignInButton({
    Key? key,
    this.width = 300.0, // Default width
    this.height = 50.0, // Default height
    this.padding = const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Default padding
    this.borderRadius = 16.0, // Default border radius
    this.borderWidth = 2.0, // Default border width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () {
        // TODO: Handle Google sign-in logic
      },
      text: 'Sign in with Google',
      width: width,
      height: height,
      padding: padding,
      backgroundColor: Colors.white,
      textStyle: TextStyles.googleButtonTextStyle,
      buttonType: ButtonType.outlined,
    );
  }
}
