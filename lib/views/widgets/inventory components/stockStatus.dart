import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';

class StockStatus extends StatelessWidget {
  final int quantityLeft;

  const StockStatus({super.key, required this.quantityLeft});

  @override
  Widget build(BuildContext context) {
    String quantity = quantityLeft.toString();
    String stockState;
    quantityLeft == 0
        ? stockState = "Empty"
        : (quantityLeft >= 10 ? stockState = "Good" : stockState = "Bad");

    return Container(
        width: 100,
        margin: const EdgeInsets.symmetric(vertical:8),
        padding: stockState == "Empty"
            ? const EdgeInsets.symmetric(horizontal: 14, vertical: 2)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        decoration: BoxDecoration(
          color: stockState == "Empty"
              ? outOfStockRed
              : (stockState == "Bad" ? inStockOrange : inStockGreen),
          borderRadius: BorderRadius.circular(4),
        ),
        child: stockState == "Empty"
            ? (const Text(
                'Out of Stock',
                style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: whiteColor),
              ))
            : (Text(
                '$quantity in stock',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: whiteColor),
              )));
  }
}
