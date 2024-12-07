import 'package:image_picker/image_picker.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/auth/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/services/form_data.dart';
import 'dart:io';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const String pageRoute = '/ProfileScreen';
  bool isEditing = false;
  late File _image;

  // Controllers for editing Personal Info
  late final TextEditingController fullNameController;
  late final TextEditingController birthdateController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;

  // Controllers for editing Business Info
  late final TextEditingController businessNameController;
  late final TextEditingController businessTypeController;
  late final TextEditingController launchDateController;
  late final TextEditingController balanceController;

  @override
  void initState() {
    super.initState();
    _image = File('assets/img/google_logo.png');
    // Initialize controllers with values from UserData
    fullNameController = TextEditingController(
      text: '${UserData.firstName} ${UserData.lastName}',
    );
    birthdateController = TextEditingController(text: UserData.birthDate);
    phoneController = TextEditingController(text: UserData.phoneNumber);
    emailController = TextEditingController(text: UserData.email);
    businessNameController = TextEditingController(text: UserData.businessName);
    businessTypeController = TextEditingController(text: UserData.sellingType);
    launchDateController = TextEditingController(text: UserData.launchDate);
    balanceController = TextEditingController(text: UserData.actualBalance);
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed
    fullNameController.dispose();
    birthdateController.dispose();
    phoneController.dispose();
    emailController.dispose();
    businessNameController.dispose();
    businessTypeController.dispose();
    launchDateController.dispose();
    balanceController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Store the picked image
      });
    }
  }

  void saveChanges() {
    // Update UserData with values from controllers
    final fullNameParts = fullNameController.text.split(' ');
    UserData.firstName = fullNameParts.isNotEmpty ? fullNameParts.first : '';
    UserData.lastName =
        fullNameParts.length > 1 ? fullNameParts.sublist(1).join(' ') : '';
    UserData.birthDate = birthdateController.text;
    UserData.phoneNumber = phoneController.text;
    UserData.email = emailController.text;
    UserData.businessName = businessNameController.text;
    UserData.sellingType = businessTypeController.text;
    UserData.launchDate = launchDateController.text;
    UserData.actualBalance = balanceController.text;

    print(
        "UserData updated: ${UserData.firstName} ${UserData.lastName}, ${UserData.email}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.3),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'Profile',
          style: AppBarTypography.title,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {
                setState(() {
                  if (isEditing) {
                    saveChanges(); // Save changes when switching from edit mode
                  }
                  isEditing = !isEditing; // Toggle between edit and view modes
                });
              },
              child: Text(
                isEditing ? "Save" : "Edit",
                style: const TextStyle(
                  color: Colors.teal,
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile image with pencil icon
              Center(
                child: Stack(
                  clipBehavior: Clip.none, // Prevent clipping of icon
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: _image != null
                          ? FileImage(_image) // Display selected image
                          : AssetImage('assets/img/business_assets/SerineCrochetLOGO.png')
                              as ImageProvider, // Default image if no profile pic
                      backgroundColor: Colors.grey.shade200,
                    ),
                    if (isEditing)
                      Positioned(
                        bottom: 6,
                        right: 6,
                        child: GestureDetector(
                          onTap: _pickImage, // Call the method to pick an image
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.teal,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Personal Info Section
              const SectionTitle(title: 'Personal Info'),
              const SizedBox(height: 8),

              if (isEditing) ...[
                CustomTextField(
                  controller: fullNameController,
                  labelText: 'Full Name',
                ),
                const SizedBox(height: 14.0),
                CustomTextField(
                  controller: birthdateController,
                  labelText: 'Birthdate',
                ),
                const SizedBox(height: 14.0),
                CustomTextField(
                  controller: phoneController,
                  labelText: 'Phone',
                ),
                const SizedBox(height: 14.0),
                CustomTextField(
                  controller: emailController,
                  labelText: 'Email',
                ),
                const SizedBox(height: 14.0),
              ] else ...[
                ProfileInfoField(
                  icon: Icons.person,
                  label:
                      'Full Name: ${UserData.firstName} ${UserData.lastName}',
                ),
                ProfileInfoField(
                  icon: Icons.calendar_today,
                  label: 'Birthdate: ${UserData.birthDate}',
                ),
                ProfileInfoField(
                  icon: Icons.phone,
                  label: 'Phone: ${UserData.phoneNumber}',
                ),
                ProfileInfoField(
                  icon: Icons.email,
                  label: 'Email: ${UserData.email}',
                ),
              ],

              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Divider(
                  color: Colors.grey, // Color of the divider
                  thickness: 1, // Thickness of the divider
                  indent: 16, // Empty space on the leading edge
                  endIndent: 16, // Empty space on the trailing edge
                ),
              ),

              // Business Info Section
              const SectionTitle(title: 'Business Info'),
              const SizedBox(height: 8),

              if (isEditing) ...[
                CustomTextField(
                  controller: businessNameController,
                  labelText: 'Business Name',
                ),
                const SizedBox(height: 14.0),
                CustomTextField(
                  controller: businessTypeController,
                  labelText: 'Type',
                ),
                const SizedBox(height: 14.0),
                CustomTextField(
                  controller: launchDateController,
                  labelText: 'Launch Date',
                ),
                const SizedBox(height: 14.0),
                CustomTextField(
                  controller: balanceController,
                  labelText: 'Balance',
                ),
                const SizedBox(height: 14.0),
              ] else ...[
                ProfileInfoField(
                  icon: Icons.store,
                  label: 'Business Name: ${UserData.businessName}',
                ),
                ProfileInfoField(
                  icon: Icons.category,
                  label: 'Type: ${UserData.sellingType}',
                ),
                ProfileInfoField(
                  icon: Icons.calendar_month,
                  label: 'Launch Date: ${UserData.launchDate}',
                ),
                ProfileInfoField(
                  icon: Icons.account_balance_wallet,
                  label: 'Balance: ${UserData.actualBalance} DA',
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

// Reusable widget for displaying profile info
class ProfileInfoField extends StatelessWidget {
  final IconData icon;
  final String label;

  const ProfileInfoField({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: brighterGreen),
      title: Text(label, style: SettingsTypography.label),
    );
  }
}

// Section Title
class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: HomeTypography.subtitle,
    );
  }
}
