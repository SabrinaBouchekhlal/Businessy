import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/custom_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/colors.dart';


class GoogleSignInButton extends StatelessWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Image.asset('assets/img/google_logo.png', width: 24.0),
      label: const Text(
        'Sign in with Google',
        style: TextStyle(
          color: blackColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: whiteColor,
        minimumSize: const Size(double.infinity, 50),
        side: const BorderSide(color: inputBorder),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
