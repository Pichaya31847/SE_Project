import 'Repository/Repository_User.dart';
import 'Preparedata/UserOn.dart';

class inputuser{
  Repository_user _repository_user = Repository_user();

  createuserlogtb(useron regis)async{
    await _repository_user.createDatatb('Log_usernames', regis.usermaplog());
    var userdel = "test1";
    print("สร้างตารางLOG");
    return await _repository_user.DeleteUser(userdel);
  }

  CheckUserLog()async{
    return await _repository_user.getLoginUserlog();
  }
}