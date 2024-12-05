import 'package:flutter/material.dart';
import 'package:businessy/views/screens/auth/login_screen.dart';
import 'package:businessy/views/screens/auth/sign_up_screen2.dart';
import 'package:businessy/views/screens/auth/otp_verification.dart';
import 'package:businessy/views/screens/auth/sign_up_screen.dart';
import 'package:businessy/views/screens/auth/business_setup_screen.dart';
import 'package:businessy/views/screens/auth/forgot_password_screen.dart';
import 'package:businessy/views/screens/auth/otp_verification.dart';
import 'package:businessy/views/screens/auth/set_new_password_screen.dart';
import 'package:businessy/views/screens/auth/logo_upload_screen.dart';
import 'package:businessy/views/screens/auth/details_screen.dart';
import 'package:businessy/views/screens/auth/add_item_screen.dart';
import 'package:businessy/views/screens/auth/edit_item_screen.dart';
import 'package:businessy/views/screens/auth/insights_screen.dart';
import 'package:businessy/views/screens/auth/settings_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginScreen(),//LoginScreen(),
       routes: {
        '/LoginScreen': (ctx) => LoginScreen(),
       '/ForgotPasswordScreen': (ctx) => ForgotPasswordScreen(),
       '/SetNewPasswordScreen': (ctx) => SetNewPasswordScreen(),
        '/BusinessSetupScreen'  : (ctx) => BusinessSetupScreen(),
        '/SignUpScreen': (ctx) => SignUpScreen(),
        '/SignUpScreen2': (ctx) => SignUpScreen2(),
        '/OtpVerification': (ctx) => OtpVerification(),
        '/LogoUploadScreen': (ctx) => LogoUploadScreen(),
      },
     
    );
  }
}



