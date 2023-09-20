import 'package:sqflite/sqflite.dart';

import '../DatabaseCon/DatabaseConnection_Quest.dart';

class Repository_quest {
  DatabaseConnection_quest _databaseConnection = DatabaseConnection_quest();
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

  createDatatb(table, data) async {
    var conection = await database;
    return await conection.insert(table, data);
  }

  DeleteQuest(String questHeader) async {
    var dbClient = await database;
    var res = await dbClient
        .rawQuery("DELETE FROM QuestList2 WHERE QuestHeader = '$questHeader'");
    return res;
  }

  queryQuest(String Searchtxt, String userName) async {
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM QuestList2 WHERE QuestHeader LIKE '%$Searchtxt%' AND QuestOwner LIKE '$userName'");
    return res;
  }

  showsQuest(String id) async {
    var dbClient = await database;
    var result = await dbClient
        .rawQuery("SELECT * FROM QuestList2 WHERE id LIKE '%$id%'");
    return result;
  }

  delsQuest(String id) async {
    var dbClient = await database;
    var result =
        await dbClient.rawQuery("DELETE FROM QuestList2 WHERE id LIKE '%$id%'");
    return result;
  }

  editsQuest(String id, String questHeader, String questDetail,String questTargetGroup, String dateEnd) async {
    var dbClient = await database;
    var result = await dbClient.rawQuery("UPDATE QuestList2 SET QuestHeader = '$questHeader',QuestDetail = '$questDetail',QuestTargetGroup = '$questTargetGroup',DateEnd = '$dateEnd' WHERE id = '$id'");
    return result;
  }

  ShowsIndexQuest(String status ,String questOwner)async{
    var dbClient = await database;
    var result = await dbClient
        .rawQuery("SELECT * FROM QuestList2 WHERE QuestTargetGroup LIKE '$status' AND QuestOwner != '$questOwner'");
    return result;
  }
}
