import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_se_new/Preparedata/ListUser.dart';

import '../Preparedata/Assignmentin.dart';
import '../inputAssignment.dart';
import '../screen/ShowResiveQuest.dart';

class waittingScoreQuest extends StatefulWidget {

  @override
  State<waittingScoreQuest> createState() => _waittingScoreQuestState();
}

class _waittingScoreQuestState extends State<waittingScoreQuest> {
  List<Assignmentin> LoadResultWait = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataWait();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            child: ListView(
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 300.0,
                  child: ListView.builder(
                      itemCount: LoadResultWait.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _BuildQuestIteamWait(
                          LoadResultWait[index].QuestHeader.toString(),
                          LoadResultWait[index].SendTextHomework.toString(),
                          LoadResultWait[index].id.toString(),
                        );
                      }),
                )
              ],
            ),
          );
  }

  fetchDataWait()async{
    String idAssignment = Log_User[0];
    var _inputAssignment = inputAssignment();
    final List<Map<String, dynamic>> queryResultwait =
    await _inputAssignment.showWaitScore(idAssignment);
    setState(() {
      LoadResultWait =
          queryResultwait.map((e) => Assignmentin.fromJson(e)).toList();
    });

  }

  Widget _BuildQuestIteamWait(String questHeader,String NamepersonWhoSelect,String id) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.2, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ShowResiveQuest(id:id);
              }));
            },
            child: Stack(
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      questHeader,
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "คำอธิบาย " + NamepersonWhoSelect,
                      style: TextStyle(fontSize: 17.0, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
