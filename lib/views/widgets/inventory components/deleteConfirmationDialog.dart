import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';

class DeleteConfirmationDialog extends StatefulWidget {
  const DeleteConfirmationDialog({super.key});

  @override
  State<DeleteConfirmationDialog> createState() => _DeleteConfirmationDialogState();
}

class _DeleteConfirmationDialogState extends State<DeleteConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Rounded corners
      ),
      title: const Text('Are you sure?', style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w700,)),
      content: const Text('Do you really want to delete this item?', style: TextStyle(fontFamily: 'Urbanist',)),
      backgroundColor: whiteColor,
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          style: TextButton.styleFrom(
            backgroundColor: whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          child: const Text('Cancel', style: TextStyle(fontFamily: 'Urbanist', color: Colors.grey)),
        ),
        TextButton(
          onPressed: () {
            // Add your delete logic here
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Rounded corners
            ),
          ),
          child: const Text('Delete', style: TextStyle(fontFamily: 'Urbanist', fontWeight: FontWeight.w700,)),
        ),
      ],
    );
  }
}
