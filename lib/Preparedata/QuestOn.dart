class Queston{
  int? id;
  String? QuestHeader;
  String? QuestDetail;
  String? QuestTargetGroup;
  String? DateCreate;
  String? DateEnd;
  String? QuestOwner;

  questmap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['QuestHeader'] = QuestHeader;
    mapping['QuestDetail'] = QuestDetail;
    mapping['QuestTargetGroup'] = QuestTargetGroup;
    mapping['DateCreate'] = DateCreate;
    mapping['DateEnd'] = DateEnd;
    mapping['QuestOwner'] = QuestOwner;
    return mapping;
  }

}