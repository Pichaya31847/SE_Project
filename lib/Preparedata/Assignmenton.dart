class Assignmenton{
  int? id;
  String? QuestHeader;
  String? QuestDetail;
  String? QuestOwner;
  String? NamepersonWhoSelect;
  String? Urlhomework;
  String? SendTextHomework;
  String? SentType;
  String? Score;
  String? Status;

  Assignmentonmap(){
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['QuestHeader'] = QuestHeader;
    mapping['QuestDetail'] = QuestDetail;
    mapping['QuestOwner'] = QuestOwner;
    mapping['NamepersonWhoSelect'] = NamepersonWhoSelect;
    mapping['Urlhomework'] = Urlhomework;
    mapping['SendTextHomework'] = SendTextHomework;
    mapping['SentType'] = SentType;
    mapping['Score'] = Score;
    mapping['Status'] = Status;
    return mapping;
  }

}