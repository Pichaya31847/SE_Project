
import 'Preparedata/Registeron.dart';
import 'Repository/RepositoryRegis.dart';

class inputregis{
  Repository _repository = Repository();

  saveuser(registeron regis)async{
    return await _repository.insertData('usernames_memberFinal', regis.usermap());
  }

  createusertb(registeron regis)async{
    await _repository.createDatatb('usernames_memberFinal', regis.usermap());
    var userdel = "test_student1";
    return await _repository.DeleteUser(userdel);
  }
}
