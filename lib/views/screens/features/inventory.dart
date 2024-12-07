import 'package:businessy/views/screens/features/edit_inventory.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/views/widgets/common/drawer.dart';
import 'package:businessy/views/widgets/common/navbar.dart';
import 'package:businessy/views/widgets/inventory%20components/editButton.dart';
import 'package:businessy/views/widgets/inventory%20components/itemCard.dart';
import 'package:flutter/material.dart';

//dummy data
List<String> categories = [
  'Bags',
  'Plushies',
  'Sweaters',
];
List<Map<String, dynamic>> itemsList = [
  {
    'name': 'Hand Bag',
    'price': 2000,
    'picture': 'bag.jpg',
    'quantity': 10,
    'variants': [
      {"variant": "Grey", "quantity": "7"},
      {"variant": "Black", "quantity": "3"},
    ],
    'expenses': [
      {"expense": "expense1", "amount": "300"},
      {"expense": "Others", "amount": "650"},
    ],
  },
  {
    'name': 'Sweater',
    'price': 3500,
    'picture': 'sweater.jpg',
    'quantity': 5,
    'variants': [
      {"variant": "Blue", "quantity": "3"},
      {"variant": "Brown", "quantity": "2"},
    ],
    'expenses': [
      {"expense": "Thread", "amount": "500"},
      {"expense": "Fabric", "amount": "1500"},
    ],
  },
  {
    'name': 'Turtle',
    'price': 1000,
    'picture': 'turtle.jpg',
    'quantity': 0,
    'variants': [
    ],
    'expenses': [
      {"expense": "Wool", "amount": "200"},
      {"expense": "Dye", "amount": "100"},
    ],
  },
  {
    'name': 'Large Bag',
    'price': 3000,
    'picture': 'large_bag.jpg',
    'quantity': 15,
    'variants': [
      {"variant": "Beige", "quantity": "10"},
      {"variant": "Black", "quantity": "5"},
    ],
    'expenses': [
      {"expense": "Leather", "amount": "500"},
      {"expense": "Zipper", "amount": "300"},
    ],
  },
];

String logo = 'assets/img/business_assets/SerineCrochetLOGO.png';
String businessName = 'Serine Crochet';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  //generate a list of ItemCard widgets from the items dictionary
  List<ItemCard> generateItemsCards(
      List<Map<String, dynamic>> dictList, bool isEdit) {
    return dictList.map((itemData) {
      return ItemCard(
        itemData: itemData,
        isEdit: isEdit,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    bool isEdit = false;
    List<ItemCard> _items = generateItemsCards(itemsList, isEdit);

    return DefaultTabController(
        length: categories.length + 1,
        child: Scaffold(
            backgroundColor: whiteColor,
            appBar: Customappbar(title: 'Inventory', categories: categories,),
            drawer:
                CustomDrawer(logo: logo, business_name: businessName, index: 3),
            body: TabBarView(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${_items.length} items found',
                                style: const TextStyle(
                                    fontFamily: 'Urbanist',
                                    color: itemFoundColor)),
                            Editbutton(
                              items: itemsList,
                              categories: categories,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Flexible(
                          child: GridView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height * 1.1),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: _items.length,
                        itemBuilder: (context, index) => _items[index],
                      ))
                    ],
                  ),
                ),
              ),
              Center(
                child: Text('No items found in this category', style: const TextStyle(fontFamily: 'Urbanist')),
              ),
              Center(
                child: Text('No items found in this category', style: const TextStyle(fontFamily: 'Urbanist')),
              ),
              Center(
                child: Text('No items found in this category', style: const TextStyle(fontFamily: 'Urbanist')),
              ),
              Center(
                child: Text('No items found in this category', style: const TextStyle(fontFamily: 'Urbanist')),
              ),
              Center(
                child: Text('No items found in this category', style: const TextStyle(fontFamily: 'Urbanist')),
              ),
            ])));
  }
}
