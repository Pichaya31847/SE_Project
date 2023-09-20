import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Preparedata/ListUser.dart';
import '../Preparedata/QuestIn.dart';
import '../Preparedata/Selecton.dart';
import '../inputAssignment.dart';
import '../inputSelect.dart';
import '../inputquest.dart';

class QuestDetail extends StatefulWidget {
  @override
  State<QuestDetail> createState() => _QuestDetailState();
}

class _QuestDetailState extends State<QuestDetail> {
  List<Questin> LoadResult = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height - 350.0,
        width: MediaQuery.of(context).size.width - 45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75.0),
                bottomRight: Radius.circular(75.0))),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "QUEST",
                style: GoogleFonts.b612(
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                height: MediaQuery.of(context).size.height - 480.0,
                child: ListView.builder(
                    itemCount: LoadResult.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _QuestDetailIteam(
                          LoadResult[index].QuestHeader.toString(),
                          LoadResult[index].DateEnd.toString(),
                          LoadResult[index].id.toString(),
                          LoadResult[index].QuestOwner.toString(),
                          LoadResult[index].QuestDetail.toString());
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _QuestDetailIteam(String questHeader, String dateEnd, String id,
      String owner, String detailQ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.hasData != null) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.lightBlueAccent,
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1.5, color: Colors.indigo),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(75.0),
                                            bottomRight: Radius.circular(75.0),
                                            topRight: Radius.circular(75.0),
                                            bottomLeft: Radius.circular(75.0)),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'ชื่อเควส',
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SingleChildScrollView(
                                              child: Text(
                                                questHeader,
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height -
                                        520.0,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.5, color: Colors.indigo),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(75.0),
                                        bottomRight: Radius.circular(75.0),
                                        topRight: Radius.circular(75.0),
                                      ),
                                    ),
                                    child: SingleChildScrollView(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'คำอธิบาย',
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SingleChildScrollView(
                                            child: Text(
                                              detailQ,
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 1.5, color: Colors.indigo),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(75.0),
                                          bottomRight: Radius.circular(75.0),
                                          topRight: Radius.circular(75.0),
                                          bottomLeft: Radius.circular(75.0)),
                                    ),
                                    child: SingleChildScrollView(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'ผู้สร้าง :' + owner,
                                            style: TextStyle(fontSize: 22),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "วันสิ้นสุด :" + dateEnd,
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('กลับ'),
                          ),
                          TextButton(
                            onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                  'Alert',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                                content: const Text(
                                  'ยืนยันที่จะเลือกเควสนี้ไหม',
                                  style: TextStyle(fontSize: 18),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('ยกเลิก'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      ChooseQuest(id, owner, questHeader,
                                          detailQ, dateEnd);
                                    },
                                    child: const Text('ยืนยัน'),
                                  ),
                                ],
                              ),
                            ),
                            child: const Text('เลือก'),
                          ),
                        ],
                      ),
                    ),
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
                              style:
                                  TextStyle(fontSize: 17.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                  child: Text(
                "Nodata",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ));
            }
          }),
    );
  }

  fetchData() async {
    String statusPerson = Log_User[1];
    String questOwner = Log_User[0];
    var _inputquest = inputquest();
    final List<Map<String, dynamic>> queryResult =
        await _inputquest.ShowIndexQuest(statusPerson, questOwner);
    setState(() {
      LoadResult = queryResult.map((e) => Questin.fromJson(e)).toList();
    });
  }

  ChooseQuest(String id_quest, String owner, String headder, String detail,
      String endDate) async {
    var _inputselect = inputselect();
    String nameperson = Log_User[0];

    final List<Map<String, dynamic>> queryResultSelect =
        await _inputselect.sameOrNot(id_quest, nameperson);
    var _Select = Selecton();
    _Select.id_quest = id_quest;
    _Select.Questheader = headder;
    _Select.QuestDetail = detail;
    _Select.DateEnd = endDate;
    _Select.QuestOwner = owner;
    _Select.NamepersonWhoSelect = nameperson;
    if (queryResultSelect.length == 0) {
      var _inputAssignment = inputAssignment();
      final List<Map<String, dynamic>> queryResultsent =
          await _inputAssignment.sameOrNot(headder, Log_User[0]);
      if (queryResultsent.length == 0) {
        var result = await _inputselect.saveSelect(_Select);
        if (result >= 1) {
          Navigator.pop(context, "สร้างเควสสำเร็จ");
          Navigator.pop(context, "สร้างเควสสำเร็จ");
          final snackBar = SnackBar(
            content: const Text('เลือกเรียบร้อย'),
            action: SnackBarAction(
              label: 'ปิด',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          return ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } else {
        Navigator.pop(context, "สร้างเควสสำเร็จ");
        Navigator.pop(context, "สร้างเควสสำเร็จ");
        final snackBar = SnackBar(
          content: const Text('คุณได้ทำการเลือกเควสนี้ไปแล้ว'),
          action: SnackBarAction(
            label: 'ปิด',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      Navigator.pop(context, "สร้างเควสสำเร็จ");
      Navigator.pop(context, "สร้างเควสสำเร็จ");
      final snackBar = SnackBar(
        content: const Text('คุณได้ทำการเลือกเควสนี้ไปแล้ว'),
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
}
