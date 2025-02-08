import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CustomTable extends StatefulWidget {
  final String title;
  final List<Map> entries;
  final TextEditingController fieldController1;
  final TextEditingController fieldController2;
  final Function addEntry;

  const CustomTable({
    Key? key,
    required this.title,
    required this.entries,
    required this.fieldController1,
    required this.fieldController2,
    required this.addEntry,
  }) : super(key: key);

  @override
  State<CustomTable> createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: HomeTypography.subtitle,
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE8ECF4)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFFF7F8FA),
                ),
                child: const Row(
                  children: [
                    Text("Title", style: ExpensesTableTypography.title),
                    SizedBox(width: 65),
                    Text("Value", style: ExpensesTableTypography.title),
                  ],
                ),
              ),
              for (var entry in widget.entries)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(entry.values.first,
                            style: ExpensesTableTypography.subtitle),
                      ),
                      Expanded(
                        child: Text(entry.values.last,
                            style: ExpensesTableTypography.subtitle),
                      ),
                      Row(
                        children: [

                          // Space between buttons
                          ElevatedButton(
                            onPressed: () {
                              // Logic for Pay button
                              print("Pay button pressed for: ${entry.values.first}");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: darkGrey,
                              shape: AppStyles.standardRadius,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 2),
                              minimumSize: const Size(50, 30),
                            ),
                            child: const Text(
                              "Pay",
                              style: TextStyle(
                                color: whiteColor,
                                fontFamily: 'Urbanist',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {
                              widget.entries.remove(entry);
                              setState((){});

                            },
                            icon: const Icon(Icons.delete, size: 20),
                            color: Colors.grey, // Red color for delete
                            tooltip: 'Delete', // Tooltip on hover
                          ),
                        ],
                      ),
                    ],
                  ),
                )
,
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: ExpensesTableTypography.subtitle,
                        controller: widget.fieldController1,
                        decoration: const InputDecoration(
                          hintText: "Expense Name",
                          hintStyle: ExpensesTableTypography.hint,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    brighterGreen), // Change this color to your desired one
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        style: ExpensesTableTypography.subtitle,
                        controller: widget.fieldController2,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: "Value",
                          hintStyle: ExpensesTableTypography.hint,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    brighterGreen), // Change this color to your desired one
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => widget.addEntry(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF229799),
                        shape: AppStyles.standardRadius,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      child: const Text(
                        "Add",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
