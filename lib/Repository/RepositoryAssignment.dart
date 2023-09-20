
import 'package:sqflite/sqflite.dart';

import '../DatabaseCon/DatabaseConnectionAssignment.dart';

class Repository_Assignment {
  DatabaseConnection_Assignment _databaseConnection = DatabaseConnection_Assignment();
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


  delSelect(String id)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery("DELETE FROM AssignmentDBLast WHERE id LIKE '%$id%'");
    return res;
  }

  querysameOrNot(String questID, String NamepersonWhoSelect)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM AssignmentDBLast WHERE QuestHeader LIKE '$questID' AND QuestOwner LIKE '$NamepersonWhoSelect'");
    return res;
  }

  searchsQuest(String inputSearch,String ownername)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM AssignmentDBLast WHERE QuestHeader LIKE '%$inputSearch%' AND QuestOwner LIKE '$ownername' AND Status = '0'");
    return res;
  }

  showAssigns(String idAssignment)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM AssignmentDBLast WHERE id LIKE '$idAssignment' AND Status = '0'");
    return res;
  }

  GivesScore(String score ,String id)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "UPDATE AssignmentDBLast SET Score = '$score',Status = '1' WHERE id = '$id'");
    return res;
  }

  showsWaitScore(String nameSent)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM AssignmentDBLast WHERE NamepersonWhoSelect LIKE '$nameSent' AND Status = '0'");
    return res;
  }

  showsFinalScore(String nameSent)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM AssignmentDBLast WHERE NamepersonWhoSelect LIKE '$nameSent' AND Status = '1'");
    return res;
  }

  querysResultEnD(String idAssignment)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM AssignmentDBLast WHERE id LIKE '$idAssignment'");
    return res;
  }
}
