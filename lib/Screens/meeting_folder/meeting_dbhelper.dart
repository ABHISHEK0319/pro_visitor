import 'package:path/path.dart';
import 'package:pro_visitor/Screens/Todo%20folder/todo_dart.dart';
import 'package:pro_visitor/Screens/meeting_folder/meet_model_dart.dart';
import 'package:sqflite/sqflite.dart';

/// NotesDatabase replace with MeetingsDatabase
class MeetingsDatabase {
  static final MeetingsDatabase instance = MeetingsDatabase._init();

  static Database? _database;

  MeetingsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('vistloglocal.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE $tableMeeting ( 
  ${MeetingFields.id} $idType, 
  ${MeetingFields.title} $textType,
  ${MeetingFields.date} $textType,
   ${MeetingFields.time} $textType,
  ${MeetingFields.myContact} $textType,
  ${MeetingFields.createdBy} $textType
  )
  ''');
  }

  Future<Meeting> create(Meeting meeting) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableMeeting, meeting.toJson());
    return meeting.copy(id: id);
  }

  Future<Meeting> readMeeting(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableMeeting,
      columns: MeetingFields.values,
      where: '${MeetingFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Meeting.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Meeting>> readAllMeeting() async {
    final db = await instance.database;

    //final orderBy = '${NoteFields.datetime} ASC';
    //final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes');

    final result = await db.query(tableNotes);

    return result.map((json) => Meeting.fromJson(json)).toList();
  }

  Future<int> update(Meeting meeting) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]},
    //        ${json[NoteFields.time]}';
    // int count = await db.rawUpdate(
    // 'UPDATE INTO table_name ($columns) VALUES ($values), WHERE name = ?');

    return db.update(
      tableMeeting,
      meeting.toJson(),
      where: '${MeetingFields.id} = ?',
      whereArgs: [meeting.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    // int count =
    //     await db.rawUpdate('DELETE FROM table_name WHERE id = ?');

    return await db.delete(
      tableMeeting,
      where: '${MeetingFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
