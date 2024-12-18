import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';

class PrimaryAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<String>? categories; // Accept a list of categories

  const PrimaryAppbar({super.key, required this.title, this.categories});

  @override
  State<PrimaryAppbar> createState() => _PrimaryAppbarState();

  @override
  Size get preferredSize =>
      title=="Inventory"?const Size.fromHeight(kToolbarHeight+48):const Size.fromHeight(kToolbarHeight);// Adjust height for TabBar
}

class _PrimaryAppbarState extends State<PrimaryAppbar> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    bool isInventory = title == 'Inventory';
    bool isHome = title == 'Home';

    return AppBar(
      title: Text(
        title,
        style: AppBarTypography.title,
      ),
      centerTitle: true,
      backgroundColor: whiteColor,
      surfaceTintColor: Colors.transparent,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.3),
      leading: IconButton(
        icon: const Icon(
          Icons.menu_rounded,
          size: 28,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer(); // Open the drawer
        },
      ),
      actions: !isHome
          ? [
              IconButton(
                icon: const Icon(Icons.account_circle_rounded),
                onPressed: () { },
              )
            ]
          : null,
      bottom: isInventory
          ? TabBar(
              indicatorWeight: 1,
              indicatorColor: mainGreen,
              tabAlignment: TabAlignment.center,
              labelStyle: const TextStyle(
                  fontFamily: 'Urbanist', color: darkGrey, fontSize: 14),
              isScrollable: true,
              // Make tabs scrollable for dynamic length
              tabs: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Tab(
                      child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('All'),
                  )),
                ), // First tab
                if (widget
                    .categories!.isNotEmpty) // Check if categories is not null
                  ...widget.categories!
                      .map((category) => Padding(
                            padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                            child: Tab(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(category),
                            )),
                          ))
                      .toList(), // Generate tabs dynamically
              ],
            )
          : null,
    );
  }
}
