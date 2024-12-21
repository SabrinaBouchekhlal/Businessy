import 'package:businessy/views/screens/features/homepage.dart';
import 'package:businessy/views/screens/features/insights_screen.dart';
import 'package:businessy/views/screens/features/inventory.dart';
import 'package:businessy/views/screens/features/wallet.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class Navbar extends StatefulWidget {
  final int index;
  final Function(int) onTap;
  const Navbar({super.key, required this.index, required this.onTap});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // List of pages
  /*final List<Widget> _pages = [
    Homepage(),
    WalletPage(),
    InventoryPage(),
    InsightsPage(),
  ];*/

  final List<String> pages_routes = [
    '/Homepage',
    '/WalletPage',
    '/InventoryPage',
    '/InsightsPage',
  ];

  @override
  Widget build(BuildContext context) {
    int _index = widget.index;

    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,  // White color for the navbar
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),  // Shadow color
            blurRadius: 10.0,  // Blur effect
            offset: const Offset(0, 0),  // Position of shadow
          ),
        ],
      ),
      child: CurvedNavigationBar(
        height:45,
        animationDuration: const Duration(milliseconds: 100),
        backgroundColor: Colors.transparent,
        color: whiteColor,
        buttonBackgroundColor: brighterGreen,
        index: _index,
        items:  <Widget>[
          Icon(Icons.home_filled, size: 28, color: _index == 0? whiteColor : darkGrey),
          Icon(Icons.account_balance_wallet_outlined, size: 28, color: _index == 1? whiteColor : darkGrey),
          Icon(Icons.inventory_2_outlined, size: 28, color: _index == 2? whiteColor : darkGrey),
          Icon(Icons.analytics_outlined, size: 28, color: _index == 3? whiteColor : darkGrey),
        ],
        onTap: (index) {
          widget.onTap(index);
        },
      ),
    );
  }
}
