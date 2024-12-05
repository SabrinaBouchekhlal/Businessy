import 'package:businessy/views/themes/style/colors.dart';
import 'package:flutter/material.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<String>? categories; // Accept a list of categories

  const Appbar({super.key, required this.title, this.categories});

  @override
  State<Appbar> createState() => _AppbarState();

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + 48); // Adjust height for TabBar
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    String title = widget.title;
    bool isInventory = title == 'Inventory';
    bool isHome = title == 'Home';

    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: blackShade,
          fontFamily: 'Urbanist',
          fontWeight: FontWeight.w700,
          fontSize: 22,
        ),
      ),
      centerTitle: true,
      backgroundColor: whiteColor,
      surfaceTintColor: Colors.transparent,
      elevation: 4,
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
                onPressed: () {},
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
