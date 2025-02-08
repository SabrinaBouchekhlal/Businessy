import 'package:sqflite/sqflite.dart';
import 'package:businessy/database/base_db.dart';
import 'package:businessy/database/db_helper.dart';

class CategoryTable extends DBBaseTable {
  @override
  var db_table = 'category';

  Future<bool> insertCategory(Map<String, dynamic> data) async {
    return await insertRecord(data);
  }

  Future<List<Map<String, dynamic>>> getAllCategories() async {
    return await getRecords();
  }

  Future<bool> deleteCategory(int id) async {
    return await deleteRecord(id);
  }


 
  
}
