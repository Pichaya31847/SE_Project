import 'package:flutter/material.dart';

import '../Preparedata/Scorein.dart';
import '../inputScore.dart';

class leaderboard extends StatefulWidget {

  @override
  State<leaderboard> createState() => _leaderboardState();
}

class _leaderboardState extends State<leaderboard> {
  List<String> name = ["studet01","pichaya","student2"];
  List<Scorein> LoadResultScore = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataWait();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          body: ListView(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 25.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    SizedBox(
                        width: 180
                    ),
                    Text(
                      "LEADERBOARD",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height - 200.0,
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
                          itemCount: LoadResultScore.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _BuildQuestIteamWait(
                              index,
                              LoadResultScore[index].username.toString(),
                              LoadResultScore[index].Score.toString(),
                            );
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  fetchDataWait()async{
    var _inputScore = inputScore();
    final List<Map<String, dynamic>> queryResultScore =
    await _inputScore.ShowScore();
    print(queryResultScore);
    setState(() {
      LoadResultScore =
          queryResultScore.map((e) => Scorein.fromJson(e)).toList();
    });
    print(LoadResultScore[0].username);

  }

  Widget _BuildQuestIteamWait(int id,String NamepersonWhoSelect,String Score) {
    id = id + 1;
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.2, color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 40,
              child: FittedBox(
                child: Text(id.toString()),
              ),
            ),
            title: Text(NamepersonWhoSelect),
            trailing: Text(Score),
          ),
        ),
      ),
    );
  }
}
