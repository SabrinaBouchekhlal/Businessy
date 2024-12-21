import 'package:businessy/views/widgets/common/auth/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/auth/custom_button.dart';
import 'package:businessy/views/widgets/common/auth/logo.dart';
import 'package:businessy/views/widgets/common/auth/google_sign_in_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  
  static const String pageRoute = '/SetNewPasswordScreen';

  final TextEditingController _newpasswordController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, size: 30,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //const Center(child: Logo()),
                const Center(
                  child: const Column(children: [
                    Logo(),
                    const SizedBox(height: 33.0),
                    const Text(
                      'Create new password',
                       style:LoginTypography.heading,
                      ),
                      const SizedBox(height: 12.0),
                    const Text(
                      'Your new password must be unique from those previously used',
                      style: LoginTypography.subHeading,
                      textAlign: TextAlign.center,
                     ),
                  
                  ],),
                ),
                const SizedBox(height: 44.0),
               CustomTextField(
                  labelText: 'New Password',
                  controller: _newpasswordController,
                  obscureText: true,
                  suffixIcon: const Icon(Icons.visibility_outlined, color: darkGrey),
                ),
                const SizedBox(height: 14.0),
                CustomTextField(
                  labelText: 'Confirm Password',
                  controller: _confirmpasswordController,
                  obscureText: true,
                  suffixIcon: const Icon(Icons.visibility_outlined, color: darkGrey),
                ),
                const SizedBox(height: 33.0),
                
                CustomButton(
                  text: 'Verify',
                  onPressed: () {
                    // Login functionality
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