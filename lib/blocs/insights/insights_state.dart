import 'package:businessy/models/expense.dart';
import 'package:businessy/models/income.dart';
import 'package:equatable/equatable.dart';
import 'package:businessy/models/item.dart';

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
    required this.topSoldItems,
  });

  @override
  List<Object> get props => [period, topSoldItems];
}
