import 'Preparedata/Scoreon.dart';
import 'Repository/RepositoryScore.dart';

class inputScore{
  RepositoryScore _RepositoryScore = RepositoryScore();

  saveScore(Scoreon regis)async{
    return await _RepositoryScore.insertData('ScoreDB', regis.usermap());
  }

  CheckScore(String username)async{
    return await _RepositoryScore.ChecksScore(username);
  }

  ScoreEnd(String Score ,String id)async{
    return await _RepositoryScore.ScoresEnd(Score,id);
  }

  ShowScore()async{
    return await _RepositoryScore.ShowScore();
  }
}