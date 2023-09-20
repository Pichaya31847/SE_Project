import 'Preparedata/QuestOn.dart';
import 'Repository/RepositoryQuest.dart';

class inputquest{
  Repository_quest _repository = Repository_quest();

  savequest(Queston quest)async{
    return await _repository.insertData('QuestList2', quest.questmap());
  }

  createusertb(Queston quest)async{
    await _repository.createDatatb('QuestList2', quest.questmap());
    var questdel = "123456789";
    return await _repository.DeleteQuest(questdel);

  }

  searchQuest(String Searchtxt,String userName)async{
    return await _repository.queryQuest(Searchtxt, userName);
  }

  showQuest(String idQuest)async{
    return await _repository.showsQuest(idQuest);
  }

  delQuest(String idQuest)async{
    return await _repository.delsQuest(idQuest);
  }

  editQuest(String id, String questHeader, String questDetail,String questTargetGroup, String dateEnd)async{
    return await _repository.editsQuest(id, questHeader, questDetail, questTargetGroup, dateEnd);
  }

  ShowIndexQuest(String status, String questOwner)async{
    return await _repository.ShowsIndexQuest(status,questOwner);
  }
}