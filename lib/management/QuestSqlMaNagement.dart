import 'dart:async';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';

class SqlliteManage {
  final String _databaseName = "Quest.db";
  final int _databaseVersion = 1;

  final String _createSQL =
      "CREATE TABLE QuestList(id INTEGER PRIMARY KEY AUTOINCREMENT,QuestHeader TEXT,QuestDetail TEXT,QuestTargetGroup TEXT,DateCreate TEXT,DateEnd TEXT,QuestOwner TEXT)";

  String? createSQLCommand;
  String? databasePath;
  String? dbPath;
  Database? _database;

  void OpenOrCreateDatabase() async {
    createSQLCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath!, _databaseName);
    _database = await openDatabase(dbPath!,
        version: _databaseVersion, onCreate: createDatabase);
  }

  Future<void> createDatabase(Database db, int version) async {
    if (createSQLCommand != "") {
      await db.execute(createSQLCommand!);
    }
  }

  Future<List<Map<String, dynamic>>> queryDataBase(String sqlString)async{
    createSQLCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath!, _databaseName);
    _database = await openDatabase(dbPath!,
        version: _databaseVersion, onCreate: createDatabase);
    return await _database!.rawQuery(sqlString);
  }

  Future<int> insertDataBase(String sqlString)async{
    createSQLCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath!, _databaseName);
    _database = await openDatabase(dbPath!,
        version: _databaseVersion, onCreate: createDatabase);
    return await _database!.rawInsert(sqlString);
  }

  Future<int> updateDataBase(String sqlString)async{
    createSQLCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath!, _databaseName);
    _database = await openDatabase(dbPath!,
        version: _databaseVersion, onCreate: createDatabase);
    return await _database!.rawUpdate(sqlString);
  }

  Future<int> deleteDataBase(String sqlString)async{
    createSQLCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath!, _databaseName);
    _database = await openDatabase(dbPath!,
        version: _databaseVersion, onCreate: createDatabase);
    return await _database!.rawDelete(sqlString);
  }

  void CloseDataBase()async{
    createSQLCommand = _createSQL;
    databasePath = await getDatabasesPath();
    dbPath = join(databasePath!, _databaseName);
    _database = await openDatabase(dbPath!,
        version: _databaseVersion, onCreate: createDatabase);
    return _database!.close();
  }

}
