import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';

class Top3ItemCard extends StatefulWidget {
  final String itemName;
  final String itemNumber;

  const Top3ItemCard({super.key, required this.itemName, required this.itemNumber});

  @override
  State<Top3ItemCard> createState() => _Top3ItemCardState();
}

class _Top3ItemCardState extends State<Top3ItemCard> {
  @override
  Widget build(BuildContext context) {
    String itemName = widget.itemName;
    String itemNumber = widget.itemNumber;
    return Container(
      width: 150,
      height:50,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextTexture(itemNumber),
          const SizedBox(width: 10),
          Text(
              itemName, style: HomeTypography.cardText
          ),

        ],)
    );
  }
}

Widget TextTexture(String number) {
  List<Color> gold = [
    Color(0xFFFFD700),
    Color(0xFFFFC300),
    Color(0xFFFFAA00),
  ];
  List<Color> silver = [
    Color(0xFFE0E0E0),
    Color(0xFFC0C0C0),
    Color(0xFFA8A8A8),
  ];
  List<Color> bronze = [
    Color(0xFFCD7F32),
    Color(0xFFCD7F32),
    Color(0xFF8C531B),
  ];

  return Center(
    child: Text(
      number,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..shader = LinearGradient(
            colors: (number == '1' ? gold : (number == '2' ? silver : bronze)),
            begin: Alignment.topRight,
            end: Alignment.bottomCenter,
          ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 200.0),),
      ),
    ),
  );
}
