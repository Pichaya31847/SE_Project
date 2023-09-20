class Selectin{
  int? id;
  String? id_quest;
  String? Questheader;
  String? QuestDetail;
  String? QuestOwner;
  String? DateEnd;
  String? NamepersonWhoSelect;

  Selectin({this.id,this.id_quest,this.Questheader,this.QuestDetail,this.QuestOwner,this.DateEnd,this.NamepersonWhoSelect});

  Selectin.fromJson(Map<String,dynamic> json){
    id = json["id"];
    id_quest = json["id_quest"];
    Questheader = json["Questheader"];
    QuestDetail = json["QuestDetail"];
    QuestOwner = json["QuestOwner"];
    DateEnd = json["DateEnd"];
    NamepersonWhoSelect = json["NamepersonWhoSelect"];
  }
}