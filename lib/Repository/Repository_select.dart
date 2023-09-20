import 'package:sqflite/sqflite.dart';

import '../DatabaseCon/DatabaseConnection_select.dart';

class Repository_select {
  DatabaseConnection_select _databaseConnection = DatabaseConnection_select();
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _databaseConnection.setDatabase();
    return _database!;
  }

  insertData(table, data) async {
    var conection = await database;
    return await conection.insert(table, data);
  }

  querysameOrNot(String questID, String NamepersonWhoSelect)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM SelectQuestList WHERE id_quest LIKE '$questID' AND NamepersonWhoSelect LIKE '$NamepersonWhoSelect'");
    return res;
  }

  queryQuest(String Searchtxt, String userName) async {
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM SelectQuestList WHERE QuestHeader LIKE '%$Searchtxt%' AND NamepersonWhoSelect LIKE '$userName'");
    return res;
  }

  showQuest(String id, String userName) async {
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM SelectQuestList WHERE id LIKE '%$id%' AND NamepersonWhoSelect LIKE '$userName'");
    return res;
  }

  delSelect(String id)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery("DELETE FROM SelectQuestList WHERE id LIKE '%$id%'");
    return res;
  }
}
