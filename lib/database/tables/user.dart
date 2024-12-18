import 'package:businessy/database/base_db.dart';
import 'package:businessy/database/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class UserTable extends DBBaseTable {
  @override
  var db_table = 'user';
  static Map<String, dynamic>? currentUser;

  // Insert a new user (Registration)
  Future<bool> insertUser(Map<String, dynamic> userData) async {
    try {
      final database = await DBHelper.getDatabase();
      await database.insert(db_table, userData,
          conflictAlgorithm: ConflictAlgorithm.replace);
      return true; // Success
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false; // Failure
  }



  // Validate user credentials and fetch user data
  Future<bool> login(String email, String password) async {
    try {
      final database = await DBHelper.getDatabase();
      
      // Query to validate user and fetch their data
      var result = await database.rawQuery(
          "SELECT * FROM $db_table WHERE email = ? AND password = ? LIMIT 1", [email, password]);

      if (result.isNotEmpty) {
        currentUser = result.first; // Store user data in memory
        return true; // Login successful
      }
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false; // Login failed
  }

  // Fetch current user profile data
  Map<String, dynamic>? getProfileData() {
    return currentUser;
  }

  // Update user profile data
  Future<bool> updateUser(Map<String, dynamic> updatedData) async {
    try {
      final database = await DBHelper.getDatabase();
      int result = await database.update(
          db_table, updatedData, where: 'id = ?', whereArgs: [currentUser?['id']]);

      if (result > 0) {
        currentUser = {...currentUser!, ...updatedData}; // Update cached data
        return true; // Update successful
      }
    } catch (e, stacktrace) {
      print('$e --> $stacktrace');
    }
    return false; // Update failed
  }
}







