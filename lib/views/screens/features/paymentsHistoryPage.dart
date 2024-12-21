import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/navbar.dart';
import 'package:flutter/material.dart';

class PaymentHistoryPage extends StatefulWidget {
  PaymentHistoryPage({Key? key}) : super(key: key);

  @override
  _PaymentHistoryPageState createState() => _PaymentHistoryPageState();
}

class _PaymentHistoryPageState extends State<PaymentHistoryPage> {
  List<Map<String, String>> paymentHistory = [
    {"date": "2024-12-01", "expense": "Rent", "amount": "-30000.00"},
    {"date": "2024-12-03", "expense": "Supplies", "amount": "-12000.00"},
    {"date": "2024-12-05", "expense": "Utilities", "amount": "-800.00"},
  ];

  // List to temporarily store the removed payment
  Map<String, String>? removedPayment;
  int? removedIndex;

  void _undoDelete() {
    if (removedPayment != null && removedIndex != null) {
      setState(() {
        paymentHistory.insert(removedIndex!, removedPayment!);
        removedPayment = null;
        removedIndex = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'Payment History',
          style: AppBarTypography.title,
        ),
        backgroundColor: whiteColor,
        surfaceTintColor: whiteColor,
        elevation: 4.0,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(0.3),
        leading: IconButton(
          onPressed: () { Navigator.pop(context); },
          icon: AppStyles.backButtonIcon,
        ),
      ),
      body: ListView.builder(
        itemCount: paymentHistory.length,
        itemBuilder: (context, index) {
          final payment = paymentHistory[index];

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: AppStyles.basicCardDecoration,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  title: Text(
                    payment['expense'] ?? "",
                    style: const TextStyle(
                        color: blackColor, fontFamily: 'Urbanist', fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  subtitle: Text(
                    payment['date'] ?? "",
                    style: const TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${payment['amount']} DA' ?? "",
                        style: const TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.undo, color: brighterGreen), // Undo Icon
                        onPressed: () {
                          setState(() {
                            removedPayment = payment; // Store the removed item
                            removedIndex = index; // Store the index of the removed item
                            paymentHistory.removeAt(index); // Remove the item from the list
                          });

                          // Show a SnackBar with an undo option
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text('Payment deleted', style: TextStyle(color: darkGrey, fontFamily: 'Urbanist')),
                              backgroundColor: inputBg,
                              action: SnackBarAction(
                                label: 'UNDO',
                                onPressed: _undoDelete,
                                textColor: mainGreen,
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
