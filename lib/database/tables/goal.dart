import 'package:sqflite/sqflite.dart';
import 'package:businessy/database/base_db.dart';
import 'package:businessy/database/db_helper.dart';

class Goal extends DBBaseTable {
  @override
  var db_table = 'goal';

  Future<bool> insertGoal(Map<String, dynamic> data) async {
    return await insertRecord(data);
  }

  Future<bool> updategoal(int id, Map<String, dynamic> updatedData) async {
    return await updateRecord(id, updatedData);
  }

  
}