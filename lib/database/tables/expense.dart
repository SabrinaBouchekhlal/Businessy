import 'package:sqflite/sqflite.dart';
import 'package:businessy/database/base_db.dart';
import 'package:businessy/database/db_helper.dart';

class ExpenseTable extends DBBaseTable {
  @override
  var db_table = 'expense';

  Future<bool> insertExpense(Map<String, dynamic> data) async {
    return await insertRecord(data);
  }

  Future<List<Map>> getExpensesByItem(int itemId) async {
    final database = await DBHelper.getDatabase();
    return await database.query(db_table,
        where: 'item_id = ?', whereArgs: [itemId]);
  }

  Future<List<Map>> getGlobalExpenses() async {
    final database = await DBHelper.getDatabase();
    return await database.query(db_table, where: 'item_id IS NULL');
  }

  Future<int> getTotalExpense() async {
    final database = await DBHelper.getDatabase();
    var result =
        await database.rawQuery("SELECT SUM(amount) as total FROM $db_table");
    if (result.isNotEmpty && result.first['total'] != null) {
      return (result.first['total'] as num).toInt();
    }
    return 0;
  }

  Future<bool> updateExpense(int id, Map<String, dynamic> updatedData) async {
    return await updateRecord(id, updatedData);
  }

  Future<bool> deleteExpense(int id) async {
    return await deleteRecord(id);
  }
}
