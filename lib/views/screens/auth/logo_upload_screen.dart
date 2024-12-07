import 'dart:io';
import 'package:businessy/services/form_data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:businessy/views/widgets/common/auth/custom_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/widgets/common/auth/logo.dart';

class LogoUploadScreen extends StatefulWidget {
  const LogoUploadScreen({super.key});

  static const String pageRoute = '/LogoUploadScreen';

  @override
  State<LogoUploadScreen> createState() => _LogoUploadScreenState();
}

class _LogoUploadScreenState extends State<LogoUploadScreen> {
  File? _logoImage;

  Future<void> _pickLogo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _logoImage = File(pickedFile.path);
      });
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Column(
                    children: [
                      Logo(),
                      SizedBox(height: 24.0),
                      Text(
                        'Upload Your Logo',
                        style: LoginTypography.heading,
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        "To personalize your brand, please upload your logo below.",
                        style: LoginTypography.subHeading,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                Center(
                  child: GestureDetector(
                    onTap: _pickLogo,
                    child: Container(
                      width: 214,
                      height: 214,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5F5F5),
                        border: Border.all(color: brighterGreen, width: 2.0),
                        borderRadius: BorderRadius.circular(107),
                        image: _logoImage != null
                            ? DecorationImage(
                                image: FileImage(_logoImage!),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: _logoImage == null
                          ? Center(
                              child: Image.asset(
                                'assets/img/upload.png',
                                width: 48,
                                height: 48,
                                color: mainGreen,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 21),
                Center(
                  child: Text(
                    _logoImage == null
                        ? 'No logo uploaded yet.'
                        : 'Logo uploaded!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      color: inputPlaceholder,
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                CustomButton(
                  text: 'Finish',
                  onPressed: () {
                    UserData.logo= _logoImage.toString();
                    Navigator.pushNamed(context, '/MainScreen');},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
