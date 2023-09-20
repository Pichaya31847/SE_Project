import 'package:path/path.dart';

class useron{
  int? id;
  String? username_user;
  String? status_user;

  usermaplog(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['username'] = username_user;
    mapping['status_user'] = status_user;

    return  mapping;
  }
}