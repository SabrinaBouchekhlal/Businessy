import 'package:businessy/views/screens/user/profile_screen.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/drawer.dart';
import 'package:businessy/views/widgets/common/navbar.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.3),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: AppBarTypography.title,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: const SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionTitle(title: 'Account'),
              const SizedBox(height: 8),
              SettingsCard(
                options: [
                  SettingsOption(icon: Icons.person, label: 'Edit profile'),
                  const SettingsOption(icon: Icons.security, label: 'Security'),
                  const SettingsOption(icon: Icons.lock, label: 'Privacy'),
                ],
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: 'Support & About'),
              const SizedBox(height: 8),
              const SettingsCard(
                options: [
                  SettingsOption(
                      icon: Icons.credit_card, label: 'My Subscription'),
                  SettingsOption(icon: Icons.help, label: 'Help & Support'),
                  SettingsOption(
                      icon: Icons.policy, label: 'Terms and Policies'),
                ],
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: 'Actions'),
              const SizedBox(height: 8),
              const SettingsCard(
                options: [
                  SettingsOption(icon: Icons.flag, label: 'Report a problem'),
                  SettingsOption(icon: Icons.person_add, label: 'Add account'),
                  SettingsOption(icon: Icons.logout, label: 'Log out'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: HomeTypography.subtitle);
  }
}

class SettingsCard extends StatelessWidget {
  final List<SettingsOption> options;

  const SettingsCard({required this.options, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFF4F4F4),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: options
              .map(
                (option) => ListTile(
              leading: Icon(option.icon, color: mainGreen),
              title: Text(option.label, style: SettingsTypography.label),
              onTap: () {
                if (option.label == 'Edit profile') {
                  // Navigate to the EditProfileScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()),
                  );
                }
                // Handle other actions here (e.g., for other options like Security, Privacy)
              },
            ),
          )
              .toList(),
        ),
      ),
    );
  }
}

class SettingsOption {
  final IconData icon;
  final String label;

  const SettingsOption({required this.icon, required this.label});
}

