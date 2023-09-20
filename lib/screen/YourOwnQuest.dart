import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_se_new/Preparedata/ListUser.dart';
import 'package:project_se_new/Preparedata/QuestIn.dart';
import 'package:project_se_new/screen/CreateNewsQuest.dart';
import '../inputquest.dart';
import 'FullQuestPage.dart';

class YourOwnQuest extends StatefulWidget {
  @override
  State<YourOwnQuest> createState() => _YourOwnQuestState();
}

class _YourOwnQuestState extends State<YourOwnQuest> {
  String inputSearch = "";
  List<Questin> LoadResult = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    if (Log_User[1] == '1') {
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: const Text('ไอดีนี้ไม่มีสิทธ์การเข้าถึงหน้านี้'),
        action: SnackBarAction(
          label: 'ปิด',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
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
                      "YOUR QUEST",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    ),
                  ],
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
                      height: MediaQuery
                          .of(context)
                          .size
                          .height - 300.0,
                      child: ListView.builder(
                          itemCount: LoadResult.length,
                          itemBuilder: (BuildContext context, int index) {
                            return _BuildQuestIteam(
                                LoadResult[index].QuestHeader.toString(),
                                LoadResult[index].DateEnd.toString(),
                                LoadResult[index].id.toString());
                          }),
                    )
                  ],
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(
                Icons.add_box
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CreateNewsQuest();
              }));
            },
          ),
        ),
      ),
    );
  }

  Widget _BuildQuestIteam(String questHeader, String dateEnd, String id) {
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FullQuestPage(id: id),
              ));
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
    var _inputquest = inputquest();
    final List<Map<String, dynamic>> queryResult = await _inputquest
        .searchQuest(inputSearch, ownername);
    setState(() {
      LoadResult = queryResult.map((e) => Questin.fromJson(e)).toList();
    });
  }
}
