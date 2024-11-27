import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Color backgroundColor;
  final TextStyle textStyle;
  final ButtonType buttonType;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.width,
    required this.height,
    this.padding = EdgeInsets.zero,
    this.backgroundColor = AppColors.brighterGreen,
    this.textStyle = TextStyles.loginButtonTextStyle,
    this.buttonType = ButtonType.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: _getButtonStyle(),
        child: Text(text, style: textStyle),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    switch (buttonType) {
      case ButtonType.primary:
        return ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: padding,
        );
      case ButtonType.secondary:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.brighterGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: AppColors.brighterGreen),
          ),
          padding: padding,
        );
      case ButtonType.outlined:
        return ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.brighterGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: AppColors.brighterGreen),
          ),
          padding: padding,
        );
      case ButtonType.text:
        return ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: AppColors.brighterGreen,
          elevation: 0,
          padding: padding,
        );
    }
  }
}

enum ButtonType { primary, secondary, outlined, text }