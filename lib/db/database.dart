import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const dbName = "visitloglocal.db";
  static const dbVersion = 1;

  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();
  static Database? _database;

  Future<Database> get getDatabase async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  static _initDatabase() async {
    // final directory = await getApplicationDocumentsDirectory();
    String path = join(await getDatabasesPath(), dbName);

    if (!(await databaseExists(path))) {
      ByteData data = await rootBundle.load(join("assets/DBLocal", dbName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(path).writeAsBytes(bytes);
      // print('database copied');

    }
    return await openDatabase(path, version: dbVersion);
  }

  static Future<List<Map<String, dynamic>>> queryAll(String tbName) async {
    Database db = await instance.getDatabase;
    return await db.query(tbName);
  }

  static Future<List<Map<String, dynamic>>> querySearch(
      String tbName, String w, List wa) async {
    Database db = await instance.getDatabase;
    return await db.query(tbName, where: w, whereArgs: [wa]);
  }

  static Future<List<Map<String, dynamic>>> querySpecific(String query) async {
    Database db = await instance.getDatabase;
    return await db.rawQuery(query);
  }

  static Future<int> insertData(String table, Map<String, dynamic> row) async {
    Database db = await instance.getDatabase;
    return db.insert(table, row);
  }

  static Future<int> updateData(
      String table, Map<String, dynamic> row, String w, List wa) async {
    Database db = await instance.getDatabase;
    return db.update(table, row, where: w, whereArgs: [wa]);
  }

  static Future<int> deleteData(String table, String w, List wa) async {
    Database db = await instance.getDatabase;
    return db.delete(table, where: w, whereArgs: wa);
  }
}
