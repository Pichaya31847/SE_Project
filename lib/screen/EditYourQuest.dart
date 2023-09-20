import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../Preparedata/ListUser.dart';
import '../inputquest.dart';
import 'FullQuestPage.dart';

class EditYourQuest extends StatefulWidget {
  final String id;
  final String headder;
  final String detail;
  final String target;
  final String dateEnd;

  const EditYourQuest(
      {Key? key,
      required this.id,
      required this.headder,
      required this.detail,
      required this.target,
      required this.dateEnd})
      : super(key: key);

  @override
  State<EditYourQuest> createState() => _EditYourQuestState();
}

class _EditYourQuestState extends State<EditYourQuest> {
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
      if (widget.target == "ปี1") {
        items = ["ปี1", "ปี2"];
        _selectedItem = "ปี1";
      } else if (widget.target == "ปี2") {
        items = ["ปี1", "ปี2"];
        _selectedItem = "ปี2";
      }
    } else if (Log_User[1] == '3') {
      if (widget.target == "ปี1") {
        items = ["ปี1", "ปี2", "ปี3"];
        _selectedItem = "ปี1";
      } else if (widget.target == "ปี2") {
        items = ["ปี1", "ปี2", "ปี3"];
        _selectedItem = "ปี2";
      } else if (widget.target == "ปี3") {
        items = ["ปี1", "ปี2", "ปี3"];
        _selectedItem = "ปี3";
      }
    } else if (Log_User[1] == '4') {
      if (widget.target == "ปี1") {
        items = ["ปี1", "ปี2", "ปี3", "ปี4"];
        _selectedItem = "ปี1";
      } else if (widget.target == "ปี2") {
        items = ["ปี1", "ปี2", "ปี3", "ปี4"];
        _selectedItem = "ปี2";
      } else if (widget.target == "ปี3") {
        items = ["ปี1", "ปี2", "ปี3", "ปี4"];
        _selectedItem = "ปี3";
      } else if (widget.target == "ปี4") {
        items = ["ปี1", "ปี2", "ปี3", "ปี4"];
        _selectedItem = "ปี4";
      }
    } else if (Log_User[1] == '5') {
      if (widget.target == "ปี1") {
        items = ["ปี1", "ปี2", "ปี3", "ปี4"];
        _selectedItem = "ปี1";
      } else if (widget.target == "ปี2") {
        items = ["ปี1", "ปี2", "ปี3", "ปี4"];
        _selectedItem = "ปี2";
      } else if (widget.target == "ปี3") {
        items = ["ปี1", "ปี2", "ปี3", "ปี4"];
        _selectedItem = "ปี3";
      } else if (widget.target == "ปี4") {
        items = ["ปี1", "ปี2", "ปี3", "ปี4"];
        _selectedItem = "ปี4";
      }
    }
    _headdercontrol.text = widget.headder;
    _detailcontrol.text = widget.detail;
    _detecontrol.text = widget.dateEnd;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(title: const Text('Edit Your Quest'), centerTitle: true),
        body: SingleChildScrollView(
          child: Form(
            key: fromkey,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    border: Border.all(width: 2, color: Colors.indigo),
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
                        "Quest?",
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
                              EdityourQuest();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent[400],
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                'บันทึก',
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
    );
  }

  Future EdityourQuest() async {
    bool NextTONextCommand = false;
    var id = widget.id;
    var questHeader = _headdercontrol.text;
    var questDetail = _detailcontrol.text;
    var questTargetGroup = _selectedItem;
    var dateEnd = _detecontrol.text;
    if (_selectedItem == "ปี1") {
      questTargetGroup = "1";
      NextTONextCommand = true;
    } else if (_selectedItem == "ปี2") {
      questTargetGroup = "2";
      NextTONextCommand = true;
    } else if (_selectedItem == "ปี3") {
      questTargetGroup = "3";
      NextTONextCommand = true;
    } else if (_selectedItem == "ปี4") {
      questTargetGroup = "4";
      NextTONextCommand = true;
    } else if (_selectedItem == "อาจารย์") {
      questTargetGroup = "5";
      NextTONextCommand = true;
    }

    if (NextTONextCommand == true) {
      var _inputquest = inputquest();
      var result = await _inputquest.editQuest(
          id, questHeader, questDetail, questTargetGroup.toString(), dateEnd);
      if (result != "") {
        Navigator.pop(context);
        Navigator.pop(context);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FullQuestPage(id: id),
        ));
        final snackBar = SnackBar(
          content: const Text('แก้ไขสำเร็จ'),
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
}
