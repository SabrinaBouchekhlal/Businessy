import 'package:businessy/views/themes/style/colors.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final String logo;
  final String business_name;
  const CustomDrawer({super.key, required this.logo, required this.business_name});

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  // Variable to keep track of the selected index
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteColor,
      elevation: 8,
      width: 268,
      child: ListView(
        children: [
          DrawerHeader(
              child: Column(
                children: [
                  const SizedBox(height:20),
                  Image.asset(
                    widget.logo,
                    width: 150,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height:20),
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
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(
                Icons.account_circle,
                color: _selectedIndex == 0 ? const Color(0xFF229799) : null, // Change icon color when selected
              ),
              title: Text('Profile',
                  style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: _selectedIndex == 0 ? const Color(0xFF229799) : null)), // Change text color when selected
              selected: _selectedIndex == 0, // Check if it's selected
              selectedTileColor: const Color(0xFFD1F3F2), // Set background color for selected
              onTap: () {
                setState(() {
                  _selectedIndex = 0; // Update selected index
                });
              },
            ),
          ),
          // Dashboard ListTile
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(
                Icons.home_filled,
                color: _selectedIndex == 1 ? const Color(0xFF229799) : null, // Change icon color when selected
              ),
              title: Text('Dashboard',
                  style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: _selectedIndex == 1 ? const Color(0xFF229799) : null)), // Change text color when selected
              selected: _selectedIndex == 1, // Check if it's selected
              selectedTileColor: const Color(0xFFD1F3F2), // Set background color for selected
              onTap: () {
                setState(() {
                  _selectedIndex = 1; // Update selected index
                });
              },
            ),
          ),
          // Wallet ListTile
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(
                Icons.account_balance_wallet_outlined,
                color: _selectedIndex == 2 ? const Color(0xFF229799) : null, // Change icon color when selected
              ),
              title: Text('Wallet',
                  style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: _selectedIndex == 2 ? const Color(0xFF229799) : null)), // Change text color when selected
              selected: _selectedIndex == 2, // Check if it's selected
              selectedTileColor: const Color(0xFFD1F3F2), // Set background color for selected
              onTap: () {
                setState(() {
                  _selectedIndex = 2; // Update selected index
                });
              },
            ),
          ),
          // Inventory ListTile
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(
                Icons.inventory_2_outlined,
                color: _selectedIndex == 3 ? const Color(0xFF229799) : null, // Change icon color when selected
              ),
              title: Text('Inventory',
                  style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: _selectedIndex == 3 ? const Color(0xFF229799) : null)), // Change text color when selected
              selected: _selectedIndex == 3, // Check if it's selected
              selectedTileColor: const Color(0xFFD1F3F2), // Set background color for selected
              onTap: () {
                setState(() {
                  _selectedIndex = 3; // Update selected index
                });
              },
            ),
          ),
          // Insights ListTile
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(
                Icons.analytics_outlined,
                color: _selectedIndex == 4 ? const Color(0xFF229799) : null, // Change icon color when selected
              ),
              title: Text('Insights',
                  style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: _selectedIndex == 4 ? const Color(0xFF229799) : null)), // Change text color when selected
              selected: _selectedIndex == 4, // Check if it's selected
              selectedTileColor: const Color(0xFFD1F3F2), // Set background color for selected
              onTap: () {
                setState(() {
                  _selectedIndex = 4; // Update selected index
                });
              },
            ),
          ),
          const SizedBox(height: 75),
          // Logout ListTile
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: _selectedIndex == 5 ? const Color(0xFF229799) : null, // Change icon color when selected
              ),
              title: Text('Logout',
                  style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: _selectedIndex == 5 ? const Color(0xFF229799) : null)), // Change text color when selected
              selected: _selectedIndex == 5, // Check if it's selected
              selectedTileColor: const Color(0xFFD1F3F2), // Set background color for selected
              onTap: () {
                setState(() {
                  _selectedIndex = 5; // Update selected index
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
