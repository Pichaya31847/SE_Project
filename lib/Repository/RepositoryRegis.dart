import 'package:sqflite/sqflite.dart';
import '../DatabaseCon/DatabaseConnectionUser.dart';
import '../Preparedata/ListUser.dart';

class Repository{
  DatabaseConnection _databaseConnection = DatabaseConnection();
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

  getLoginUser(String userId, String password) async {
    var dbClient = await database;
    var res = await dbClient.rawQuery("SELECT * FROM usernames_memberFinal WHERE "
        "username = '$userId' AND "
        "password = '$password'");
    if(res.length > 0){
      return "1";
    }else{
      return "2";
    }}

  getcheckUser(String userId, String EmailUser)async {
    var dbClient = await database;
    var res = await dbClient.rawQuery("SELECT * FROM usernames_memberFinal WHERE "
        "username = '$userId' OR EmailUser = '$EmailUser'");
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
    var res = await dbClient.rawQuery("DELETE FROM usernames_memberFinal WHERE username = '$userId'");
    return res;
  }

  checkstatusUser(String userId)async {
    var dbClient = await database;
    var res = await dbClient.rawQuery("SELECT student FROM usernames_memberFinal WHERE username = '$userId' ");
    Log_User.add(userId);
    userlogs.add(res[0]);
    final List<String> strs = userlogs.map((e) => e.toString()).toList();
    var strss = strs.toString();
    print("Check Status" + strss);
    const start = "[{student: ";
    const end = "}";
    final startIndex = strss.indexOf(start);
    final endIndex = strss.indexOf(end, startIndex + start.length);
    final username_log = strss.substring(startIndex + start.length, endIndex);
    Log_User.add(username_log);
    userlogs = [];
    return Log_User;
  }
}