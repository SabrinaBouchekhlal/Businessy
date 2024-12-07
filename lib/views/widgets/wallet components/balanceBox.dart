import 'package:businessy/views/themes/style/colors.dart';
import 'package:businessy/views/themes/style/styles.dart';
import 'package:businessy/views/themes/style/dimensions.dart';
import 'package:businessy/views/themes/style/typography.dart';
import 'package:flutter/material.dart';

class BalanceBox extends StatefulWidget {
  final double income;
  final double expenses;

  const BalanceBox({super.key, required this.income, required this.expenses});

  @override
  State<BalanceBox> createState() => _BalanceBoxState();
}

class _BalanceBoxState extends State<BalanceBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: mainGreen,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: mainGreen.withOpacity(0.8),
            offset: const Offset(0, 4),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Balance', style: BalanceBoxTypography.title),
              Text('${widget.income - widget.expenses} DA', style: BalanceBoxTypography.totalAmount),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_circle_up_outlined, color: whiteColor, size: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text('Net Worth', style: BalanceBoxTypography.subtitle),
                      ),
                    ],
                  ),
                  Text('${widget.income} DA', style: BalanceBoxTypography.subAmount),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.arrow_circle_down_outlined, color: whiteColor, size: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text('Expenses', style: BalanceBoxTypography.subtitle),
                      ),
                    ],
                  ),
                  Text('${widget.expenses} DA', style: BalanceBoxTypography.subAmount),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
