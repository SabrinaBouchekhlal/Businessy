<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/auth/custom_text_field.dart';
=======
import 'package:businessy/views/widgets/common/auth/custom_text_field.dart';
import 'package:flutter/material.dart';
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
import 'package:businessy/views/widgets/common/auth/custom_button.dart';
import 'package:businessy/views/widgets/common/auth/logo.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';
<<<<<<< HEAD
import 'package:businessy/services/form_data.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
=======
import 'package:businessy/views/screens/auth/logo_upload_screen.dart';
import 'package:businessy/services/form_data.dart';
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4

class BusinessSetupScreen extends StatefulWidget {
  const BusinessSetupScreen({super.key});

  @override
  State<BusinessSetupScreen> createState() => _BusinessSetupScreenState();
}

class _BusinessSetupScreenState extends State<BusinessSetupScreen> {
<<<<<<< HEAD
  final _formKey = GlobalKey<FormState>();
=======
  final _formKey = GlobalKey<FormState>(); // Add form key
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
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

<<<<<<< HEAD
  
   void _proceedToLogoUpload() {
    if (_formKey.currentState!.validate()) {
      // Store business information
=======
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
      UserData.businessName = FormData.businessNameController.text;
      UserData.launchDate = FormData.launchDateController.text;
      UserData.actualBalance = FormData.actualBalanceController.text;
      UserData.sellingType = FormData.selectedSellingType;
<<<<<<< HEAD

      // Proceed to logo upload
      Navigator.pushNamed(context, '/LogoUploadScreen');
=======
      // Data is already stored in FormData's controllers
      Navigator.pushNamed(context, '/LogoUploadScreen'); // Navigate to the next screen
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 36),
            child: Form(
<<<<<<< HEAD
=======
              // Wrap with Form
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
<<<<<<< HEAD
                    child: Column(children: [
=======
                    child: const Column(children: [
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
                      Logo(),
                      SizedBox(height: 33.0),
                      Text(
                        'Get Your Business Set Up!',
                        style: LoginTypography.heading,
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        "To get started let's gather a few pieces of information about your business",
                        style: LoginTypography.subHeading,
                        textAlign: TextAlign.center,
                      ),
<<<<<<< HEAD
                    ])),
=======
                    ]),
                  ),
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
                  const SizedBox(height: 24.0),
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
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    dropdownColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'What do you sell?',
                      labelStyle: const TextStyle(
                        fontFamily: 'Urbanist',
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            const BorderSide(color: brighterGreen, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            const BorderSide(color: brighterGreen, width: 2.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
<<<<<<< HEAD
                            const BorderSide(color: brighterGreen, width: 2.0),
=======
                        const BorderSide(color: brighterGreen, width: 2.0),
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide:
                            const BorderSide(color: brighterGreen, width: 2.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                    ),
                  ),
                  const SizedBox(height: 59.0),
                  CustomButton(
                    text: 'Next',
<<<<<<< HEAD
                    onPressed: _proceedToLogoUpload,//_submitForm, // Save to Supabase and navigate
=======
                    onPressed: _submitForm, // Validate on submission
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
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
<<<<<<< HEAD













































































=======
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
