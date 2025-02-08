<<<<<<< HEAD
// SignUpScreen2.dart
import 'package:flutter/material.dart';
import 'package:businessy/services/auth_service.dart'; // Add this for AuthService
import 'package:businessy/services/form_data.dart'; // UserData
import 'package:businessy/views/widgets/common/auth/custom_button.dart';
import 'package:email_validator/email_validator.dart';
=======
import 'package:businessy/services/form_data.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/auth/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/auth/custom_button.dart';
import 'package:businessy/views/widgets/common/auth/logo.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:businessy/services/auth_service.dart';
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4

class SignUpScreen2 extends StatefulWidget {
  static const String pageRoute = '/SignUpScreen2';

  const SignUpScreen2({Key? key}) : super(key: key);

  @override
<<<<<<< HEAD
  _SignUpScreen2State createState() => _SignUpScreen2State();
=======
  State<SignUpScreen2> createState() => _SignUpScreen2State();
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
}

class _SignUpScreen2State extends State<SignUpScreen2> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

<<<<<<< HEAD
void _proceedToBusinessSetup() {
  if (_formKey.currentState?.validate() ?? false) {
    UserData.email = _emailController.text;
    UserData.password = _passwordController.text; // No null issue because it's non-nullable
    
    if (UserData.email == null || UserData.password.isEmpty) {
      // Handle the case where required fields are not set
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields.')),
      );
      return;
    }

    Navigator.pushNamed(context, '/BusinessSetupScreen');
  }
}
=======
  void _register() {
    if (_formKey.currentState?.validate() ?? false) {
      // Store the email and password in AuthService when registration is successful
      AuthService.setEmail(_emailController.text);
      AuthService.setPassword(_passwordController.text);
      UserData.email = _emailController.text;
      UserData.password = _passwordController.text;
      // Navigate to the next screen after registration
      Navigator.pushNamed(context, '/BusinessSetupScreen');
    }
  }
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4

  Widget _buildHeader() {
    return const Column(
      children: [
        Logo(),
        SizedBox(height: 8.0),
        Text(
          'New here?',
          style: LoginTypography.heading,
        ),
        Text(
          'We’re excited to have you!',
          style: LoginTypography.heading,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String labelText,
    required TextEditingController controller,
    required String? Function(String?) validator,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return CustomTextField(
      labelText: labelText,
      controller: controller,
      obscureText: obscureText,
      suffixIcon: suffixIcon,
      keyboardType: keyboardType,
      validator: validator,
    );
  }

  Widget _buildPasswordField({
    required String labelText,
    required TextEditingController controller,
    required bool isVisible,
    required void Function() toggleVisibility,
    required String? Function(String?) validator,
  }) {
    return _buildTextField(
      labelText: labelText,
      controller: controller,
      obscureText: !isVisible,
      suffixIcon: IconButton(
        icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
        onPressed: toggleVisibility,
      ),
      validator: validator,
    );
  }
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Your previous UI code
=======

  @override
  Widget build(BuildContext context) {
    return Scaffold(
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
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
          padding: const EdgeInsets.fromLTRB(24, 50, 24, 36),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
<<<<<<< HEAD
                 Center(child: _buildHeader()),
=======
                Center(child: _buildHeader()),
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
                const SizedBox(height: 20.0),
                _buildTextField(
                  labelText: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!EmailValidator.validate(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14.0),
                _buildPasswordField(
                  labelText: 'Password',
                  controller: _passwordController,
                  isVisible: _isPasswordVisible,
                  toggleVisibility: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14.0),
                _buildPasswordField(
                  labelText: 'Confirm Password',
                  controller: _confirmPasswordController,
                  isVisible: _isConfirmPasswordVisible,
                  toggleVisibility: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 37.0),
<<<<<<< HEAD
                // UI Components for Email, Password, Confirm Password
                CustomButton(
                  text: 'Register',
                  onPressed:  _proceedToBusinessSetup,//_register,  // Call the _register function
=======
                CustomButton(
                  text: 'Register',
                  onPressed: _register,
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
