import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';

class RecordSellingDialog extends StatefulWidget {
  final String? productName;
  final int? productPrice;
  const RecordSellingDialog({super.key, this.productName, this.productPrice});

  @override
  State<RecordSellingDialog> createState() => _RecordSellingDialogState();
}

class _RecordSellingDialogState extends State<RecordSellingDialog> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    String itemName = widget.productName ?? "Undefined";
    int itemPrice = widget.productPrice ?? 0; // Default price if null

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 10,
      backgroundColor: whiteColor,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    offset: const Offset(0, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'Record Selling',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Urbanist',
                      color: mainGreen),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Text('Item Name: ',
                            style: InventoryTypography.recordSellingAttributeStyle),
                        Text(itemName,
                            style: InventoryTypography.recordSellingValueStyle),
                      ],
                    ),
                    const SizedBox(height: 8),
                     Row(
                      children: [
                        const Text(
                          'Item Price: ',
                          style: InventoryTypography.recordSellingAttributeStyle,
                        ),
                        Text('$itemPrice DA',
                            style: InventoryTypography.recordSellingValueStyle),
                      ],
                    ),
                    const SizedBox(height: 32),
                    DropdownButtonFormField(
                      value: 'Grey',
                      items: ['Grey','Beige'].map((variant) {
                        return DropdownMenuItem(
                          value: variant,
                          child: Text(variant, style: InventoryTypography.recordSellingValueStyle),
                        );
                      }).toList(),
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        labelText: 'Select Variant',
                        labelStyle: InventoryTypography.recordSellingValueStyle,
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:brighterGreen), // Change to your desired color
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Quantity Sold', style: InventoryTypography.recordSellingAttributeBlackStyle,),
                        Container(
                          decoration: AppStyles.basicCardDecoration,
                          child: Row(
                            children: [
                              Container(
                                decoration: AppStyles.minusCardDecoration,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      quantity = quantity > 1 ? quantity - 1 : 1;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text('$quantity'),
                              const SizedBox(width: 16),
                              Container(
                                decoration: AppStyles.plusCardDecoration,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.grey,
                            textStyle: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          onPressed: () {
                            // Record the sale
                            Navigator.of(context).pop();
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: brighterGreen,
                            foregroundColor: whiteColor,
                            textStyle: const TextStyle(
                              fontFamily: 'Urbanist',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Record'),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
