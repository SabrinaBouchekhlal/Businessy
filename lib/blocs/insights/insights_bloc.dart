import 'package:flutter_bloc/flutter_bloc.dart';
import 'insights_event.dart';
import 'insights_state.dart';
import 'package:flutter/material.dart';
import 'package:businessy/database/tables/income.dart';
import 'package:businessy/database/tables/item.dart';

class InsightsBloc extends Bloc<InsightsEvent, InsightsState> {
  final IncomeTable incomeTable;
  final ItemTable itemTable; // Add this dependency

  InsightsBloc(this.incomeTable, this.itemTable) : super(const InsightsInitial()) {
    on<LoadInsights>(_loadInsights);
  }

  /// Handles loading insights
  Future<void> _loadInsights(LoadInsights event, Emitter<InsightsState> emit) async {
    try {
      // Fetch all incomes from the database
      final incomes = await incomeTable.getAllIncomes();

      // Define the period (e.g., current month)
      final DateTime now = DateTime.now();
      final DateTime startOfMonth = DateTime(now.year, now.month, 1);

      // Filter incomes to include only records from the current month
      final filteredIncomes = incomes
          .where((income) =>
              DateTime.parse(income['date']).isAfter(startOfMonth))
          .toList();

      // Generate weekly sales data
      final weeklySalesData = _generateSalesData(filteredIncomes);

      // Generate top-sold items
      final topSoldItems = await _generateTopSoldItems(filteredIncomes);

      // Emit the updated state
      emit(InsightsState(
        weeklySalesData: weeklySalesData,
        topSoldItems: topSoldItems,
      ));
    } catch (e) {
      print('Error loading insights: $e');
      emit(const InsightsInitial());
    }
  }

  /// Aggregates income data into weekly sales data
  List<SalesData> _generateSalesData(List<Map<String, dynamic>> filteredIncomes) {
    // Group incomes by week and month
    final Map<int, Map<String, dynamic>> salesByWeek = {};

    for (final income in filteredIncomes) {
      final date = DateTime.parse(income['date']);
      final weekOfYear = _getWeekOfYear(date);
      final month = _getMonthName(date);

      // Initialize the week if not already present
      salesByWeek[weekOfYear] ??= {
        'month': month,
        'income': 0.0,
        'expenses': 0.0
      };

      // Add income to the respective week
      salesByWeek[weekOfYear]!['income'] =
          (salesByWeek[weekOfYear]!['income'] ?? 0) + income['amount'];
      // Placeholder: Add expenses logic here if available
    }

    // Convert grouped data to a List<SalesData>
    return salesByWeek.entries.map((entry) {
      final week = entry.key;
      final data = entry.value;
      return SalesData(
        week: week,
        month: data['month'],
        income: data['income'],
        expenses: data['expenses'],
      );
    }).toList();
  }

  /// Aggregates income data to find top-sold items by revenue
  Future<List<TopSoldItem>> _generateTopSoldItems(
      List<Map<String, dynamic>> filteredIncomes) async {
    // Group revenue by item_id
    final Map<int, double> revenueByItem = {};

    for (final income in filteredIncomes) {
      final itemId = income['item_id'];
      final amount = income['amount'] as double;

      // Add revenue for the item
      revenueByItem[itemId] = (revenueByItem[itemId] ?? 0) + amount;
    }

    // Fetch item names for the item IDs
    final itemNames = await itemTable.getItemNames(revenueByItem.keys.toList());

    // Convert to List<TopSoldItem> and sort by revenue
    final List<TopSoldItem> topSoldItems = revenueByItem.entries.map((entry) {
      final itemId = entry.key;
      final itemName = itemNames[itemId] ?? 'Unknown Item'; // Fallback name
      return TopSoldItem(
        item: itemName,
        revenue: entry.value,
      );
    }).toList();

    // Sort by revenue (descending order)
    topSoldItems.sort((a, b) => b.revenue.compareTo(a.revenue));

    // Limit to top 5 items (optional)
    return topSoldItems.take(5).toList();
  }

  /// Helper method to calculate the week of the year
  int _getWeekOfYear(DateTime date) {
    final firstDayOfYear = DateTime(date.year, 1, 1);
    final daysSinceStartOfYear = date.difference(firstDayOfYear).inDays;
    return (daysSinceStartOfYear / 7).ceil();
  }

  /// Helper method to get the month name
  String _getMonthName(DateTime date) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[date.month - 1];
  }
}


