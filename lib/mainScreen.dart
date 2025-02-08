import 'package:businessy/views/screens/features/homepage.dart';
import 'package:businessy/views/screens/features/insights_screen.dart';
import 'package:businessy/views/screens/features/inventory.dart';
import 'package:businessy/views/screens/features/wallet.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/widgets/common/navbar.dart';
import 'package:businessy/views/widgets/common/drawer.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _index = 0;

  final List<Widget> _pages = [
    Homepage(),
    WalletPage(),
    InventoryPage(),
    InsightsPage(),
  ];

  String businessName = 'Serine Crochet';
  String logo = 'assets/img/business_assets/SerineCrochetLOGO.png';
  List<String> categories = [
    'Bags',
    'Plushies',
    'Sweaters',
    'Sweaters',
    'Sweaters'
  ];
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: CustomDrawer(logo: logo, business_name: businessName, index: 0,),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _index = index; // Update the current index
          });
        },
        children: _pages, // Pass your pages here
      ),
      bottomNavigationBar: Navbar(
        onTap: (index) {
          setState(() {
            _index = index; // Update the selected page index
          });
          _pageController.jumpToPage(index);
        },
        index: _index, // Pass the current index to Navbar
      ),
    );
  }

  // Function to dynamically set app bar title based on the current page
  String _getAppBarTitle() {
    switch (_index) {
      case 0:
        return 'Home';
      case 1:
        return 'Wallet';
      case 2:
        return 'Inventory';
      case 3:
        return 'Insights';
      default:
        return 'Businessy';
    }
  }
}

