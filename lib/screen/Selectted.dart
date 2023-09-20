import 'package:flutter/material.dart';

import '../Dialog/SelectDialog.dart';
import '../Preparedata/ListUser.dart';
import '../Preparedata/Selectin.dart';
import '../inputSelect.dart';

class Selectted extends StatefulWidget {
  @override
  State<Selectted> createState() => _SelecttedState();
}

class _SelecttedState extends State<Selectted> {
  String inputSearch = "";
  List<Selectin> LoadResultSelect = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
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
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 0.0),
                  child: Text(
                    "YOUR SELECT QUEST",
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
                          itemCount: LoadResultSelect.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _BuildQuestIteam(
                              LoadResultSelect[index].Questheader.toString(),
                              LoadResultSelect[index].QuestDetail.toString(),
                              LoadResultSelect[index].DateEnd.toString(),
                              LoadResultSelect[index].QuestOwner.toString(),
                              LoadResultSelect[index].id.toString(),
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

  Widget _BuildQuestIteam(String questHeader,String QuestDetail, String dateEnd,String QuestOwner, String id) {
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
              showDialog(context: context, builder: (context) => SelectDialog(id:id,questHeader:questHeader,QuestDetail:QuestDetail,dateEnd:dateEnd,QuestOwner:QuestOwner));
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
                      "วันที่หมดเวลา " + dateEnd,
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

  fetchData() async {
    String ownername = Log_User[0];
    var _inputselect = inputselect();
    final List<Map<String, dynamic>> queryResultSelect =
        await _inputselect.searchQuest(inputSearch, ownername);
    setState(() {
      LoadResultSelect =
          queryResultSelect.map((e) => Selectin.fromJson(e)).toList();
    });
  }
}

