import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnectionScore{
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_scoreDB');
    var database = await openDatabase(path, version: 1,onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database,int version) async{
    await database.execute("CREATE TABLE ScoreDB(id INTEGER PRIMARY KEY AUTOINCREMENT,username TEXT,Score TEXT)");
  }
}