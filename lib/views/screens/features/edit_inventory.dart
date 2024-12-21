import 'package:businessy/views/screens/features/add_item_screen.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/views/widgets/inventory%20components/deleteConfirmationDialog.dart';
import 'package:businessy/views/widgets/inventory%20components/itemCard.dart';
import 'package:flutter/material.dart';

class EditInventory extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  final List<String> categories; // Add categories to the constructor
  const EditInventory({super.key, required this.items, required this.categories});

  @override
  State<EditInventory> createState() => _EditInventoryState();
}

class _EditInventoryState extends State<EditInventory> {
  late List<String> categories;

  @override
  void initState() {
    super.initState();
    categories = widget.categories; // Initialize the category list
  }

  // Generate ItemCards from items list
  List<ItemCard> generateItemsCards(
      List<Map<String, dynamic>> dictList, bool isEdit) {
    return dictList.map((itemData) {
      return ItemCard(
        itemData: itemData,
        isEdit: isEdit,
      );
    }).toList();
  }

  // Function to delete a category
  void deleteCategory(String category) {
    setState(() {
      categories.remove(category);
    });
  }

  bool showOptions = false; // Tracks whether the additional buttons should appear
  final TextEditingController _categoryController = TextEditingController();

  // Show the dialog for adding a category
  void _showAddCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
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
                      'Add Category',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Urbanist',
                        color: mainGreen,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter the category name:",
                        style: ProgressBarTypography.subtitle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(height: 12),
                      TextField(
                        controller: _categoryController,
                        keyboardType: TextInputType.text,
                        style: const TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Category name",
                          hintStyle: TextStyle(
                            fontFamily: 'Urbanist',
                            color: inputPlaceholder,
                            fontSize: 14.0,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: inputBorder),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: brighterGreen),
                          ),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _categoryController.clear();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.grey,
                              textStyle: const TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text('Cancel'),
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            onPressed: () {
                              String categoryName =
                              _categoryController.text.trim();
                              if (categoryName.isNotEmpty) {
                                categories.insert(0, categoryName);
                                setState(() {

                                });
                              }
                              Navigator.of(context).pop();
                              _categoryController.clear();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: brighterGreen,
                              foregroundColor: whiteColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              textStyle: const TextStyle(
                                fontFamily: 'Urbanist',
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            child: const Text('Add'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String title = 'Edit Inventory';
    bool isEdit = true;
    List<ItemCard> itemsList = generateItemsCards(widget.items, isEdit);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Customappbar(title: title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category slider
          if (categories.isNotEmpty)
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  String category = categories[index];
                  return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal:16, vertical: 0),
                    decoration: BoxDecoration(
                      color: mainGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: brighterGreen, width: 1),
                    ),
                    child: Row(
                      children: [
                        Text(
                          category,
                          style: const TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => deleteCategory(category),
                          child: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          else
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "No categories available.",
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          const SizedBox(height: 16),

          // Item cards grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height * 1.1),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: itemsList.length,
                itemBuilder: (context, index) => itemsList[index],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // Add Item Button
          if (showOptions)
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0), // Adjust position above FAB
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddItemScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainGreen,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Add Item",
                  style: TextStyle(color: whiteColor,fontFamily: 'Urbanist',fontWeight: FontWeight.w600),
                ),
              ),
            ),

          // Add Category Button
          if (showOptions)
            Padding(
              padding: const EdgeInsets.only(bottom: 140.0), // Adjust position above Add Item
              child: ElevatedButton(
                onPressed: () => _showAddCategoryDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: expenseline,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  "Add Category",
                  style: TextStyle(color: whiteColor,fontFamily: 'Urbanist',fontWeight: FontWeight.w600),
                ),
              ),
            ),

          // Floating Action Button
          FloatingActionButton(
            onPressed: () {
              setState(() {
                showOptions = !showOptions;
              });
            },
            backgroundColor: mainGreen,
            child: Icon(
              showOptions ? Icons.highlight_remove_rounded : Icons.add_circle_outline_rounded,
              size: 30,
              color: whiteColor,
            ),
          ),
        ],
      ),

    );
  }
}


