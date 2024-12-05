import 'package:flutter/material.dart';
import 'package:businessy/views/components/appbar.dart';
import 'package:businessy/views/components/navbar.dart';
import 'package:businessy/views/themes/style/colors.dart';

class AddItemScreen extends StatefulWidget {
  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  int itemQuantity = 0;
  final List<Map<String, String>> variants = [];
  final List<Map<String, String>> expenses = [];
  final TextEditingController variantController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  void addVariant() {
    if (variantController.text.isNotEmpty && quantityController.text.isNotEmpty) {
      setState(() {
        variants.add({
          "variant": variantController.text,
          "quantity": quantityController.text,
        });
        variantController.clear();
        quantityController.clear();
      });
    }
  }

  void addExpense() {
    if (expenseController.text.isNotEmpty && amountController.text.isNotEmpty) {
      setState(() {
        expenses.add({
          "expense": expenseController.text,
          "amount": amountController.text,
        });
        expenseController.clear();
        amountController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.close, color: Colors.black),
            onPressed: () {
              // Handle cancel action
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Add Item',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Urbanist',
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                // Handle done action
              },
              child: const Text(
                "Done",
                style: TextStyle(
                  color: mainGreen,
                  fontFamily: 'Urbanist',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
          
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Item Name",
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFF229799)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 13),
                  Container(
                    width: 66,
                    height: 56,
                    decoration: BoxDecoration(
                      color: const Color(0xFF229799),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.check, color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Add Item Picture"),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFF48CFCB), width: 2),
                          ),
                          child: const Icon(Icons.image, size: 50, color: Colors.grey),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF229799),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            fixedSize: const Size(double.infinity, 40),
                          ),
                          child: const Text(
                            "Upload Picture",
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
                  const SizedBox(width: 20),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Add Item Price"),
                        const SizedBox(height: 14 ),//8
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Price",
                                  suffixText: "DA",
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(color: Color(0xFF229799)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 51,
                              height: 56,
                              decoration: BoxDecoration(
                                color: const Color(0xFF229799),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: IconButton(
                                onPressed: () {
                                  // Handle check button press
                                },
                                icon: const Icon(Icons.check, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text("Add Item Quantity"),
                        const SizedBox(height: 10),
                        Container(
                           padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFFE8ECF4)),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (itemQuantity > 0) itemQuantity--;
                                  });
                                },
                                icon: const Icon(Icons.remove),
                                color: Colors.grey,
                              ),
                              Text(
                                "$itemQuantity",
                                style: const TextStyle(fontSize: 18),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    itemQuantity++;
                                  });
                                },
                                icon: const Icon(Icons.add),
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              _buildSection("Add Variants", variants, variantController, quantityController, addVariant),
              const SizedBox(height: 20),
              _buildSection("Add Expenses", expenses, expenseController, amountController, addExpense),
            ],
          ),
        ),
         bottomNavigationBar: const Navbar(),
      ),
    );
  }

  Widget _buildSection(
    String title,
    List<Map<String, String>> entries,
    TextEditingController fieldController1,
    TextEditingController fieldController2,
    Function addEntry,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE8ECF4)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  color: Color(0xFFF7F8FA),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Title", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Value", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              for (var entry in entries)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(entry.values.first),
                      Text(entry.values.last),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: fieldController1,
                        decoration: const InputDecoration(
                          hintText: "Title",
                          focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: brighterGreen), // Underline color when focused
                                 ),),
                        
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: fieldController2,
                        decoration: const InputDecoration(
                          hintText: "Value",
                          focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: brighterGreen), // Underline color when focused
                                 ),),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => addEntry(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF229799),
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


