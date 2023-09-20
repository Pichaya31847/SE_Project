import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection_log{
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_username_log');
    var database = await openDatabase(path, version: 1,onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database,int version) async{
    await database.execute("CREATE TABLE Log_usernames(id INTEGER PRIMARY KEY,username TEXT,status_user TEXT)");
  }
}