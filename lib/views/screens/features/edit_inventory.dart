import 'package:businessy/blocs/inventory/inventory_bloc.dart';
import 'package:businessy/blocs/inventory/inventory_event.dart';
import 'package:businessy/blocs/inventory/inventory_state.dart';
import 'package:businessy/models/category.dart';
import 'package:businessy/views/screens/features/add_item_screen.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/views/widgets/inventory%20components/itemCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/item.dart';

class EditInventory extends StatelessWidget {
  final List<Item> items;
  const EditInventory({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    Item itemAdded;
    return BlocProvider(
      create: (context) => InventoryBloc()..add(LoadCategoriesEvent()),
      child: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          if (state is InventoryInitialState) {
            return const Center(child: CircularProgressIndicator());
          }

          List<Category> categories = [];
          if (state is CategoriesLoadedState) {
            categories = state.categories.map((category) => category).toList();
          }
          print('CATEGORIES ----> $categories');

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: Customappbar(title: 'Edit Inventory', onDonePressed: ()=>{Navigator.of(context).pop()},),
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
                        Category category = categories[index];
                        return _categoryItem(category, context);
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
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return ItemCard(itemData: items[index].toMap(), isEdit: true);
                      },
                    ),
                  ),
                ),
              ],
            ),
            floatingActionButton: Stack(
              alignment
                  : Alignment.bottomRight,
              children: [
                // Add Item Button
                Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddItemScreen(categories: categories,)),
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
                      style: TextStyle(color: whiteColor, fontFamily: 'Urbanist', fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                // Add Category Button
                Padding(
                  padding: const EdgeInsets.only(bottom: 140.0),
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
                      style: TextStyle(color: whiteColor, fontFamily: 'Urbanist', fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                // Floating Action Button
                FloatingActionButton(
                  onPressed: () {
                    //context.read<InventoryBloc>().add(ToggleCategoryOptionsEvent());
                  },
                  backgroundColor: mainGreen,
                  child: const Icon(
                    Icons.add_circle_outline_rounded,
                    size: 30,
                    color: whiteColor,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // Category item widget with delete functionality
  Widget _categoryItem(Category category, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: mainGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: brighterGreen, width: 1),
      ),
      child: Row(
        children: [
          Text(
            category.name,
            style: const TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              context.read<InventoryBloc>().add(DeleteCategoryEvent(categoryId: category.id!));
              context.read<InventoryBloc>().add(LoadCategoriesEvent()); // Refresh immediately
            },
            child: const Icon(
              Icons.close,
              color: Colors.red,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }

  // Show dialog for adding a category
  void _showAddCategoryDialog(BuildContext context) {
    final TextEditingController _categoryController = TextEditingController();
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
                              String categoryName = _categoryController.text.trim();
                              if (categoryName.isNotEmpty) {
                                final bloc = context.read<InventoryBloc>();
                                bloc.add(AddCategoryEvent(categoryName: categoryName));

                                // Refresh categories immediately after adding
                                bloc.add(LoadCategoriesEvent());

                                Navigator.of(context).pop();
                              }
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: mainGreen,
                              foregroundColor: whiteColor,
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


}
