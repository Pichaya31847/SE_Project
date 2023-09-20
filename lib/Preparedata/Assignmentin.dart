class Assignmentin{
  int? id;
  String? QuestHeader;
  String? QuestDetail;
  String? QuestOwner;
  String? NamepersonWhoSelect;
  String? Urlhomework;
  String? SendTextHomework;
  String? SentType;
  String? Score;

  Assignmentin({this.id,this.QuestHeader,this.QuestDetail,this.QuestOwner,this.NamepersonWhoSelect,this.Urlhomework,this.SendTextHomework,this.SentType,this.Score});

  Assignmentin.fromJson(Map<String,dynamic> json){
    id = json["id"];
    QuestHeader = json["QuestHeader"];
    QuestDetail = json["QuestDetail"];
    QuestOwner = json["QuestOwner"];
    NamepersonWhoSelect = json["NamepersonWhoSelect"];
    Urlhomework = json["Urlhomework"];
    SendTextHomework = json["SendTextHomework"];
    SentType = json["SentType"];
    Score = json["Score"];
  }
}