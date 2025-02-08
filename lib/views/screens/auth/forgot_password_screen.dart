import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/widgets/common/auth/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/auth/custom_button.dart';
import 'package:businessy/views/widgets/common/auth/logo.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/typography.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  static const String pageRoute = '/ForgotPasswordScreen';

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: LoginDimensions.pagePadding, vertical: 36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Column(
                    children: [
                      const Logo(),
                      const SizedBox(height: 33.0),
                      Text(
                        'Forgot Password?',
                        style: LoginTypography.heading,
                      ),
                      const SizedBox(height: 12.0),
                      Text(
                        'Don’t worry! Just enter your email, and we’ll help you reset your password.',
                        style: LoginTypography.subHeading,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26.0),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                ),
                const SizedBox(height: 26.0),
                CustomButton(
                  text: 'Send Code',
                  onPressed: () {
                    Navigator.pushNamed(context, '/OtpVerification');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

