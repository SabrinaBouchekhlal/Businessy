import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/auth/custom_button.dart';
import 'package:businessy/views/widgets/common/auth/logo.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/screens/auth/set_new_password_screen.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  static const String pageRoute = '/OtpVerification';

  final List<TextEditingController> _otpControllers =
      List.generate(6, (index) => TextEditingController());

  void _verifyOtp() {
    // Combine the OTP digits from all controllers
    final otp = _otpControllers.map((controller) => controller.text).join();

    if (otp.length == 6) {
      // Handle OTP verification logic here
      print("Entered OTP: $otp");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the OTP fields')),
      );
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
          icon: const Icon(Icons.arrow_back_rounded, size: 30,),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(LoginDimensions.pagePadding, 24, LoginDimensions.pagePadding, 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Column(
                    children: [
                      const Logo(),
                      const SizedBox(height: 33.0),
                      const Text(
                        'OTP Verification',
                        style: LoginTypography.heading,
                      ),
                      const SizedBox(height: 12.0),
                      const Text(
                        'Enter the verification code we just sent to your email address.',
                        style: LoginTypography.subHeading,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 26.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(6, (index) {
                    return SizedBox(
                      width: 45,
                      height: 50,
                      child: Center(
                        child: TextField(
                          controller: _otpControllers[index],
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLength: 1,
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: _otpControllers[index].text.isNotEmpty
                                ? whiteColor
                                : blackColor, // Dynamically change text color
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            filled: true,
                            fillColor: _otpControllers[index].text.isNotEmpty
                                ? const Color(0x66229799)
                                : whiteColor,
                            // Dynamically change background color
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: inputBorder,
                                width: 1.0,
                              ),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                color: brighterGreen,
                                width: 2.0,
                              ),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {}); // Trigger a rebuild to update the UI
                            if (value.length == 1) {
                              if (index < 5) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                FocusScope.of(context).unfocus();
                              }
                            } else if (value.isEmpty) {
                              if (index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                            }
                          },
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 26.0),
                CustomButton(
                    text: 'Verify',
                    onPressed: () {
                      // _verifyOtp,
                      Navigator.pushNamed(context, '/SetNewPasswordScreen');
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
