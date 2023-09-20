import 'package:flutter/material.dart';

import '../Preparedata/ListUser.dart';
import '../Repository/Repository_User.dart';
import 'leaderboard.dart';
import 'login.dart';

class settings extends StatefulWidget {
  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {
  Future logout() async {
    Repository_user _repository_user = Repository_user();
    var sta = await _repository_user.DeleteUserlog(Log_User[0]);
    if (sta == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return login();
      }));
      Log_User = [];
      userlogs = [];
      print(Log_User);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Setting', textAlign: TextAlign.center),
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              //โปรไฟล์
              Container(
                child: Card(
                  elevation: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: Colors.greenAccent, width: 5))),
                    child: ListTile(
                      title: Text("Profile"),
                      leading: Icon(Icons.person),
                      onTap: () {
                        CallBack();
                      },
                    ),
                  ),
                ),
              ),
              if(Log_User[1] == "5")
                Container(
                  child: Card(
                    elevation: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: Colors.greenAccent, width: 5))),
                      child: ListTile(
                        title: Text("Leader board"),
                        leading: Icon(Icons.leaderboard),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return leaderboard();
                          }));
                        },
                      ),
                    ),
                  ),
                ),
              //ออกจากระบบ
              Container(
                child: Card(
                  elevation: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: Colors.greenAccent, width: 5))),
                    child: ListTile(
                      title: Text("Logout"),
                      leading: Icon(Icons.logout),
                      onTap: () {
                        logout();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  CallBack(){
    final snackBar = SnackBar(
      content: const Text('หน้านี้ยังไม่เปิดให้ใช้งานกรุณารอเวอร์ชั้นหน้า'),
      action: SnackBarAction(
        label: 'ปิด',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
