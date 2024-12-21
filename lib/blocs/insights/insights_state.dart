import 'package:businessy/models/expense.dart';
import 'package:businessy/models/income.dart';
import 'package:equatable/equatable.dart';
import 'package:businessy/models/item.dart';

<<<<<<< HEAD
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
=======
abstract class InsightsState extends Equatable {
  const InsightsState();

  @override
  List<Object?> get props => [];
}

class InsightsInitialState extends InsightsState {}

class FinancialOverviewLoadedState extends InsightsState {
  final Income income;
  final Expense expense;

  const FinancialOverviewLoadedState({
    required this.income,
    required this.expense,
  });

  @override
  List<Object> get props => [income, expense];
}

class TopSoldItemsLoadedState extends InsightsState {
  final DateTime period;
  final List<Item> topSoldItems;

  const TopSoldItemsLoadedState({
    required this.period,
>>>>>>> 6012124136260cfbc70a3af03cc305feb6b05a81
    required this.topSoldItems,
  });

  @override
<<<<<<< HEAD
  List<Object?> get props => [weeklySalesData, topSoldItems];
}

class InsightsInitial extends InsightsState {
  const InsightsInitial()
      : super(weeklySalesData: const [], topSoldItems: const []);
=======
  List<Object> get props => [period, topSoldItems];
>>>>>>> 6012124136260cfbc70a3af03cc305feb6b05a81
}
