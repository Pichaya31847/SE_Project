import 'Preparedata/Selecton.dart';
import 'Repository/Repository_select.dart';

class inputselect{
  Repository_select _repository = Repository_select();

  saveSelect(Selecton quest)async{
    return await _repository.insertData('SelectQuestList', quest.selectmap());
  }

  sameOrNot(String questID,String NamepersonWhoSelect)async{
    return await _repository.querysameOrNot(questID, NamepersonWhoSelect);
  }

  searchQuest(String Searchtxt,String userName)async{
    return await _repository.queryQuest(Searchtxt, userName);
  }

  showQuest(String id,String userName)async{
    return await _repository.showQuest(id, userName);
  }

  delsSelect(String id) async{
    return await _repository.delSelect(id);
  }
}