import 'package:flutter/material.dart';
import 'package:project_se_new/screen/YourOwnQuest.dart';

import '../Preparedata/QuestIn.dart';
import '../inputquest.dart';
import 'EditYourQuest.dart';

class FullQuestPage extends StatefulWidget {
  final String id;

  const FullQuestPage({Key? key, required this.id}) : super(key: key);

  @override
  State<FullQuestPage> createState() => _FullQuestPageState();
}

class _FullQuestPageState extends State<FullQuestPage> {
  List<Questin> LoadResult = [];
  var _headdercontrol = TextEditingController();
  var _detailcontrol = TextEditingController();
  var _Targetcontrol = TextEditingController();
  var DateCreate = "";
  var DateEnd = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 30,
                    ),
                    Container(
                      alignment: Alignment(-0.50, -0.10),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return YourOwnQuest();
                            }));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(75.0))),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 45,
                            ),
                          )),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          "หัวข้อเควส",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            textAlign: TextAlign.center,
                            enabled: false,
                            controller: _headdercontrol,
                            style: TextStyle(
                              fontSize: 23.0,
                            ),
                            decoration: InputDecoration(),
                            maxLines: 4,
                          ),
                        ),
                        Text(
                          "คำอธิบาย",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(12)),
                          child: TextField(
                            textAlign: TextAlign.center,
                            enabled: false,
                            controller: _detailcontrol,
                            style: TextStyle(
                              fontSize: 23.0,
                            ),
                            decoration: InputDecoration(),
                            maxLines: 9,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "กลุ่มเป้าหมาย",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22.0),
                        ),
                        TextField(
                          textAlign: TextAlign.center,
                          enabled: false,
                          controller: _Targetcontrol,
                          style: TextStyle(
                            fontSize: 22.0,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                          ),
                          maxLines: 1,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text("วันที่สร้าง",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0,
                                    )),
                                Text(DateCreate,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                    ))
                              ],
                            ),
                            Column(
                              children: [
                                Text("วันสิ้นสุด",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0,
                                    )),
                                Text(DateEnd,
                                    style: TextStyle(
                                      fontSize: 22.0,
                                    ))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton:
              Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            FloatingActionButton(
              child: Icon(Icons.edit),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return EditYourQuest(
                      id: widget.id,
                      headder: _headdercontrol.text,
                      detail: _detailcontrol.text,
                      target: _Targetcontrol.text,
                      dateEnd: DateEnd);
                }));
              },
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              child: Icon(Icons.delete),
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
                    'ยืนยันที่จะลบเควสนี้ไหม',
                    style: TextStyle(fontSize: 18),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('ยกเลิก'),
                    ),
                    TextButton(
                      onPressed: () {
                        DelyourQuest();
                      },
                      child: const Text('ยืนยัน'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ]),
        ),
      ),
    );
  }

  fetchData() async {
    var _inputquest = inputquest();
    final List<Map<String, dynamic>> queryResult =
        await _inputquest.showQuest(widget.id);
    LoadResult = queryResult.map((e) => Questin.fromJson(e)).toList();
    if (LoadResult[0].QuestTargetGroup == "1") {
      setState(() {
        _Targetcontrol.text = "ปี1";
      });
    } else if (LoadResult[0].QuestTargetGroup == "2") {
      setState(() {
        _Targetcontrol.text = "ปี2";
      });
    } else if (LoadResult[0].QuestTargetGroup == "3") {
      setState(() {
        _Targetcontrol.text = "ปี3";
      });
    } else if (LoadResult[0].QuestTargetGroup == "4") {
      setState(() {
        _Targetcontrol.text = "ปี4";
      });
    }
    setState(() {
      _headdercontrol.text = LoadResult[0].QuestHeader!;
      _detailcontrol.text = LoadResult[0].QuestDetail!;
      DateCreate = LoadResult[0].DateCreate!;
      DateEnd = LoadResult[0].DateEnd!;
    });
  }

  DelyourQuest() async {
    var _inputquest = inputquest();
    var result = await _inputquest.delQuest(widget.id);
    if (result != "") {
      setState(() {
        LoadResult = [];
      });
      Navigator.pop(context);
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return YourOwnQuest();
      }));
      final snackBar = SnackBar(
        content: const Text('ลบสำเร็จ'),
        action: SnackBarAction(
          label: 'ปิด',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
