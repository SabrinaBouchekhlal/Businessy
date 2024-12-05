import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/custom_button.dart';
import 'package:businessy/views/widgets/common/custom_text_field.dart';
import 'package:businessy/views/widgets/common/logo.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/screens/auth/logo_upload_screen.dart';
import 'package:businessy/services/form_data.dart'; 

class BusinessSetupScreen extends StatefulWidget {
  const BusinessSetupScreen({super.key});

  @override
  State<BusinessSetupScreen> createState() => _BusinessSetupScreenState();
}

class _BusinessSetupScreenState extends State<BusinessSetupScreen> {
  final _formKey = GlobalKey<FormState>(); // Add form key
  final List<String> _sellingTypeOptions = ['Products', 'Services'];

  Future<void> _selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        FormData.launchDateController.text =
            "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Data is already stored in FormData's controllers
      Navigator.pushNamed(context, '/LogoUploadScreen'); // Navigate to the next screen
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
            child: Form( // Wrap with Form
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
                  const SizedBox(height: 26.0),
                  Center(
                    child: const Column(children: [
                      Logo(),
                      SizedBox(height: 33.0),
                      Text(
                        'Get Your Business Set Up!',
                        style: headingTextStyle,
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        "To get started let's gather a few pieces of information about your business",
                        style: subHeadingTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ]),
                  ),
                  const SizedBox(height: 37.0),
                  CustomTextField(
                    labelText: 'Business Name',
                    controller: FormData.businessNameController,
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your business name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14.0),
                  CustomTextField(
                    labelText: 'Launch Date (optional)',
                    controller: FormData.launchDateController,
                    readOnly: true,
                    suffixIcon: GestureDetector(
                      onTap: _selectDate,
                      child: const Icon(Icons.calendar_today, color: darkGrey),
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  CustomTextField(
                    labelText: 'Actual Balance',
                    controller: FormData.actualBalanceController,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the actual balance';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14.0),
                  DropdownButtonFormField<String>(
                    value: FormData.selectedSellingType,
                    items: _sellingTypeOptions.map((String option) {
                      return DropdownMenuItem<String>( 
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        setState(() {
                          FormData.selectedSellingType = newValue;
                          FormData.sellingTypeController.text = newValue;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'What do you sell?',
                      labelStyle: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: brighterGreen, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: brighterGreen, width: 2.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                    ),
                  ),
                  const SizedBox(height: 59.0),
                  CustomButton(
                    text: 'Next',
                    onPressed: _submitForm, // Validate on submission
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


