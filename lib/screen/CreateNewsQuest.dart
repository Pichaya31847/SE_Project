import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Preparedata/ListUser.dart';
import '../Preparedata/QuestOn.dart';
import '../inputquest.dart';
import '../management/QuestSqlMaNagement.dart';
import 'YourOwnQuest.dart';

class CreateNewsQuest extends StatefulWidget {

  @override
  State<CreateNewsQuest> createState() => _CreateNewsQuestState();
}

class _CreateNewsQuestState extends State<CreateNewsQuest> {
  SqlliteManage oDB = SqlliteManage();
  List<String> items = [];
  String? _selectedItem = "";
  final _headdercontrol = TextEditingController();
  final _detailcontrol = TextEditingController();
  final _detecontrol = TextEditingController();
  final fromkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Log_User[1] == '2') {
      items = ["ปี1", "ปี2"];
      _selectedItem = "ปี1";
    } else if (Log_User[1] == '3') {
      items = ["ปี1", "ปี2", "ปี3"];
      _selectedItem = "ปี1";
    } else if (Log_User[1] == '4') {
      items = ["ปี1", "ปี2", "ปี3", "ปี4"];
      _selectedItem = "ปี1";
    } else if (Log_User[1] == '5') {
      items = ["ปี1", "ปี2", "ปี3", "ปี4"];
      _selectedItem = "ปี1";
    }
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
    return Center(
      child: Scaffold(
        appBar:
        AppBar(title: const Text('Create Your Quest'), centerTitle: true),
        body: Container(
          decoration: BoxDecoration(
              color: Colors.lightBlue[100]
          ),
          height: 1000,
          child: SingleChildScrollView(
            child: Form(
              key: fromkey,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Container(
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Icon(
                          Icons.android_rounded,
                          size: 60,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "What Quest?",
                          style: GoogleFonts.bebasNeue(
                            fontSize: 38,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //หัวข้อ
                        Container(
                          child: Text(
                            "Headder",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 20,
                            ),
                          ),
                          alignment: Alignment(-0.77, -1.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'ไม่สามารถปล่อยว่างได้';
                                  }
                                  return null;
                                },
                                controller: _headdercontrol,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'หัวข้อเรื่อง',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        //คำอธิบาย
                        Container(
                          child: Text(
                            "Detail",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 20,
                            ),
                          ),
                          alignment: Alignment(-0.77, -1.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: EdgeInsets.all(7.0),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 9.0),
                                child: TextField(
                                  controller: _detailcontrol,
                                  maxLines: 10, //or null
                                  decoration: InputDecoration.collapsed(
                                      hintText: "คำอธิบาย"),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            // เลือกกลุ่มเป้าหมาย
                            Column(
                              children: [
                                SizedBox(
                                  width: 137,
                                ),
                                Container(
                                  child: Text(
                                    "กลุ่มเป้าหมาย",
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 17,
                                    ),
                                  ),
                                  alignment: Alignment(-0.77, -1.0),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                SizedBox(
                                  width: 85,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: DropdownButtonFormField<String>(
                                      items: items
                                          .map((item) => DropdownMenuItem<String>(
                                          value: item, child: Text(item)))
                                          .toList(),
                                      value: _selectedItem,
                                      onChanged: (item) =>
                                          setState(() => _selectedItem = item),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //วันที่
                            Column(
                              children: [
                                Container(
                                  child: Text(
                                    "วันหมดอายุ",
                                    style: GoogleFonts.bebasNeue(
                                      fontSize: 17,
                                    ),
                                  ),
                                  alignment: Alignment(-0.77, -1.0),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 60,
                                  width: 133,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5.0),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'ไม่สามารถปล่อยว่างได้';
                                        }
                                        return null;
                                      },
                                      controller: _detecontrol,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          icon:
                                          Icon(Icons.calendar_today_rounded),
                                          labelText: "Select Date"),
                                      onTap: () async {
                                        DateTime? pickeddate =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate: DateTime(2101));

                                        if (pickeddate != null) {
                                          _detecontrol.text =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickeddate);
                                        }
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: GestureDetector(
                            onTap: () {
                              if (fromkey.currentState!.validate()) {
                                AddNewQuest();
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Center(
                                child: Text(
                                  'Lets Go',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future AddNewQuest() async {
    var headerquest = _headdercontrol.text;
    var detailquest = _detailcontrol.text;
    bool NextTONextCommand = false;
    print(_selectedItem);
    if (_selectedItem == "ปี1") {
      _selectedItem = "1";
      NextTONextCommand = true;
    } else if (_selectedItem == "ปี2") {
      _selectedItem = "2";
      NextTONextCommand = true;
    } else if (_selectedItem == "ปี3") {
      _selectedItem = "3";
      NextTONextCommand = true;
    } else if (_selectedItem == "ปี4") {
      _selectedItem = "4";
      NextTONextCommand = true;
    } else if (_selectedItem == "อาจารย์") {
      _selectedItem = "5";
      NextTONextCommand = true;
    }
    var targetGroup = _selectedItem.toString();
    var dateCreate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    var dateEmd = _detecontrol.text;
    var ownerQuest = Log_User[0];
    if (NextTONextCommand == true) {
      print("หัวข้อq = " + headerquest);
      print("Detailq = " + detailquest);
      print("Target = " + targetGroup);
      print("CreateDate = " + dateCreate);
      print("EndDate = " + dateEmd);
      print("Owner = " + ownerQuest);
      createQuest(headerquest, detailquest, targetGroup, dateCreate, dateEmd,
          ownerQuest);
    }
  }

  Future createQuest(
      String questHeader,
      String questDetail,
      String questTargetGroup,
      String dateCreate,
      String dateEnd,
      String questOwner) async {
    var _quest = Queston();
    var _inputquest = inputquest();
    _quest.QuestHeader = questHeader;
    _quest.QuestDetail = questDetail;
    _quest.QuestTargetGroup = questTargetGroup;
    _quest.DateCreate = dateCreate;
    _quest.DateEnd = dateEnd;
    _quest.QuestOwner = questOwner;
    var result = await _inputquest.savequest(_quest);
    if (result >= 1) {
      Navigator.pop(context, "สร้างเควสสำเร็จ");
      Navigator.pop(context, "สร้างเควสสำเร็จ");
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return YourOwnQuest();
      }));
      final snackBar = SnackBar(
        content: const Text('สร้างเควสสำเร็จ'),
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
