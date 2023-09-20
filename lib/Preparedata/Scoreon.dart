class Scoreon{
  int? id;
  String? username_user;
  String? Score;

  usermap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['username'] = username_user;
    mapping['Score'] = Score;

    return  mapping;
  }
}