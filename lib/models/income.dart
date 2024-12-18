import 'package:sqflite/sqflite.dart';
import 'package:businessy/database/base_db.dart';
import 'package:businessy/database/db_helper.dart';

class IncomeTable extends DBBaseTable {
  @override
  var db_table = 'income';

  // Insert income record (used when a user records a sale)
  Future<bool> recordIncome({
    required int itemId,
    required int userId,
    required int quantitySold,
    required int itemPrice,
  }) async {
    try {
      final incomeAmount = quantitySold * itemPrice; // Calculate income
      final data = {
        'date': DateTime.now().toString(),
        'amount': incomeAmount,
        'item_id': itemId,
        'user_id': userId,
      };
      return await insertRecord(data); // Insert into database
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
      return false;
    }
  }

  // Get all incomes for a specific item
  Future<List<Map<String, dynamic>>> getIncomesByItem(int itemId) async {
    try {
      final database = await DBHelper.getDatabase();
      return await database.query(
        db_table,
        where: 'item_id = ?',
        whereArgs: [itemId],
      );
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return [];
  }

  // Calculate total income for a specific item
  Future<int> getIncomeByItem(int itemId) async {
    try {
      final database = await DBHelper.getDatabase();
      var result = await database.rawQuery(
          "SELECT SUM(amount) as total FROM $db_table WHERE item_id = ?",
          [itemId]);
      if (result.isNotEmpty && result.first['total'] != null) {
        return (result.first['total'] as num).toInt();
      }
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return 0;
  }

  // Calculate total income for all items
  Future<int> getTotalIncome() async {
    try {
      final database = await DBHelper.getDatabase();
      var result =
          await database.rawQuery("SELECT SUM(amount) as total FROM $db_table");
      if (result.isNotEmpty && result.first['total'] != null) {
        return (result.first['total'] as num).toInt();
      }
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return 0;
  }

  // Update an existing income record
  Future<bool> updateIncome(int id, Map<String, dynamic> updatedData) async {
    try {
      final database = await DBHelper.getDatabase();
      final result = await database.update(
        db_table,
        updatedData,
        where: 'id = ?',
        whereArgs: [id],
      );
      return result > 0;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false;
  }

  // Delete an income record by ID
  Future<bool> deleteIncome(int id) async {
    try {
      final database = await DBHelper.getDatabase();
      final result =
          await database.delete(db_table, where: 'id = ?', whereArgs: [id]);
      return result > 0;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false;
  }
}
