import 'package:flutter/material.dart';
import 'package:businessy/services/auth_service.dart';
import 'package:businessy/views/widgets/common/custom_button.dart';
import 'package:businessy/views/widgets/common/custom_text_field.dart';
import 'package:businessy/views/widgets/common/logo.dart';
import 'package:businessy/views/widgets/common/google_sign_in_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const String pageRoute = '/LoginScreen';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _keepLoggedIn = false;
  bool _obscurePassword = true;
  String? _emailError; // Error message for email field
  String? _passwordError; // Error message for password field

  void _login() {
    setState(() {
      _emailError = null; // Reset email error message
      _passwordError = null; // Reset password error message
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    // Validate email
    if (email.isEmpty || !EmailValidator.validate(email)) {
      setState(() {
        _emailError = 'Invalid email';
      });
    }

    // Validate password and credentials
    if (password.isEmpty || !AuthService.validateLogin(email, password)) {
      setState(() {
        _passwordError = 'Invalid password';
      });
    }

    // Proceed if no errors
    if (_emailError == null && _passwordError == null) {
      Navigator.pushNamed(context, '/BusinessSetupScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 36.0),
                Center(
                  child: Column(
                    children: const [
                      Logo(),
                      SizedBox(height: 8.0),
                      Text(
                        'Welcome back!',
                        style:headingTextStyle ,
                      ),
                      Text(
                        'Glad to see you, Again!',
                        style: headingTextStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                if (_emailError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      _emailError!,
                      style: const TextStyle(color: Colors.red, fontSize: 12.0),
                    ),
                  ),
                const SizedBox(height: 14.0),
                CustomTextField(
                  labelText: 'Password',
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                if (_passwordError != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      _passwordError!,
                      style: const TextStyle(color: Colors.red, fontSize: 12.0),
                    ),
                  ),
                const SizedBox(height: 13.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/ForgotPasswordScreen');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: darkGrey,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Checkbox(
                      value: _keepLoggedIn,
                      onChanged: (value) {
                        setState(() {
                          _keepLoggedIn = value!;
                        });
                      },
                      activeColor: brighterGreen,
                    ),
                    const Text(
                      'Keep me logged in',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: blackColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                CustomButton(
                  text: 'Login',
                  onPressed: (){

                  },
                ),
                const SizedBox(height: 12.0),
                const Center(
                  child: Text(
                    'or',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: blackColor,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                GoogleSignInButton(
                  onPressed: () {
                    // Google sign-in functionality
                  },
                ),
                const SizedBox(height: 50.0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 14.0, color: blackShade),
                      ),
                      const SizedBox(width: 4.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/SignUpScreen');
                        },
                        child: const Text(
                          'Sign Up Now',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: brighterGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
