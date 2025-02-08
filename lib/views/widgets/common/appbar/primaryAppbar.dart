import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:businessy/blocs/inventory/inventory_bloc.dart';
import 'package:businessy/blocs/inventory/inventory_state.dart';
import 'package:businessy/blocs/inventory/inventory_event.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/typography.dart';

class PrimaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<String> categories;

  const PrimaryAppbar({super.key, required this.title, required this.categories});

  @override
  Widget build(BuildContext context) {
    bool isInventory = title == 'Inventory';
print('CATEGOREIS FROM PRIMARY APPBAR: $categories');
    return AppBar(
      title: Text(title, style: AppBarTypography.title),
      centerTitle: true,
      backgroundColor: whiteColor,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.3),
      leading: IconButton(
        icon: const Icon(Icons.menu_rounded, size: 28),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.account_circle_rounded),
          onPressed: () {},
        ),
      ],
      bottom: isInventory ? _buildCategoryTabs(context) : null,
    );
  }

  PreferredSizeWidget _buildCategoryTabs(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: TabBar(
        indicatorWeight: 1,
        indicatorColor: mainGreen,
        isScrollable: true,
        labelColor: mainGreen,
        tabs: [
          const Tab(child: Text('All', style:TextStyle(fontFamily: 'Urbanist'))), // Default "All" tab
          ...categories.map((category) => Tab(child: Text(category, style:TextStyle(fontFamily: 'Urbanist',)))).toList(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 48);
}
