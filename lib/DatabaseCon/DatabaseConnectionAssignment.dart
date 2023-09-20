
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection_Assignment {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_AssignmentDBLast');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    await database.execute(
        "CREATE TABLE AssignmentDBLast(id INTEGER PRIMARY KEY AUTOINCREMENT,QuestHeader TEXT,QuestDetail TEXT,QuestOwner TEXT,NamepersonWhoSelect TEXT,Urlhomework TEXT,SendTextHomework TEXT,SentType TEXT,Score TEXT,Status INTEGER)");
  }
}
