import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/custom_button.dart';
import 'package:businessy/views/widgets/common/custom_text_field.dart';
import 'package:businessy/views/widgets/common/logo.dart';
import 'package:businessy/views/widgets/common/google_sign_in_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';

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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 36.0),
                //const Center(child: Logo()),
                Center(
                  child: const Column(children: [
                    Logo(),
                    const SizedBox(height: 33.0),
                    const Text(
                      'Forgot Password?',
                       style:headingTextStyle ,
                      ),
                      const SizedBox(height: 12.0),
                    const Text(
                      'Don’t worry! Just enter your email, and we’ll help you reset your password.',
                      style: subHeadingTextStyle,
                      textAlign: TextAlign.center,
                     ),
                  
                  ],),
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
                    Navigator.pushNamed(context,'/OtpVerification');
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