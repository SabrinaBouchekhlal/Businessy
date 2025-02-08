import 'package:sqflite/sqflite.dart';
import 'package:businessy/database/base_db.dart';
import 'package:businessy/database/db_helper.dart';

class HistoryTable extends DBBaseTable {
  @override
  var db_table = 'history';

  // Insert a history record (used when an expense is paid)
  Future<bool> recordHistory({
    required int expenseId,
    required String date,
  }) async {
    try {
      final data = {
        'expense_id': expenseId,
        'date': date,
      };
      return await insertRecord(data);
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
      return false;
    }
  }

  // Get all history records
  Future<List<Map<String, dynamic>>> getAllHistory() async {
    try {
      final database = await DBHelper.getDatabase();
      return await database.query(db_table);
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return [];
  }

  // Get history for a specific expense
  Future<List<Map<String, dynamic>>> getHistoryByExpense(int expenseId) async {
    try {
      final database = await DBHelper.getDatabase();
      return await database.query(
        db_table,
        where: 'expense_id = ?',
        whereArgs: [expenseId],
      );
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return [];
  }

  // Delete a specific history record by ID
  Future<bool> deleteHistoryById(int id) async {
    try {
      final database = await DBHelper.getDatabase();
      final result = await database.delete(db_table, where: 'id = ?', whereArgs: [id]);
      return result > 0;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false;
  }

  // Delete all history records (optional utility method)
  Future<bool> clearAllHistory() async {
    try {
      final database = await DBHelper.getDatabase();
      final result = await database.delete(db_table);
      return result > 0;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false;
  }
}
