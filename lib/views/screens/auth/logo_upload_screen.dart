import 'dart:io';
//import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';


import 'package:businessy/views/widgets/common/custom_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/widgets/common/logo.dart';

class LogoUploadScreen extends StatefulWidget {
  const LogoUploadScreen({super.key});

  @override
  State<LogoUploadScreen> createState() => _LogoUploadScreenState();
}

class _LogoUploadScreenState extends State<LogoUploadScreen> {

  static const String pageRoute = '/LogoUploadScreen';

  /*
  static String? logoImagePath;
  File? _logoImage;

  Future<void> _pickLogo() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _logoImage = File(pickedFile.path);
        logoImagePath = pickedFile.path;
      });
    }
  }
*/

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
                    color: blackColor,
                  ),
                ),
                const SizedBox(height: 26.0),
                Center(
                  child: const Column(
                    children: [
                      Logo(),
                      SizedBox(height: 36.0),
                      Text(
                        'Upload Your Logo',
                        style: headingTextStyle,
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        "To personalize your brand, please upload your logo below.",
                        style: subHeadingTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 71.0),
                Center(
                  child: GestureDetector(
                    //onTap: _pickLogo, // Trigger the permission request on tap
                    child: Container(
                      width: 214,
                      height: 214,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F5F5),
                        border: Border.all(color: mainGreen, width: 2.0),
                        borderRadius: BorderRadius.circular(107),
                      ),
                      child//: _logoImage != null? Image.file(_logoImage!)
                        : Center(
                        child: Image.asset(
                          'assets/img/upload.png',
                          width: 48,
                          height: 48,
                          color: mainGreen,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                Center(
                  child: Text(
                    'No logo uploaded yet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: inputPlaceholder,
                    ),
                  ),
                ),
                const SizedBox(height: 71.0),
                CustomButton(
                  text: 'Finish',
                  onPressed: () {
                    // Handle finish button press
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
