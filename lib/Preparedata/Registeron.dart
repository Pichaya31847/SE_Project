class registeron{
  int? id;
  String? username_user;
  String? password_user;
  String? student_id;
  String? EmailUser;

  usermap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['username'] = username_user;
    mapping['password'] = password_user;
    mapping['student'] = student_id;
    mapping['EmailUser'] = EmailUser;

    return  mapping;
  }
}