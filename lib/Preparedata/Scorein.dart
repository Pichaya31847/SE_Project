class Scorein{
  int? id;
  String? username;
  String? Score;

  Scorein({this.id,this.username,this.Score});

  Scorein.fromJson(Map<String,dynamic> json){
    id = json["id"];
    username = json["username"];
    Score = json["Score"];
  }
}