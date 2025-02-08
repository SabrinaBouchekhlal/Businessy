import 'package:businessy/models/item.dart';
import 'package:businessy/views/screens/features/edit_inventory.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:flutter/material.dart';

import '../../../models/category.dart';
List<String> categories = [
  'Bags',
  'Plushies',
  'Sweaters',
  'Sweaters',
  'Sweaters'
];
class Editbutton extends StatelessWidget {
  final List<Item> items;
  final List<Category> categories;

  const Editbutton({super.key, required this.items, required this.categories});

  @override
  Widget build(BuildContext context) {
    List<Item> _items = items;

    return TextButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context)
        =>
            EditInventory(items: _items)
        ));

      },
      child: const Row(
        children: [
          Icon(Icons.edit_outlined,
              color: mainGreen, size: 18),
          Text('Edit',
              style: TextStyle(
                fontFamily: 'Urbanist',
                color: mainGreen,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ))
        ],
      ),
    );
  }
}
