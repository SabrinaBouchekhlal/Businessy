import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';

class StockItemCard extends StatelessWidget {
  final String itemName;
  final int quantityLeft;
  final bool isOutOfStock;

  const StockItemCard(
      {super.key,
      required this.itemName,
      required this.quantityLeft,
      required this.isOutOfStock});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 150,
        height: 50,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isOutOfStock ? const Color(0x73FF4C4C) : whiteColor,
          boxShadow: const [
            BoxShadow(
              color: Color(0x26000000),
              offset: Offset(0, 4),
              blurRadius: 8,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(itemName, style: HomeTypography.cardText),
            isOutOfStock
                ? const SizedBox() // Placeholder when out of stock
                : Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                    decoration: BoxDecoration(
                      color: inStockOrange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                        child: Text('$quantityLeft',
                            style: const TextStyle(
                                color: whiteColor, fontFamily: 'Urbanist'))),
                  ),
          ],
        ));
  }
}
