import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const databaseName = "Businessy.db";
  static const databaseVersion = 1;
  static Database? _database;

  static Future<Database> getDatabase() async {
     if (_database != null) {
      return _database!;
    }
    
    _database=await openDatabase(
      join(await getDatabasesPath(), databaseName),
      version: databaseVersion,
      onUpgrade: (db, oldVersion, newVersion) {
        //do nothing...
      },
      onCreate: (db, version) async {
         await db.execute('PRAGMA foreign_keys = ON');
        // Create tables
       // User Table
        await db.execute('''
          CREATE TABLE user (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             first_name TEXT,
             last_name TEXT,
             birthdate TEXT,
             phone_number TEXT,
             email TEXT,
             password TEXT,
             business_name TEXT,
             launch_date TEXT,
             actual_balance REAL,
             type_of_selling TEXT, -- Goods or Services
             logo TEXT
          )
        ''');

        //category of an item :
        await db.execute('''
          CREATE TABLE category (
             id INTEGER PRIMARY KEY AUTOINCREMENT,
             name TEXT
             )
        ''');
       

        // Item Table: Each item belongs to a user
         await db.execute('''
          CREATE TABLE item (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price REAL,
            quantity INTEGER,
            item_image TEXT,
            category_id INTEGER,
            user_id INTEGER,
<<<<<<< HEAD
            FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE CASCADE,
            FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
=======
            FOREIGN KEY (category_id) REFERENCES category (id) ON DELETE CASCADE
>>>>>>> 6012124136260cfbc70a3af03cc305feb6b05a81
          )
        ''');

        // Variants Table: Each variant belongs to one item
        await db.execute('''
          CREATE TABLE variants (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            price REAL,
            item_id INTEGER,
            quantity INTEGER,
            FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE CASCADE
          )
        ''');

        // Expense Table: Each expense is linked to an item and user
        await db.execute('''
          CREATE TABLE expense (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            amount REAL,
            type TEXT,
            item_id INTEGER,
            user_id INTEGER,
<<<<<<< HEAD
            FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE CASCADE,
            FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
=======
            FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE CASCADE
>>>>>>> 6012124136260cfbc70a3af03cc305feb6b05a81
          )
        ''');

        // Income Table: Each income is linked to an item and user
        await db.execute('''
          CREATE TABLE income (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT,
            item_id INTEGER,
            user_id INTEGER,
<<<<<<< HEAD
            FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE CASCADE,
            FOREIGN KEY (user_id) REFERENCES user (id) ON DELETE CASCADE
=======
            FOREIGN KEY (item_id) REFERENCES item (id) ON DELETE CASCADE
>>>>>>> 6012124136260cfbc70a3af03cc305feb6b05a81
          )
        ''');

        // History Table: Related to expenses
        await db.execute('''
          CREATE TABLE history (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            expense_id INTEGER,
            date TEXT,
            FOREIGN KEY (expense_id) REFERENCES expense (id) ON DELETE CASCADE
          )
        ''');
      },
    );
    return _database!;
  }
}

