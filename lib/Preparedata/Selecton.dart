class Selecton{
  int? id;
  String? id_quest;
  String? Questheader;
  String? QuestDetail;
  String? QuestOwner;
  String? DateEnd;
  String? NamepersonWhoSelect;

  selectmap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['id_quest'] = id_quest;
    mapping['Questheader'] = Questheader;
    mapping['QuestDetail'] = QuestDetail;
    mapping['QuestOwner'] = QuestOwner;
    mapping['DateEnd'] = DateEnd;
    mapping['NamepersonWhoSelect'] = NamepersonWhoSelect;
    return mapping;
  }

}