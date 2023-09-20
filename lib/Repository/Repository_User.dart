import 'package:sqflite/sqflite.dart';
import '../DatabaseCon/DatabaseConnection_log.dart';
import '../Preparedata/ListUser.dart';

class Repository_user{
  DatabaseConnection_log _databaseConnection = DatabaseConnection_log();
  static Database?_database;

  Future<Database> get database async{
    if(_database != null) return _database!;
    _database = await _databaseConnection.setDatabase();
    return _database!;
  }

  saveuserlog(String username_logs, String status_logs)async{
    var dbClient = await database;
    var reslogs = await dbClient.rawQuery("INSERT INTO Log_usernames (username, status_user) VALUES ('$username_logs', '$status_logs')");
    return reslogs;
  }

  getLoginUserlog() async {
    var dbClient = await database;
    var reslog = await dbClient.rawQuery("SELECT * FROM Log_usernames");
    if(reslog.length < 1){
      return "1";
    }else{
      print(reslog);
      userlogs.add(reslog[0]);
      final List<String> strs = userlogs.map((e) => e.toString()).toList();
      var strss = strs.toString();
      const start = "username: ";
      const end = ", status_user";
      final startIndex = strss.indexOf(start);
      final endIndex = strss.indexOf(end, startIndex + start.length);
      final username_log = strss.substring(startIndex + start.length, endIndex);
      const startst = "status_user: ";
      const endst = "}";
      final startIndexst = strss.indexOf(startst);
      final endIndexst = strss.indexOf(endst, startIndexst + startst.length);
      final username_logst = strss.substring(startIndexst + startst.length, endIndexst);
      Log_User.add(username_log);
      Log_User.add(username_logst);
      userlogs = [];
      print("รายชื่อกับสถานะที่โหลด" + Log_User.toString());
      return "2";
    }}

  getcheckUser(String userId)async {
    var dbClient = await database;
    var res = await dbClient.rawQuery("SELECT * FROM Log_usernames WHERE "
        "username = '$userId' ");
    if(res.length > 0){
      return "1";
    }else{
      return "2";
    }}

  createDatatb(table, data) async{
    var conection = await database;
    return await conection.insert(table, data);
  }

  DeleteUser(String userId)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery("DELETE FROM Log_usernames WHERE username = '$userId'");
    return res;
  }

  DeleteUserlog(String userId)async{
    var dbClient = await database;
    var res = await dbClient.rawQuery("DELETE FROM Log_usernames");
    return 1;
  }

}