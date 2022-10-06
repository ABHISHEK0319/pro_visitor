// import 'package:path/path.dart';
// import 'package:pro_visitor/Screens/Todo%20folder/todo_dart.dart';
// import 'package:sqflite/sqflite.dart';
// import 'dart:io';
// import 'package:flutter/services.dart';

// class NotesDatabase {
//   static const dbName = "visitloglocal.db";
//   static const dbVersion = 1;
//   static final NotesDatabase instance = NotesDatabase._init();

//   static Database? _database;

//   NotesDatabase._init();

//   Future<Database> get database async {
//     if (_database != null) return _database!;

//     _database = await _initDatabase();
//     return _database!;
//   }

//   // Future<Database> _initDB(String filePath) async {
//   //   final dbPath = await getDatabasesPath();
//   //   final path = join(dbPath, filePath);

//   //   return await openDatabase(path, version: 1);
//   // }

//   static _initDatabase() async {
//     // final directory = await getApplicationDocumentsDirectory();
//     String path = join(await getDatabasesPath(), dbName);

//     if (!(await databaseExists(path))) {
//       ByteData data = await rootBundle.load(join("assets/DBLocal", dbName));
//       List<int> bytes =
//           data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
//       await File(path).writeAsBytes(bytes);
//       // print('database copied');

//     }
//     return await openDatabase(path, version: dbVersion);
//   }

// //   Future _createDB(Database db, int version) async {
// //     const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
// //     const textType = 'TEXT NOT NULL';

// //     await db.execute('''
// // CREATE TABLE $tableNotes (
// //   ${NoteFields.id} $idType,
// //   ${NoteFields.title} $textType,
// //   ${NoteFields.datetime} $textType,
// //   ${NoteFields.description} $textType
// //   )
// //   ''');
// //   }

//   Future<Note> create(Note note) async {
//     final db = await instance.database;

//     // final json = note.toJson();
//     // final columns =
//     //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
//     // final values =
//     //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
//     // final id = await db
//     //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

//     final id = await db.insert(tableNotes, note.toJson());
//     return note.copy(id: id);
//   }

//   Future<Note> readNote(int id) async {
//     final db = await instance.database;

//     final maps = await db.query(
//       tableNotes,
//       columns: NoteFields.values,
//       where: '${NoteFields.id} = ?',
//       whereArgs: [id],
//     );

//     if (maps.isNotEmpty) {
//       return Note.fromJson(maps.first);
//     } else {
//       throw Exception('ID $id not found');
//     }
//   }

//   Future<List<Note>> readAllNotes() async {
//     final db = await instance.database;

//     //final orderBy = '${NoteFields.datetime} ASC';
//     //final result =
//     //     await db.rawQuery('SELECT * FROM $tableNotes');

//     final result = await db.query(tableNotes);

//     return result.map((json) => Note.fromJson(json)).toList();
//   }

//   Future<int> update(Note note) async {
//     final db = await instance.database;

//     // final json = note.toJson();
//     // final columns =
//     //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
//     // final values =
//     //     '${json[NoteFields.title]}, ${json[NoteFields.description]},
//     //        ${json[NoteFields.time]}';
//     // int count = await db.rawUpdate(
//     // 'UPDATE INTO table_name ($columns) VALUES ($values), WHERE name = ?');

//     return db.update(
//       tableNotes,
//       note.toJson(),
//       where: '${NoteFields.id} = ?',
//       whereArgs: [note.id],
//     );
//   }

//   Future<int> delete(int id) async {
//     final db = await instance.database;

//     // int count =
//     //     await db.rawUpdate('DELETE FROM table_name WHERE id = ?');

//     return await db.delete(
//       tableNotes,
//       where: '${NoteFields.id} = ?',
//       whereArgs: [id],
//     );
//   }

//   Future close() async {
//     final db = await instance.database;

//     db.close();
//   }
// }
