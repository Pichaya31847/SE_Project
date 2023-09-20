import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection_quest{
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_quest');
    var database = await openDatabase(path, version: 1,onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database,int version) async{
    await database.execute("CREATE TABLE QuestList2(id INTEGER PRIMARY KEY AUTOINCREMENT,QuestHeader TEXT,QuestDetail TEXT,QuestTargetGroup TEXT,DateCreate TEXT,DateEnd TEXT,QuestOwner TEXT)");
  }
}