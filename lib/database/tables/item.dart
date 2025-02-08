import 'package:sqflite/sqflite.dart';
import 'package:businessy/database/base_db.dart';
import 'package:businessy/database/db_helper.dart';

class ItemTable extends DBBaseTable {
  @override
  var db_table = 'item';

  Future<bool> insertItem(Map<String, dynamic> data) async {
    return await insertRecord(data);
  }
  Future<List<Map<String, dynamic>>> getAllItems() async {
    final database = await DBHelper.getDatabase();
    return await database.query(db_table);
  }
  Future<List<Map<String, dynamic>>> getItemsByCategory(int categoryId) async {
    final database = await DBHelper.getDatabase();
    return await database.query(db_table,
        where: 'category_id = ?', whereArgs: [categoryId]);
  }

  Future<bool> updateItem(int id, Map<String, dynamic> updatedData) async {
    return await updateRecord(id, updatedData);
  }

  Future<bool> deleteItem(int id) async {
    return await deleteRecord(id);
  }
}
