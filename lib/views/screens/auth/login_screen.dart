import 'package:flutter/material.dart';
import 'package:businessy/services/auth_service.dart';
import 'package:businessy/views/widgets/common/custom_button.dart';
import 'package:businessy/views/widgets/common/custom_text_field.dart';
import 'package:businessy/views/widgets/common/logo.dart';
import 'package:businessy/views/widgets/common/google_sign_in_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/dimensions.dart';

/*
class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
 

  void _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      
      // Navigate to the home screen
    } catch (e) {
      // Handle login error
    }
  }

  void _handleForgotPassword() {
    // Navigate to the password reset screen
  }

  void _handleSignUp() {
    // Navigate to the registration screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: Dimensions.loginArrowTop),
            Icon(Icons.arrow_back, size: Dimensions.loginArrowSize),
            SizedBox(height: Dimensions.logoImageTop - Dimensions.loginArrowTop),
            Logo(),
            SizedBox(height: Dimensions.welcomeTextTop - Dimensions.logoImageTop),
            Text('Welcome back! Glad to see you, again!', style: TextStyles.welcomeTextStyle),
            SizedBox(height: Dimensions.emailFieldTop - Dimensions.welcomeTextTop),
            CustomTextField(
              controller: _emailController,
              label: 'Email',
              hintText: 'Enter your email',
              width: Dimensions.emailFieldWidth,
              height: Dimensions.emailFieldHeight,
              borderRadius: Dimensions.emailFieldBorderRadius,
              borderWidth: Dimensions.emailFieldBorderWidth,
            ),
            SizedBox(height: Dimensions.passwordFieldTop - Dimensions.emailFieldTop),
            CustomTextField(
              controller: _passwordController,
              label: 'Password',
              hintText: 'Enter your password',
              obscureText: true,
              width: Dimensions.passwordFieldWidth,
              height: Dimensions.passwordFieldHeight,
            ),
            SizedBox(height: Dimensions.forgetPasswordTop - Dimensions.passwordFieldTop),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: _handleForgotPassword,
                child: Text('Forgot Password?', style: TextStyles.forgetPasswordTextStyle),
              ),
            ),
            SizedBox(height: Dimensions.keepLoggedInTop - Dimensions.forgetPasswordTop),
            Row(
              children: [
                Checkbox(value: false, onChanged: (_) {}),
                Text('Keep me logged in', style: TextStyles.keepLoggedInTextStyle),
              ],
            ),
            SizedBox(height: Dimensions.loginButtonTop - Dimensions.keepLoggedInTop),
            CustomButton(
              onPressed: _handleLogin,
              text: 'Login',
              width: Dimensions.loginButtonWidth,
              height: Dimensions.loginButtonHeight,
              padding: EdgeInsets.symmetric(vertical: Dimensions.loginButtonPadding),
              backgroundColor: AppColors.brighterGreen,
              textStyle: TextStyles.loginButtonTextStyle,
            ),
            SizedBox(height: Dimensions.orTextTop - Dimensions.loginButtonTop),
            Center(child: Text('or', style: TextStyles.orTextStyle)),
            SizedBox(height: Dimensions.googleButtonTop - Dimensions.orTextTop),
            GoogleSignInButton(
              width: Dimensions.googleButtonWidth,
              height: Dimensions.googleButtonHeight,
              padding: EdgeInsets.symmetric(
                vertical: Dimensions.googleButtonPadding,
                horizontal: Dimensions.googleButtonPadding,
              ),
              borderRadius: Dimensions.googleButtonBorderRadius,
              borderWidth: Dimensions.googleButtonBorderWidth,
            ),
            SizedBox(height: Dimensions.signUpTextTop - Dimensions.googleButtonTop),
            Center(
              child: GestureDetector(
                onTap: _handleSignUp,
                child: RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyles.signUpTextStyle.copyWith(fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: 'Sign Up now',
                        style: TextStyles.signUpTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize responsive dimensions
    Dimensions.init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.responsive(16.0),
            vertical: Dimensions.responsive(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Dimensions.loginArrowTop),
              Icon(Icons.arrow_back, size: Dimensions.loginArrowSize),
              SizedBox(height: Dimensions.responsive(30.0)),
              Center(child: Logo()),
              SizedBox(height: Dimensions.responsive(40.0)),
              Text(
                'Welcome back! Glad to see you, again!',
                style: TextStyles.welcomeTextStyle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimensions.responsive(40.0)),
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                hintText: 'Enter your email',
                width: double.infinity,
                height: Dimensions.emailFieldHeight,
              ),
              SizedBox(height: Dimensions.responsive(20.0)),
              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                width: double.infinity,
                height: Dimensions.emailFieldHeight,
              ),
              SizedBox(height: Dimensions.responsive(10.0)),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // Handle forgot password
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.forgetPasswordTextStyle,
                  ),
                ),
              ),
              SizedBox(height: Dimensions.responsive(30.0)),
              CustomButton(
                onPressed: () {
                  // Handle login
                },
                text: 'Login',
                width: double.infinity,
                height: Dimensions.loginButtonHeight,
                padding: EdgeInsets.symmetric(
                  vertical: Dimensions.responsive(15.0),
                ),
                backgroundColor: AppColors.brighterGreen,
                textStyle: TextStyles.loginButtonTextStyle,
              ),
              SizedBox(height: Dimensions.responsive(20.0)),
              Center(child: Text('or', style: TextStyles.orTextStyle)),
              SizedBox(height: Dimensions.responsive(20.0)),
             GoogleSignInButton(
                 width: 320.0,  // Custom width
                 height: 60.0,  // Custom height
                 padding: const EdgeInsets.all(16.0), // Custom padding
                 borderRadius: 20.0, // Custom border radius
                  ) ,
              SizedBox(height: Dimensions.responsive(30.0)),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Handle sign up
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: TextStyles.keepLoggedInTextStyle,
                      children: [
                        TextSpan(
                          text: 'Sign Up now',
                          style: TextStyles.signUpTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
