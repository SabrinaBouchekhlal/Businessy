import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/custom_button.dart';
import 'package:businessy/views/widgets/common/custom_text_field.dart';
import 'package:businessy/views/widgets/common/logo.dart';
import 'package:businessy/views/widgets/common/google_sign_in_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _birthDateController.text =
            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 36),
            child: Form(
              key: _formKey,
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
                  const SizedBox(height: 16.0),
                  Center(
                    child: Column(
                      children: [
                        const Logo(),
                        const SizedBox(height: 8.0),
                        Text(
                          'New here?',
                          style: headingTextStyle,
                        ),
                        Text(
                          'We’re excited to have you!',
                          style: headingTextStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  // First Name
                  CustomTextField(
                    labelText: 'First Name',
                    controller: _firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }else if(!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                    return'First name must not contain special characters';}
                      return null;
                    },
                  ),
                  const SizedBox(height: 14.0),
                  // Last Name
                  CustomTextField(
                    labelText: 'Last Name',
                    controller: _lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }else if(!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                       return 'last name must not contain special characters';}
                      return null;
                    },
                  ),
                  const SizedBox(height: 14.0),
                  // Birthdate
                  CustomTextField(
                    labelText: 'Birthdate',
                    controller: _birthDateController,
                    readOnly: true,
                    suffixIcon: GestureDetector(
                      onTap: _selectDate,
                      child: const Icon(Icons.calendar_today, color: darkGrey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select your birthdate';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14.0),
                  // Phone Number
                  CustomTextField(
                    labelText: 'Phone Number',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if (!RegExp(r'^\+?[0-9]{10,13}$').hasMatch(value)) {
                        return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 23.0),
                  // Next Button
                  CustomButton(
                    text: 'Next',
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true) {
                        // Navigate to the next screen if all validations pass
                        Navigator.pushNamed(context, '/SignUpScreen2');
                      }
                    },
                  ),
                  const SizedBox(height: 8.0),
                  const Center(
                    child: Text(
                      'or',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: blackColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  GoogleSignInButton(
                    onPressed: () {
                      // Google sign-in functionality
                    },
                  ),
                  const SizedBox(height: 40.0),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 14.0, color: blackShade),
                        ),
                        const SizedBox(width: 4.0),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Login',
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
      ),
    );
  }
}
