import 'package:businessy/views/widgets/common/appbar/primaryAppbar.dart';
import 'package:businessy/views/widgets/common/appbar/secondaryAppbar.dart';
import 'package:flutter/material.dart';


class Customappbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  final List<String>? categories; //if it's inventory
  final VoidCallback? onDonePressed; //if it's secondary
  const Customappbar({super.key, required this.title, this.categories, this.onDonePressed});


  @override
  Widget build(BuildContext context) {
    bool isPrimary = false;
    if(title=='Home' || title=='Inventory' || title=='Insights' || title=='Wallet') isPrimary = true;

    return isPrimary!
        ? PrimaryAppbar(title: title, categories: categories)
        : SecondaryAppbar(title: title, onDonePressed: onDonePressed,);
  }
  @override
  Size get preferredSize =>title=="Inventory"?const Size.fromHeight(kToolbarHeight+48):const Size.fromHeight(kToolbarHeight);
}
