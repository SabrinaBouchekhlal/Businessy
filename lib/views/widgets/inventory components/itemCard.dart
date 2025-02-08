import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/inventory%20components/button.dart';
import 'package:businessy/views/widgets/inventory%20components/stockStatus.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> itemData; // Single Map for all details
  final bool isEdit;

  const ItemCard({
    super.key,
    required this.itemData,
    required this.isEdit,
  });

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> item = itemData;
    final String itemName = itemData['name'] ?? 'Unnamed Item';
    final int itemPrice = itemData['price'] ?? 0;
    final String itemPicture = itemData['picture'] ?? 'default.png';
    final int itemQuantity = itemData['quantity'] ?? 0;

    return Container(
      decoration: AppStyles.inventoryCardDecoration,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/img/business_assets/$itemPicture',
              fit: BoxFit.fill,
              cacheHeight: 176,
              cacheWidth: 168,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              itemName,
              style: const TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Price: $itemPrice DA',
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          StockStatus(quantityLeft: itemQuantity),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: isEdit
                ? CardButton(type: 2, itemData: item,)
                : CardButton(type: 1,itemData: item,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: isEdit
                ? CardButton(type: 3, itemData: item,)
                : CardButton(
              type: 0,itemData: item,
            ),
          ),
        ],
      ),
    );
  }
}
