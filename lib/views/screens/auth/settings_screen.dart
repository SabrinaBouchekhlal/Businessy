import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/components/appbar.dart';
import 'package:businessy/views/components/navbar.dart';
import 'package:businessy/views/components/drawer.dart';





class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
        drawer: const CustomDrawer(
        logo: '', // Replace with your logo path
        business_name: 'Sew Crafted',
      ),
      bottomNavigationBar: const Navbar(),
       backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding( 
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              const SectionTitle(title: 'Account'),
              const SizedBox(height: 8),
              const SettingsCard(
                options: [
                  SettingsOption(icon: Icons.person, label: 'Edit profile'),
                  SettingsOption(icon: Icons.security, label: 'Security'),
                  SettingsOption(icon: Icons.lock, label: 'Privacy'),
                ],
              ),
              const SizedBox(height: 16),
              const SectionTitle(title: 'Support & About'),
              const SizedBox(height: 8),
              const SettingsCard(
                options: [
                  SettingsOption(icon: Icons.credit_card, label: 'My Subscription'),
                  SettingsOption(icon: Icons.help, label: 'Help & Support'),
                  SettingsOption(icon: Icons.policy, label: 'Terms and Policies'),
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
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SettingsCard extends StatelessWidget {
  final List<SettingsOption> options;

  const SettingsCard({required this.options, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
       color: settings_card,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: options
              .map(
                (option) => ListTile(
                  leading: Icon(option.icon, color: mainGreen),
                  title: Text(option.label),
                  onTap: () {
                    // Handle the action
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
