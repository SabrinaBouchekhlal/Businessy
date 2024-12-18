import 'package:sqflite/sqflite.dart';
import 'package:businessy/database/base_db.dart';
import 'package:businessy/database/db_helper.dart';

class VariantTable extends DBBaseTable {
  @override
  var db_table = 'variant';

  Future<bool> insertVariant(Map<String, dynamic> data) async {
    return await insertRecord(data);
  }

  Future<List<Map>> getVariantsByItem(int itemId) async {
    final database = await DBHelper.getDatabase();
    return await database.query(db_table,
        where: 'item_id = ?', whereArgs: [itemId]);
  }

  Future<bool> updateVariant(int id, Map<String, dynamic> updatedData) async {
    return await updateRecord(id, updatedData);
  }

  Future<bool> deleteVariant(int id) async {
    return await deleteRecord(id);
  }
}
