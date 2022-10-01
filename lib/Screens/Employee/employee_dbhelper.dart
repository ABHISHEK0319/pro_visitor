import 'package:path/path.dart';
import 'package:pro_visitor/Screens/Employee/employee_dart.dart';
import 'package:pro_visitor/Screens/Todo%20folder/todo_dart.dart';
import 'package:sqflite/sqflite.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('notes2.db');
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
CREATE TABLE $tableNotes ( 
  ${NoteFields.id} $idType, 
  ${NoteFields.title} $textType,
  ${NoteFields.datetime} $textType,
  ${NoteFields.description} $textType
  )
  ''');
  }

  Future<Employee> create(Employee emp) async {
    final db = await instance.database;

    // final json = note.toJson();
    // final columns =
    //     '${NoteFields.title}, ${NoteFields.description}, ${NoteFields.time}';
    // final values =
    //     '${json[NoteFields.title]}, ${json[NoteFields.description]}, ${json[NoteFields.time]}';
    // final id = await db
    //     .rawInsert('INSERT INTO table_name ($columns) VALUES ($values)');

    final id = await db.insert(tableEmployee, emp.toJson());
    return emp.copy(empid: id);
  }

  Future<Employee> readEmp(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableEmployee,
      columns: EmployeeFields.values,
      where: '${EmployeeFields.empid} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Employee.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Employee>> readAllEmp() async {
    final db = await instance.database;

    //final orderBy = '${NoteFields.datetime} ASC';
    //final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes');

    final result = await db.query(tableEmployee);

    return result.map((json) => Employee.fromJson(json)).toList();
  }

  Future<int> update(Employee emp) async {
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
      tableEmployee,
      emp.toJson(),
      where: '${EmployeeFields.empid} = ?',
      whereArgs: [emp.empid],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    // int count =
    //     await db.rawUpdate('DELETE FROM table_name WHERE id = ?');

    return await db.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
