import 'package:sqflite/sqflite.dart';

import '../DatabaseCon/DatabaseConnectionScore.dart';

class RepositoryScore{
  DatabaseConnectionScore _databaseConnection = DatabaseConnectionScore();
  static Database?_database;

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _databaseConnection.setDatabase();
    return _database!;
  }

  insertData(table, data) async{
    var conection = await database;
    return await conection.insert(table, data);
  }

  ChecksScore(String username) async {
    var dbClient = await database;
    var result = await dbClient
        .rawQuery("SELECT * FROM ScoreDB WHERE username LIKE '$username'");
    return result;
  }

  ScoresEnd(String Score ,String id)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery(
        "UPDATE ScoreDB SET Score = '$Score' WHERE id = '$id'");
    return res;
  }

  ShowScore()async{
    var dbClient = await database;
    var result = await dbClient
        .rawQuery("SELECT * FROM ScoreDB ORDER BY Score DESC");
    return result;
  }
}