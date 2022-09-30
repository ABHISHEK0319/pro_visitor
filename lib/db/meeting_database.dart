import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const _databaseName = "MeetingDatabase.db";
  static const _databaseVersion = 1;
  static const table = 'meeting_table';
  static const columnId = 'meet_id';
  static const columnTitle = 'meet_title';
  static const columnTime = 'meet_time';
  static const columnDate = 'meet_date';
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  DatabaseHelper._privateConstructor();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  // factory DatabaseHelper() {
  //   return _databaseHelper;
  // }
  // Future<void> initDB() async {
  //   String path = await getDatabasesPath();
  //   db = await openDatabase(
  //     join(path, 'users_demo.db'),
  //     onCreate: (database, version) async {
  //       await database.execute(
  //         """
  //           CREATE TABLE users (
  //             id INTEGER PRIMARY KEY AUTOINCREMENT,
  //             name TEXT NOT NULL,
  //             age INTEGER NOT NULL,
  //             email TEXT NOT NULL
  //           )
  //         """,
  //       );
  //     },
  //     version: 1,
  //   );
  // }

  Future<Database> initDb() async {
    final directory = await getDatabasesPath();
    String path = join(directory, _databaseName);

    if (!(await databaseExists(path))) {
      ByteData data =
          await rootBundle.load(join("assets/DBLocal", _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      print('database copied');
    }

    return await openDatabase(path, version: _databaseVersion);

// List<UserMeetingData> itemData= [];
//     String result = await SqlConn.readData("SELECT * FROM Meeting_Record where meetId = "$MeetId"");
//     List data = json.decode(result);
//     itemData.clear();
//     for(int i = 0; i < data.length; i++){
//       itemData.add(UserMeetingData(title: title, time: time, date: date))
//     }
  }

  // Future _onCreate(Database db, int version) async {
  //   await db.execute('''
  //         CREATE TABLE $table (
  //           $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
  //           $columnTitle TEXT NOT NULL,
  //           $columnTime TEXT NOT NULL,
  //           $columnDate TEXT NOT NULL
  //         )
  //         ''');
  // }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    var result = await db.query(table);
    return result.toList();
  }

  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
