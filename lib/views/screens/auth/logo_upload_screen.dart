import 'dart:io';
import 'package:businessy/services/form_data.dart';
<<<<<<< HEAD
import 'package:businessy/services/auth_service.dart';
=======
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:businessy/views/widgets/common/auth/custom_button.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/widgets/common/auth/logo.dart';
<<<<<<< HEAD
import 'package:supabase_flutter/supabase_flutter.dart';
=======
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4

class LogoUploadScreen extends StatefulWidget {
  const LogoUploadScreen({super.key});

  static const String pageRoute = '/LogoUploadScreen';

  @override
  State<LogoUploadScreen> createState() => _LogoUploadScreenState();
}

class _LogoUploadScreenState extends State<LogoUploadScreen> {
  File? _logoImage;
<<<<<<< HEAD
  bool _isProcessing = false;
  String? _logoUrl;

  Future<void> _pickLogo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
=======

  Future<void> _pickLogo() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4

    if (pickedFile != null) {
      setState(() {
        _logoImage = File(pickedFile.path);
      });
    }
  }
<<<<<<< HEAD
   
Future<String?> _uploadLogo() async {
  if (_logoImage == null) return null;

  try {
    print('Starting unauthenticated logo upload...');
    
    final fileName = 'logos/${DateTime.now().millisecondsSinceEpoch}.png';
    final storage = Supabase.instance.client.storage.from('business-logos');
    
    // Convert File to Uint8List
    final bytes = await _logoImage!.readAsBytes();
    
    print('Attempting to upload file: $fileName');
    await storage.uploadBinary(
      fileName,
      bytes,
      fileOptions: const FileOptions(
        cacheControl: '3600',
        upsert: true,
      ),
    );
    
    final publicUrl = storage.getPublicUrl(fileName);
    print('Upload successful. Public URL: $publicUrl');
    
    return publicUrl;
  } on StorageException catch (e) {
    print('Storage error details: ${e.message}, Status: ${e.statusCode}, Error: ${e.error}');
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Storage error: ${e.message}')),
      );
    }
    return null;
  } catch (e) {
    print('Unexpected error: $e');
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload failed: ${e.toString()}')),
      );
    }
    return null;
  }
}
  Future<void> _completeRegistration() async {
    if (_logoImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a logo first')),
      );
      return;
    }

    setState(() {
      _isProcessing = true;
    });

    try {
      // First upload the logo
      final logoUrl = await _uploadLogo();
      print('Logo URL: $logoUrl');
      if (logoUrl == null) throw Exception('Failed to upload logo');

      // Complete the registration with all collected data
      final result = await AuthService().signUp(
        firstName: UserData.firstName ?? '',
        lastName: UserData.lastName ?? '',
        birthDate: UserData.birthDate ?? '',
        phoneNumber: UserData.phoneNumber ?? '',
        email: UserData.email ?? '',
        password: UserData.password ?? '',
        businessName: UserData.businessName ?? '',
        launchDate: DateTime.tryParse(UserData.launchDate ?? '') ?? DateTime.now(),
        actualBalance: double.tryParse(UserData.actualBalance ?? '0') ?? 0.0,
        typeOfSelling: UserData.sellingType ?? 'Products',
        logoUrl: logoUrl,
      );

      if (result['success']) {
        // Clear all stored data
        UserData.clear();
        FormData.clearData();
        
        if (mounted) {
          // Navigate to main screen and clear navigation stack
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/MainScreen',
            (Route<dynamic> route) => false,
          );
        }
      } else {
        throw Exception(result['message'] ?? 'Registration failed');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isProcessing = false;
        });
      }
    }
  }
=======
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
<<<<<<< HEAD
          icon: const Icon(Icons.arrow_back_rounded, size: 30),
=======
          icon: const Icon(
            Icons.arrow_back_rounded,
            size: 30,
          ),
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
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
<<<<<<< HEAD
                _isProcessing
                    ? const Center(child: CircularProgressIndicator())
                    : CustomButton(
                        text: 'Complete Registration',
                        onPressed: _completeRegistration,
                      ),
=======
                CustomButton(
                  text: 'Finish',
                  onPressed: () {
                    UserData.logo= _logoImage.toString();
                    Navigator.pushNamed(context, '/MainScreen');},
                ),
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
              ],
            ),
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 73c77803b07fef7bff57c289ea44f4545cb6a4b4
