import 'package:businessy/models/expense.dart';
import 'package:businessy/models/income.dart';
import 'package:equatable/equatable.dart';
import 'package:businessy/models/item.dart';

import 'package:equatable/equatable.dart';

class SalesData {
  final int week;
  final String month;
  final double income;
  final double expenses;

  SalesData({
    required this.week,
    required this.month,
    required this.income,
    required this.expenses,
  });
}

class TopSoldItem {
  final String item;
  final double revenue;

  TopSoldItem({required this.item, required this.revenue});
}

class InsightsState extends Equatable {
  final List<SalesData> weeklySalesData;
  final List<TopSoldItem> topSoldItems;

  const InsightsState({
    required this.weeklySalesData,
    required this.topSoldItems,
  });

  @override
  List<Object?> get props => [weeklySalesData, topSoldItems];
}

class InsightsInitial extends InsightsState {
  const InsightsInitial()
      : super(weeklySalesData: const [], topSoldItems: const []);
}
