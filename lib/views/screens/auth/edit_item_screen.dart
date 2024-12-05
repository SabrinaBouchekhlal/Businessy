import 'package:flutter/material.dart';
import 'package:businessy/views/components/appbar.dart';
import 'package:businessy/views/components/navbar.dart';
import 'package:businessy/views/themes/style/colors.dart';

class EditItemScreen extends StatefulWidget {
  @override
  State<EditItemScreen> createState() => _EditItemScreenState();
}

class _EditItemScreenState extends State<EditItemScreen> {
  int itemQuantity = 10; // Default value for demo
  final List<Map<String, String>> variants = [
    {"variant": "Grey", "quantity": "7"},
    {"variant": "Beige", "quantity": "3"},
  ];
  final List<Map<String, String>> expenses = [
    {"expense": "Khit", "amount": "300"},
    {"expense": "Others", "amount": "1000"},
  ];

  final TextEditingController variantController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController expenseController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController itemNameController = TextEditingController(text: "Handbag");
  final TextEditingController priceController = TextEditingController(text: "2000");

  void editVariant(int index) {
    variantController.text = variants[index]['variant']!;
    quantityController.text = variants[index]['quantity']!;
    showDialog(
      context: context,
      builder: (_) => _buildEditDialog(
        title: "Edit Variant",
        controller1: variantController,
        controller2: quantityController,
        field1: "Variant",
        field2: "Quantity",
        onSave: () {
          setState(() {
            variants[index] = {
              "variant": variantController.text,
              "quantity": quantityController.text,
            };
          });
          Navigator.pop(context);
        },
      ),
    );
  }

  void editExpense(int index) {
    expenseController.text = expenses[index]['expense']!;
    amountController.text = expenses[index]['amount']!;
    showDialog(
      context: context,
      builder: (_) => _buildEditDialog(
        title: "Edit Expense",
        controller1: expenseController,
        controller2: amountController,
        field1: "Expense",
        field2: "Amount",
        onSave: () {
          setState(() {
            expenses[index] = {
              "expense": expenseController.text,
              "amount": amountController.text,
            };
          });
          Navigator.pop(context);
        },
      ),
    );
  }

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
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill in both fields")),
    );
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
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Please fill in both fields")),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
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
            // Item Name
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: itemNameController,
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
                        borderSide: const BorderSide(color: brighterGreen),
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
                    color: mainGreen,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Picture and Price
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Item Picture
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Change Item Picture"),
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
                        onPressed: () {
                          // Handle upload picture
                        },
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
                // Item Price
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Change Item Price"),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: priceController,
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
                                  borderSide: const BorderSide(color: brighterGreen),
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
                              color: mainGreen,
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
                      const Text("Update Item Quantity"),
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
            // Variants Section
            _buildSection("Edit Variants", variants, true, variantController, quantityController,editVariant),
            const SizedBox(height: 20),
            // Expenses Section
            _buildSection("Edit Expenses", expenses, false,expenseController, amountController, editExpense),
          ],
        ),
        
      ),
      bottomNavigationBar: const Navbar(),
    );
  }

   Widget _buildTextField(String label, TextEditingController controller, Color focusedBorderColor, {String? suffixText}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffixText,
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Urbanist',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFE8ECF4)),
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Map<String, String>> entries,bool isVariant, TextEditingController controller1 ,TextEditingController controller2,Function editEntry)      {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Urbanist',
              ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF7F8FA),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Title",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        Text(
                          "Value",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                        Text(
                          "Actions",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Urbanist',
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (var i = 0; i < entries.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(entries[i][isVariant ? "variant" : "expense"] ?? ""),
                          Text(entries[i][isVariant ? "quantity" : "amount"] ?? ""),
                          ElevatedButton(
                            onPressed: () => editEntry(i),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: editbutton,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Edit",
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
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                           controller: controller1,
                           
                            decoration: const InputDecoration(
                              hintText: "Title",
                              focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: brighterGreen), // Underline color when focused
                                 ), ),
                           ),
                        ),
                        const SizedBox(width: 6),//10
                        Expanded(
                           child: TextField(
                           controller: controller2,
                           decoration: const InputDecoration(
                            hintText: "Value",
                            focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: brighterGreen), // Underline color when focused
                                 ),),
                           
                          )       ,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (isVariant) {
                                variants.add({
                                  "variant": variantController.text,
                                  "quantity": quantityController.text,
                                });
                                variantController.clear();
                                quantityController.clear();
                              } else {
                                expenses.add({
                                  "expense": expenseController.text,
                                  "amount": amountController.text,
                                });
                                expenseController.clear();
                                amountController.clear();
                              }
                            });
                          },
                           style: ElevatedButton.styleFrom(
                              backgroundColor: mainGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
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

     Widget _buildEditDialog({
    required String title,
    required TextEditingController controller1,
    required TextEditingController controller2,
    required String field1,
    required String field2,
    required VoidCallback onSave,
  }) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller1,
            decoration: InputDecoration(
              labelText: field1 , 
              focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: brighterGreen), // Underline color when focused
                                 ),),
            
          ),
          const SizedBox(height: 10),
          TextField(
            controller: controller2,
            decoration: InputDecoration(
              labelText: field2,
              focusedBorder: UnderlineInputBorder(
                               borderSide: BorderSide(color: brighterGreen), // Underline color when focused
                                 ),),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel" , style: TextStyle(color: darkGrey),)),
        TextButton(onPressed: onSave, child: const Text("Save" , style: TextStyle(color: mainGreen),)),
      ],
    );
  }
    }



