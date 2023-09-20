import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection{
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_usernameFinal');
    var database = await openDatabase(path, version: 1,onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database,int version) async{
    await database.execute("CREATE TABLE usernames_memberFinal(id INTEGER PRIMARY KEY,username TEXT, password TEXT,student TEXT,EmailUser TEXT)");
  }
}