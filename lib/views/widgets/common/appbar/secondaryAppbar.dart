import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';

class SecondaryAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onDonePressed;

  const SecondaryAppbar({super.key, required this.title, this.onDonePressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppBarTypography.title),
      backgroundColor: whiteColor,
      foregroundColor: darkGrey,
      surfaceTintColor: Colors.transparent,
      leading: Padding(
        padding: const EdgeInsets.only(left:16),
        child: TextButton(
          style: TextButton.styleFrom(
            minimumSize: const Size(40, 40),
            padding: EdgeInsets.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: const Text('Done', style: TextStyle(fontSize: 16, fontFamily: 'Urbanist', fontWeight:FontWeight.w700, color:mainGreen)),
          onPressed: onDonePressed,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right:16),
          child: TextButton(
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontFamily: 'Urbanist',
                color: Color(0xFFB0B0B0), // Standard color for cancel button
                fontSize: 14, // Standard font size
              ),
            ),
            onPressed: () {Navigator.of(context).pop();
              },
          ),
        ),
      ],
      elevation: 8,
      centerTitle: true,
      shadowColor: Colors.black.withOpacity(0.3),
    );
  }
}
