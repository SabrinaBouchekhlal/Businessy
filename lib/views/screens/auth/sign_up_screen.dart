import 'package:businessy/services/form_data.dart';
import 'package:businessy/views/widgets/common/auth/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/auth/custom_button.dart';
import 'package:businessy/views/widgets/common/auth/logo.dart';
import 'package:businessy/views/widgets/common/auth/google_sign_in_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';

import 'package:flutter/material.dart';
import 'package:businessy/services/auth_service.dart'; // Add this
import 'package:businessy/services/form_data.dart'; // Make sure you have this for UserData
import 'package:businessy/views/widgets/common/auth/custom_button.dart';


class SignUpScreen extends StatefulWidget {
  static const String pageRoute = '/SignUpScreen';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
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

Future<void> _register() async {
  if (_formKey.currentState?.validate() ?? false) {
    UserData.firstName = _firstNameController.text;
    UserData.lastName = _lastNameController.text;
    UserData.birthDate = _birthDateController.text;
    UserData.phoneNumber = _phoneController.text;

    // Move to the next screen
    Navigator.pushNamed(context, '/SignUpScreen2');  
  }
}

   Widget _buildHeader() {
    return const Column(
      children: [
        Logo(),
        SizedBox(height: 8.0),
        Text('New here?', style: LoginTypography.heading),
        Text('We’re excited to have you!', style: LoginTypography.heading),
      ],
    );
  }

  Widget _buildTextField({
    required String labelText,
    required TextEditingController controller,
    String? Function(String?)? validator,
    bool readOnly = false,
    Widget? suffixIcon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return CustomTextField(
      labelText: labelText,
      controller: controller,
      validator: validator,
      readOnly: readOnly,
      suffixIcon: suffixIcon,
      keyboardType: keyboardType,
    );
  }

  Widget _buildFooter() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Already have an account?",
            style: TextStyle(fontSize: 14.0, color: blackShade, fontFamily: 'Urbanist',),
          ),
          const SizedBox(width: 4.0),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Text(
              'Login',
              style: TextStyle(
                fontSize: 14.0,
                color: brighterGreen,
                fontWeight: FontWeight.bold,
                fontFamily: 'Urbanist',
              ),
            ),
          ),
        ],
      ),
    );
  }
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
      // Your previous UI code
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 36),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: _buildHeader()),
                  const SizedBox(height: 20.0),
                  _buildTextField(
                    labelText: 'First Name',
                    controller: _firstNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                        return 'First name must not contain special characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14.0),
                  _buildTextField(
                    labelText: 'Last Name',
                    controller: _lastNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your last name';
                      }
                      if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
                        return 'Last name must not contain special characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14.0),
                  _buildTextField(
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
                  _buildTextField(
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
                // UI Components for First Name, Last Name, etc.
                CustomButton(
                  text: 'Next',
                  onPressed: _register,  // Call the _register function
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}