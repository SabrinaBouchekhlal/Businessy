import 'package:businessy/views/screens/features/paymentsHistoryPage.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/views/widgets/common/drawer.dart';
import 'package:businessy/views/widgets/common/navbar.dart';
import 'package:businessy/views/widgets/wallet%20components/balanceBox.dart';
import 'package:businessy/views/widgets/wallet%20components/balanceStatus.dart';
import 'package:businessy/views/widgets/wallet%20components/customTable.dart';
import 'package:flutter/material.dart';

import '../../widgets/wallet components/goalProgressBar.dart';

Map<String, double> balanceData = {
  'income': 80000.00,  // Example balance data
  'expenses': 30000.00, // Example expense data
};

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  void addEntry() {
    entries.add({
      "Title": fieldController1.text,
      "Value": fieldController2.text,
    });
    setState(() {});
    fieldController1.text = '';
    fieldController2.text = '';
  }

  final TextEditingController fieldController1 = TextEditingController();
  final TextEditingController fieldController2 = TextEditingController();
  final List<Map<String, String>> entries = [
    {"Title": "Rent", "Value": "30000"},
    {"Title": "Supplies", "Value": "15000"},
    {"Title": "Utilities", "Value": "8000"},
  ];

  @override
  Widget build(BuildContext context) {
    String businessName = 'Serine Crochet'; // Business name for display
    String logo = 'assets/img/business_assets/SerineCrochetLOGO.png'; // Business logo for display

    return Scaffold(
      appBar: const Customappbar(title: 'Wallet'), // Custom app bar
      drawer: CustomDrawer(logo: logo, business_name: businessName, index: 2), // Custom drawer
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            BalanceBox(
              income: balanceData['income']!,
              expenses: balanceData['expenses']!,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 50, width: 50),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PaymentHistoryPage()),
                          );
                        },
                        child: const Text(
                          'See history of payments',
                          style: BalanceBoxTypography.paymentHistory,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text('Goal Progress', style: ProgressBarTypography.title),
                            GoalProgressBar(progressPercentage: 85), // Example progress
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Column(
                          children: [
                            Text('Current Balance', style: ProgressBarTypography.title),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Balancestatus(value: 75), // Example balance status
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  CustomTable(
                    title: "Additional Expenses",
                    entries: entries,
                    fieldController1: fieldController1,
                    fieldController2: fieldController2,
                    addEntry: addEntry,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
