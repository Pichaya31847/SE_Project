import 'Preparedata/Assignmenton.dart';
import 'Repository/RepositoryAssignment.dart';

class inputAssignment{
  Repository_Assignment _repository = Repository_Assignment();

  saveSelect(Assignmenton quest)async{
    return await _repository.insertData('AssignmentDBLast', quest.Assignmentonmap());
  }

  delsSelect(String id) async{
    return await _repository.delSelect(id);
  }

  sameOrNot(String questID,String NamepersonWhoSelect)async{
    return await _repository.querysameOrNot(questID, NamepersonWhoSelect);
  }

  searchQuest(String inputSearch,String ownername)async{
    return await _repository.searchsQuest(inputSearch, ownername);
  }

  showAssign(String idAssignment)async{
    return await _repository.showAssigns(idAssignment);
  }

  GiveScore(String score ,String id)async{
    return await _repository.GivesScore(score,id);
  }

  showWaitScore(String nameSent)async{
    return await _repository.showsWaitScore(nameSent);
  }

  showFinalScore(String nameSent)async{
    return await _repository.showsFinalScore(nameSent);
  }

  queryResultEnD(String idAssignment)async{
    return await _repository.querysResultEnD(idAssignment);
  }
}