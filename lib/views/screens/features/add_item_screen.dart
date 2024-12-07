import 'dart:io';

import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/views/widgets/common/navbar.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:image_picker/image_picker.dart';

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

  List<String> categories = [
    'Bags',
    'Plushies',
    'Sweaters',
  ];

  File? _ItemImage;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _ItemImage = File(pickedFile.path);
      });
    }
  }

  void addVariant() {
    if (variantController.text.isNotEmpty &&
        quantityController.text.isNotEmpty) {
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
        appBar: const Customappbar(title: 'Add Item'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style:const TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16.0,
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        labelText: "Item Name",
                        filled: true,
                        fillColor: inputBg,
                        labelStyle: const TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: inputBorder, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: Color(0xFF229799)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: inputBorder),
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
                        const Text(
                          "Add Item Picture",
                          style: InventoryTypography
                              .recordSellingAttributeBlackStyle,
                        ),
                        const SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: const Color(0xFF48CFCB), width: 2),
                            image: _ItemImage != null
                                ? DecorationImage(
                                    image: FileImage(_ItemImage!),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: _ItemImage == null
                              ? const Icon(Icons.image,
                                  size: 50, color: Colors.grey)
                              : null,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: _pickImage,
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
                        const Text("Add Item Price",
                            style: InventoryTypography
                                .recordSellingAttributeBlackStyle),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "Price",
                                  filled: true,
                                  fillColor: inputBg,
                                  labelStyle: const TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Urbanist',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: const BorderSide(
                                        color: inputBorder, width: 2.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                        color: Color(0xFF229799)),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        const BorderSide(color: inputBorder),
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
                                icon: const Icon(Icons.check,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const Text("Add Item Quantity",
                            style: InventoryTypography
                                .recordSellingAttributeBlackStyle),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: AppStyles.basicCardDecoration,
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
                                style: const TextStyle(fontSize: 18, fontFamily: 'Urbanist'),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: DropdownButtonFormField<String>(
                  value: categories.isNotEmpty ? categories[0] : null, // Default category if available
                  onChanged: (String? newCategory) {
                    setState(() {
                      // Handle category selection change if needed
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Select Category',
                    labelStyle: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black.withOpacity(0.6),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: inputBorder, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: brighterGreen),
                    ),
                  ),
                  items: categories.map((category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(
                        category,
                        style: const TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),

              _buildSection("Add Variants", variants, variantController,
                  quantityController, addVariant),
              const SizedBox(height: 20),
              _buildSection("Add Expenses", expenses, expenseController,
                  amountController, addExpense),
            ],
          ),
        ),
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
        Text(
          title,
          style: InventoryTypography.recordSellingAttributeBlackStyle,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Title", style: ExpensesTableTypography.title),
                    Text("Value", style: ExpensesTableTypography.title),
                  ],
                ),
              ),
              for (var entry in entries)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entry.values.first,
                        style: ExpensesTableTypography.subtitle,
                      ),
                      Text(
                        entry.values.last,
                        style: ExpensesTableTypography.subtitle,
                      ),
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
                          hintStyle: ExpensesTableTypography.hint,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF229799)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: fieldController2,
                        decoration: const InputDecoration(
                          hintText: "Value",
                          hintStyle: ExpensesTableTypography.hint,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF229799)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () => addEntry(),
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
