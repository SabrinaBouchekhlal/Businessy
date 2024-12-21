import 'package:businessy/models/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:businessy/blocs/inventory/inventory_bloc.dart';
import 'package:businessy/blocs/inventory/inventory_event.dart';
import 'package:businessy/blocs/inventory/inventory_state.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/widgets/common/customAppbar.dart';
import 'package:businessy/views/widgets/common/drawer.dart';
import 'package:businessy/views/widgets/inventory%20components/editButton.dart';
import 'package:businessy/views/widgets/inventory%20components/itemCard.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InventoryBloc()..add(LoadCategoriesEvent()),
      child: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          // Get categories length based on state
          int tabLength = 1; // Default to 1 for "All" tab
          List<String> categoryNames = [];

          if (state is CategoriesLoadedState) {
            categoryNames = state.categories.map((category) => category.name).toList();
            tabLength = categoryNames.length + 1; // +1 for "All" tab
          }

          return DefaultTabController(
            length: tabLength,
            child: Scaffold(
              backgroundColor: whiteColor,
              appBar: Customappbar(
                title: 'Inventory',
                categories: categoryNames,
              ),
              drawer: const CustomDrawer(
                logo: 'assets/img/business_assets/SerineCrochetLOGO.png',
                business_name: 'Serine Crochet',
                index: 3,
              ),
              body: _buildBody(context, state),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, InventoryState state) {
    if (state is InventoryInitialState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is CategoriesLoadedState) {
      final categories = state.categories.map((category) => category.name).toList();
      return _buildInventoryContent(context, categories);
    } else if (state is ItemsLoadedForCategoryState) {
      return _buildItemsContent(context, state.items);
    } else {
      return const Center(child: Text('An unexpected error occurred'));
    }
  }

  Widget _buildInventoryContent(BuildContext context, List<String> categories) {
    // Load items for the first category
    context.read<InventoryBloc>().add(const LoadItemsForCategoryEvent(categoryId: 1));

    return Column(
      children: [
        TabBar(
          isScrollable: true,
          tabs: categories.map((category) => Tab(text: category)).toList(),
          
    ),
        Expanded(
          child: TabBarView(
            children: [
              _buildItemsGridView([], context),
              ...categories.map((category) {
                final filteredItems = _getItemsForCategory(category);
                return filteredItems.isEmpty
                    ? const Center(child: Text('No items found in this category'))
                    : _buildItemsGridView(filteredItems, context);
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemsContent(BuildContext context, List<Item> items) {
    final mappedItems = items.map((item) => _mapItemToData(item)).toList();
    return _buildItemsGridView(mappedItems, context);
  }

  List<Map<String, dynamic>> _getItemsForCategory(String category) {
    // Get items filtered by category
    return [];
  }

  Widget _buildItemsGridView(List<Map<String, dynamic>> items, BuildContext context) {
    final itemCards = items
        .map((itemData) => ItemCard(itemData: itemData, isEdit: false))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${itemCards.length} items found',
                  style: const TextStyle(
                    fontFamily: 'Urbanist',
                    color: itemFoundColor,
                  ),
                ),
                Editbutton(
                  items: items,
                  categories: items
                      .map((item) => item['category'] as String)
                      .toSet()
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
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
              itemCount: itemCards.length,
              itemBuilder: (context, index) => itemCards[index],
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _mapItemToData(Item item) {
    return {
      'name': item.name,
      'price': item.price,
      'picture': item.itemImage,
      'quantity': item.quantity,
      'category': item.categoryId,
      'variants': [],
      'expenses': [],
    };
  }
}