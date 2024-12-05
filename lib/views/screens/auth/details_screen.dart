import 'package:flutter/material.dart';
import 'package:businessy/views/components/appbar.dart';
import 'package:businessy/views/components/navbar.dart';
import 'package:businessy/views/themes/style/colors.dart';

class ItemDetailsScreen extends StatelessWidget {
  final String itemName = "Handbag";
  final String itemPrice = "2000 DA";
  final int itemQuantity = 10;
  final List<Map<String, String>> variants = [
    {"variant": "Grey", "quantity": "7"},
    {"variant": "Beige", "quantity": "3"},
  ];
  final List<Map<String, String>> expenses = [
    {"expense": "Khit", "amount": "300"},
    {"expense": "Others", "amount": "1000"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Details",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: 'Urbanist',
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      bottomNavigationBar: const Navbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Item Info Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextRow("Item Name: ", itemName),
                      const SizedBox(height: 20),
                      _buildTextRow("Item Price: ", itemPrice),
                      const SizedBox(height: 20),
                      _buildTextRow("Item Quantity: ", "$itemQuantity"),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height:141, //120,
                    width: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: mainGreen),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        "", 
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45),
            // Variants Section
            const Text(
              "Items Variants",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Urbanist',
                color: mainGreen,
              ),
            ),
            const SizedBox(height: 8),
            _buildTable(variants, ["Variant", "Quantity"], ["variant", "quantity"]),
            const SizedBox(height: 36),
            // Expenses Section
            const Text(
              "Item Expenses",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Urbanist',
                color: mainGreen,
              ),
            ),
            const SizedBox(height: 8),
            _buildExpensesTable(expenses, ["Expense", "Amount"], ["expense", "amount"]),
          ],
        ),
      ),
    );
  }

  // Helper method to build text rows
  Widget _buildTextRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: title,
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: mainGreen,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build the Item Expenses table with total as the last row
  Widget _buildExpensesTable(
      List<Map<String, String>> data, List<String> headers, List<String> keys) {
    // Calculate the total
    final int totalAmount = data.fold<int>(
      0,
      (sum, item) => sum + int.tryParse(item['amount']!.replaceAll(' DA', ''))!,
    );

    return Table(
      border: TableBorder.all(color: const Color(0xFFE8ECF4)),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
      },
      children: [
        // Table Header
        TableRow(
          decoration: const BoxDecoration(color: Color(0xFFF7F8FA)),
          children: headers
              .map((header) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      header,
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2222222),
                      ),
                    ),
                  ))
              .toList(),
        ),
        // Table Rows
        for (var item in data)
          TableRow(
            children: keys
                .map((key) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item[key] ?? "",
                        style: const TextStyle(
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
          ),
        // Total Row
        TableRow(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Total",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$totalAmount DA",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Method to build generic tables for other data (e.g., variants)
  Widget _buildTable(
      List<Map<String, String>> data, List<String> headers, List<String> keys) {
    return Table(
      border: TableBorder.all(color: const Color(0xFFE8ECF4)),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
      },
      children: [
        // Table Header
        TableRow(
          decoration: const BoxDecoration(color: Color(0xFFF7F8FA)),
          children: headers
              .map((header) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      header,
                      style: const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2222222),
                      ),
                    ),
                  ))
              .toList(),
        ),
        // Table Rows
        for (var item in data)
          TableRow(
            children: keys
                .map((key) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item[key] ?? "",
                        style: const TextStyle(
                          color: Color(0xFF333333),
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
          ),
      ],
    );
  }
}

