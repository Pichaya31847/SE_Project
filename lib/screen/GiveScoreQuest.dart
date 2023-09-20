import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_se_new/screen/GiveScoreAssignment.dart';

import '../Preparedata/Assignmentin.dart';
import '../Preparedata/ListUser.dart';
import '../inputAssignment.dart';
import 'CreateNewquest.dart';
import 'YourOwnQuest.dart';

class GiveScoreQuest extends StatefulWidget {
  const GiveScoreQuest({Key? key}) : super(key: key);

  @override
  State<GiveScoreQuest> createState() => _GiveScoreQuestState();
}

class _GiveScoreQuestState extends State<GiveScoreQuest> {
  String inputSearch = "";
  List<Assignmentin> LoadResultAss = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: Scaffold(
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Text(
                    "GIVE SCORE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: "SEARCH"),
                    onChanged: (String value) {
                      inputSearch = value;
                      setState(() {
                        fetchData();
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 200.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(75.0),
                        bottomRight: Radius.circular(75.0))),
                child: ListView(
                  padding: EdgeInsets.only(left: 25.0, right: 20.0),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height - 300.0,
                      child: ListView.builder(
                          itemCount: LoadResultAss.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _BuildQuestIteamAss(
                              LoadResultAss[index].QuestHeader.toString(),
                              LoadResultAss[index].NamepersonWhoSelect.toString(),
                              LoadResultAss[index].id.toString(),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  child: Icon(
                      Icons.dns
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return YourOwnQuest();
                    }));
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                FloatingActionButton(
                  child: Icon(
                      Icons.add_box
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return CreateNewQuest();
                    }));
                  },
                )
              ]
          ),
        ),

      ),
    );
  }

  fetchData() async {
    String ownername = Log_User[0];
    var _inputAssignment = inputAssignment();
    final List<Map<String, dynamic>> queryResultSelect =
    await _inputAssignment.searchQuest(inputSearch, ownername);
    setState(() {
      LoadResultAss =
          queryResultSelect.map((e) => Assignmentin.fromJson(e)).toList();
    });
  }

  Widget _BuildQuestIteamAss(String questHeader,String NamepersonWhoSelect,String id) {
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
                return GiveScoreAssignment(id:id);
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
                      "ชื่อคนส่ง :" + NamepersonWhoSelect,
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
