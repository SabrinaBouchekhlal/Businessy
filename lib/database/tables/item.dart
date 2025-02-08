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
  Future<List<Map>> getItemsByCategory(int categoryId) async {

    final database = await DBHelper.getDatabase();
    return await database.query(db_table,
        where: 'category_id = ?', whereArgs: [categoryId]);
  }
  /// Fetches item names for a list of item IDs
  Future<List<String>> getItemNames(List<int> itemIds) async {
    final database = await DBHelper.getDatabase();
    // Create placeholders for the list of IDs
    final idPlaceholders = List.filled(itemIds.length, '?').join(', ');

    final result = await database.query(
      db_table,
      columns: ['name'], // Only select the 'name' column
      where: 'id IN ($idPlaceholders)',
      whereArgs: itemIds,
    );

    // Extract the names into a List<String>
    return result.map((item) => item['name'] as String).toList();
  }

  Future<bool> updateItem(int id, Map<String, dynamic> updatedData) async {
    return await updateRecord(id, updatedData);
  }

  Future<bool> deleteItem(int id) async {
    return await deleteRecord(id);
  }
}
