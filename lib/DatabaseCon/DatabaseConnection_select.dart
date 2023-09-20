import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection_select{
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_select');
    var database = await openDatabase(path, version: 1,onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database,int version) async{
    await database.execute("CREATE TABLE SelectQuestList(id INTEGER PRIMARY KEY AUTOINCREMENT,id_quest TEXT,Questheader TEXT,QuestDetail TEXT,QuestOwner TEXT,DateEnd TEXT,NamepersonWhoSelect TEXT)");
  }
}