import 'package:businessy/views/screens/user/profile_screen.dart';
import 'package:businessy/views/screens/user/settings_screen.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final int index;
  final String logo;
  final String business_name;

  const CustomDrawer({super.key, required this.logo, required this.business_name, required this.index});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = widget.index;

    return Drawer(
      backgroundColor: whiteColor,
      elevation: 8,
      width: 268,
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Image.asset(
                    widget.logo,
                    width: 150,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.business_name,
                    style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                ],
              )),
          // Profile ListTile
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(
                Icons.account_circle, size: 24,
                color: _selectedIndex == 0 ? const Color(0xFF229799) : null, // Change icon color when selected
              ),
              title: Text('Profile',
                  style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: _selectedIndex == 0 ? const Color(0xFF229799) : null)), // Change text color when selected
              selected: _selectedIndex == 0, // Check if it's selected
              selectedTileColor: const Color(0xFFD1F3F2), // Set background color for selected
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );

                setState(() {
                  _selectedIndex = 0; // Update selected index
                });
              },
            ),
          ),
          // Logout ListTile
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(
                Icons.settings, size: 24,
                color: _selectedIndex == 5 ? const Color(0xFF229799) : null, // Change icon color when selected
              ),
              title: Text('Settings',
                  style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: _selectedIndex == 5 ? const Color(0xFF229799) : null)), // Change text color when selected
              selected: _selectedIndex == 5, // Check if it's selected
              selectedTileColor: const Color(0xFFD1F3F2), // Set background color for selected
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );

                setState(() {
                  _selectedIndex = 5; // Update selected index
                });
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(
                Icons.logout_rounded, size: 24,
                color: _selectedIndex == 6 ? const Color(0xFF229799) : null, // Change icon color when selected
              ),
              title: Text('Logout',
                  style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: _selectedIndex == 6 ? const Color(0xFF229799) : null)), // Change text color when selected
              selected: _selectedIndex ==6, // Check if it's selected
              selectedTileColor: const Color(0xFFD1F3F2), // Set background color for selected
              onTap: () {
                setState(() {
                  _selectedIndex = 6; // Update selected index
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
