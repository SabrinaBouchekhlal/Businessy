import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';



class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: brighterGreen,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Urbanist',
          fontSize: 16.0,
          color: whiteColor,
        ),
      ),
    );
  }
}
