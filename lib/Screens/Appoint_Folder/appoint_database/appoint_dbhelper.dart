
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pro_visitor/Screens/Appoint_Folder/appoint_models/appoint_data.dart';

class AppointDatabase {
  static final AppointDatabase instance = AppointDatabase._init();

  static Database? _database;

  AppointDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('appointments.db');
    return _database!;
  }

  Future<Database> _initDB(String appointment) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, appointment);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    //final integerType = 'INTEGER NOT NULL';

    await db.execute('''
      CREATE TABLE $AppointTable (
        ${AppointFields.id} $idType,
        ${AppointFields.name} $textType,
        ${AppointFields.contact} $textType,
        ${AppointFields.datetime} $textType,
        ${AppointFields.reason} $textType
      )
  ''');
  }

  Future<Appoint_Data> create(Appoint_Data appointData) async {
    final db = await instance.database;

    // final json = note.toJson();
    //final columns =
    //     '${AppointFields.name}, ${AppointFields.contact}, ${AppointFields.datetime}, ${AppointFields.reason}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    //final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(AppointTable, appointData.toMap());
    return appointData.copy(id: id);
  }

  Future<Appoint_Data> readAppoints(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      AppointTable,
      columns: AppointFields.values,
      where: '${AppointFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Appoint_Data.fromMap(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Appoint_Data>> readAllAppoints() async {
    final db = await instance.database;

    //final orderBy = '${AppointFields.id} ASC';
    //final result =
    //     await db.rawQuery('SELECT * FROM $AppointTable ORDER BY $orderBy');

    final result = await db.query(AppointTable);

    return result.map((map) => Appoint_Data.fromMap(map)).toList();
  }

  Future<int> update(Appoint_Data note) async {
    final db = await instance.database;

    return db.update(
      AppointTable,
      note.toMap(),
      where: '${AppointFields.id} = ?',
      whereArgs: [note.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      AppointTable,
      where: '${AppointFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}