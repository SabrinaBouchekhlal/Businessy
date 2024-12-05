import 'package:businessy/views/themes/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,  // White color for the navbar
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),  // Shadow color
            blurRadius: 10.0,  // Blur effect
            offset: const Offset(0, 0),  // Position of shadow
          ),
        ],
      ),
      child: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        color: whiteColor,
        buttonBackgroundColor: brighterGreen,
        items:  <Widget>[
          Icon(Icons.home_filled, size: 28, color: _index == 0? whiteColor : darkGrey),
          Icon(Icons.account_balance_wallet_outlined, size: 28, color: _index == 1? whiteColor : darkGrey),
          Icon(Icons.inventory_2_outlined, size: 28, color: _index == 2? whiteColor : darkGrey),
          Icon(Icons.analytics_outlined, size: 28, color: _index == 3? whiteColor : darkGrey),
        ],
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
    );
  }
}
