import 'package:sqflite/sqflite.dart';
import 'package:businessy/database/db_helper.dart';

class DBBaseTable {
  var db_table = 'TABLE_NAME_MUST_OVERRIDE';

  // Insert a new record
  Future<bool> insertRecord(Map<String, dynamic> data) async {
    try {
      final database = await DBHelper.getDatabase();
      await database.insert(db_table, data,
          conflictAlgorithm: ConflictAlgorithm.replace);
      return true;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false;
  }

  // Get all records in the table
  Future<List<Map<String, dynamic>>> getRecords() async {
    try {
      final database = await DBHelper.getDatabase();
      var data = await database.rawQuery("SELECT * FROM $db_table ORDER BY id DESC");
      return data;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return [];
  }

  // Get a specific record by ID
  Future<Map<String, dynamic>?> getRecordById(int id) async {
    try {
      final database = await DBHelper.getDatabase();
      var data = await database.query(db_table,
          where: 'id = ?', whereArgs: [id], limit: 1);
      if (data.isNotEmpty) {
        return data.first;
      }
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return null;
  }

  // Update a record by ID
  Future<bool> updateRecord(int id, Map<String, dynamic> updatedData) async {
    try {
      final database = await DBHelper.getDatabase();
      var result = await database.update(db_table, updatedData,
          where: 'id = ?', whereArgs: [id]);
      return result > 0;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false;
  }

  // Delete a record by ID
  Future<bool> deleteRecord(int id) async {
    try {
      final database = await DBHelper.getDatabase();
      var result = await database.delete(db_table,
          where: 'id = ?', whereArgs: [id]);
      return result > 0;
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false;
  }

}
