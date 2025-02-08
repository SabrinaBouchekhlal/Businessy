import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/auth/custom_button.dart';
import 'package:businessy/views/widgets/common/auth/logo.dart';
import 'package:businessy/views/widgets/common/auth/google_sign_in_button.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static const String pageRoute = '/LoginScreen';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _supabase = Supabase.instance.client;

  bool _keepLoggedIn = false;
  bool _obscurePassword = true;
  String? _emailError;
  String? _passwordError;

  Future<void> _login() async {
    setState(() {
      _emailError = null;
      _passwordError = null;
    });

    final email = _emailController.text.trim();
    final password = _passwordController.text;

    // Validate email
    if (email.isEmpty || !EmailValidator.validate(email)) {
      setState(() {
        _emailError = 'Invalid email';
      });
      return;
    }

    // Validate password
    if (password.isEmpty) {
      setState(() {
        _passwordError = 'Password cannot be empty';
      });
      return;
    }

    try {
      // Attempt to sign in with Supabase
      final AuthResponse response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // Fetch user data from the database
        final userData = await _supabase
            .from('profiles')
            .select()
            .eq('id', response.user!.id)
            .single();

        if (userData != null) {
          // Successfully logged in and fetched user data
          Navigator.pushNamed(context, '/ProfileScreen');
        } else {
          setState(() {
            _passwordError = 'User data not found';
          });
        }
      }
    } on AuthException catch (e) {
      // Handle Supabase auth errors
      setState(() {
        _passwordError = e.message;
      });
    } catch (e) {
      // Handle other errors
      setState(() {
        _passwordError = 'An error occurred during login';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            padding: const EdgeInsets.fromLTRB(
              LoginDimensions.pagePadding,
              8,
              LoginDimensions.pagePadding,
              36,
            ),
            child: Column(
              children: [
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Logo(),
                    SizedBox(height: LoginDimensions.logoTextSpacing),
                    Text(
                      'Welcome back!',
                      style: LoginTypography.heading,
                    ),
                    Text(
                      'Glad to see you, Again!',
                      style: LoginTypography.heading,
                    ),
                  ],
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
                      style: LoginTypography.error,
                    ),
                  ),
                const SizedBox(height: LoginDimensions.fieldSpacing),
                CustomTextField(
                  labelText: 'Password',
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: _obscurePassword
                        ? AppStyles.visibilityOff
                        : AppStyles.visibilityOn,
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
                      style: LoginTypography.error,
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
                      style: LoginTypography.forgotPassword,
                    ),
                  ),
                ),
                const SizedBox(height: LoginDimensions.checkboxTextSpacing),
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
                      style: LoginTypography.keepMeLoggedIn,
                    ),
                  ],
                ),
                const SizedBox(height: LoginDimensions.buttonSpacing),
                CustomButton(
                  text: 'Login',
                  onPressed: _login,
                ),
                const SizedBox(height: LoginDimensions.buttonSpacing),
                const Center(
                  child: Text(
                    'or',
                    style: LoginTypography.orText,
                  ),
                ),
                const SizedBox(height: LoginDimensions.buttonSpacing),
                Center(
                  child: GoogleSignInButton(
                    onPressed: () {
                      // Google sign-in functionality
                    },
                  ),
                ),
                const SizedBox(height: LoginDimensions.bottomSpacing),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: LoginTypography.signUpPrompt,
                      ),
                      const SizedBox(width: 4.0),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/SignUpScreen');
                        },
                        child: const Text(
                          'Sign Up Now',
                          style: LoginTypography.signUpNow,
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