import 'package:businessy/views/screens/features/details_screen.dart';
import 'package:businessy/views/screens/features/edit_item_screen.dart';
import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:businessy/views/widgets/inventory%20components/deleteConfirmationDialog.dart';
import 'package:businessy/views/widgets/inventory%20components/recordSellingDialog.dart';
import 'package:flutter/material.dart';

const List<String> btnTypes = ["Selling Record", "Details", "Edit", "Delete"];

class CardButton extends StatefulWidget {
  final int type; //index of the type
  final Map<String, dynamic> itemData;

  const CardButton({super.key, required this.type, required this.itemData});

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  @override
  Widget build(BuildContext context) {
    int btnType = widget.type;
    final Map<String, dynamic> itemData = widget.itemData;

    return SizedBox(
      width: 130,
      height: 40,
      child: TextButton(
          onPressed: () {
            btnType==0? _showSellingRecordDialog(context, itemData):
            (btnType==1? (Navigator.push(
                context,
                MaterialPageRoute(builder: (context)
                =>
                    ItemDetailsScreen(itemData: itemData,)
                ))):
            (btnType==2? (Navigator.push(
                context,
                MaterialPageRoute(builder: (context)
                =>
                    EditItemScreen()
                ))):
            (btnType==3? _showDeleteConfirmationDialog(context):null)));
          },
          style: TextButton.styleFrom(
            backgroundColor: btnType == 0 ? mainGreen : (btnType == 3 ? deleteButtonColor : greyDetailsBtn),
            foregroundColor: btnType == 0 || btnType == 3 ? whiteColor : darkGrey,
            // Text color // Padding
            shape: AppStyles.standardRadius,
          ),
          child: Center(
            child: Text(
              btnTypes[btnType],
              style: const TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }

  void _showSellingRecordDialog(BuildContext context, Map<String, dynamic> itemData) {
    int quantity = 1;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return RecordSellingDialog(productName: itemData['name'], productPrice: itemData['price']);
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const DeleteConfirmationDialog();
      },
    );
  }

}
