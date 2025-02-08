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
import 'package:businessy/database/db_helper.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InventoryBloc()..add(LoadCategoriesEvent())..add(LoadAllItemsEvent()),
      child: BlocBuilder<InventoryBloc, InventoryState>(
        builder: (context, state) {
          List<String> categoryNames = [];
          List<Item> allItems = [];

          if (state is InventoryInitialState) {
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is CategoriesLoadedState) {
            categoryNames = state.categories.map((category) => category.name).toList();
          }
          else if (state is ItemsAllLoadedState) {
            allItems = state.items;
          }

          return DefaultTabController(
            length: categoryNames.isNotEmpty ? categoryNames.length + 1 : 1,
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
              body: _buildBody(context, categoryNames, allItems),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, List<String> categories, List<Item> allItems) {
    return Column(
      children: [
        Expanded(
          child: TabBarView(
            children: [
              _buildItemsGridView(allItems, context), // "All" tab
              ...categories.map((category) {
                return BlocBuilder<InventoryBloc, InventoryState>(
                  builder: (context, state) {
                    List<Item> filteredItems = [];
                    if (state is ItemsLoadedForCategoryState) {
                      filteredItems = state.items;
                    }
                    return _buildItemsGridView(filteredItems, context);
                  },
                );
              }).toList(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildItemsGridView(List<Item> items, BuildContext context) {
    final itemCards = items.map((item) => ItemCard(itemData: item.toMap(), isEdit: false)).toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                  categories: items.map((item) => item.category).toSet().toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
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
}
