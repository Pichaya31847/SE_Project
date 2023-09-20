class Questin{
  int? id;
  String? QuestHeader;
  String? QuestDetail;
  String? QuestTargetGroup;
  String? DateCreate;
  String? DateEnd;
  String? QuestOwner;

Questin({this.id,this.QuestHeader,this.QuestDetail,this.QuestTargetGroup,this.DateCreate,this.DateEnd,this.QuestOwner});

  Questin.fromJson(Map<String,dynamic> json){
    id = json["id"];
    QuestHeader = json["QuestHeader"];
    QuestDetail = json["QuestDetail"];
    QuestTargetGroup = json["QuestTargetGroup"];
    DateCreate = json["DateCreate"];
    DateEnd = json["DateEnd"];
    QuestOwner = json["QuestOwner"];
  }

}