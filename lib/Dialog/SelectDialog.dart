import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../inputSelect.dart';
import '../screen/SentAssignment.dart';

class SelectDialog extends StatefulWidget {
  final String id;
  final String questHeader;
  final String QuestDetail;
  final String dateEnd;
  final String QuestOwner;

  const SelectDialog({
    Key? key,
    required this.id,
    required this.questHeader,
    required this.QuestDetail,
    required this.dateEnd,
    required this.QuestOwner,
  }) : super(key: key);

  @override
  State<SelectDialog> createState() => _SelectDialogState();
}

class _SelectDialogState extends State<SelectDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      //หัวข้อ###########################################################
                      Padding(
                        padding: const EdgeInsets.all(1.2),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 80,
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        widget.questHeader,
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //คำอธิบาย#########################################################
                      Padding(
                        padding: const EdgeInsets.all(1.2),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height - 520,
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: SingleChildScrollView(
                                  child: Text(
                                    widget.QuestDetail,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      //วันหมดอายุ กับ ชื่อคนสร้าง#############################################
                      Padding(
                        padding: const EdgeInsets.all(1.2),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 90,
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.black,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "ชื่อผู้สร้าง",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(widget.QuestOwner,
                                          style: TextStyle(fontSize: 20))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 26,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("วันสิ้นสุด",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      Text(widget.dateEnd,
                                          style: TextStyle(fontSize: 20))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () => showDialog<String>(
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
                                    'ยืนยันที่จะเอาเควสนี้ออกไหม',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('ยกเลิก'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        delSelect(widget.id);
                                      },
                                      child: const Text('ยืนยัน'),
                                    ),
                                  ],
                                ),
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height - 980,
                                width: MediaQuery.of(context).size.width - 500,
                                color: Colors.deepOrange[400],
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return SentAssignment(id:widget.id);
                                }));
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height - 980,
                                width: MediaQuery.of(context).size.width - 220,
                                color: Colors.blue[400],
                                child: Center(
                                    child: Text(
                                  "Add submission",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Transform.scale(
          scale: 0.7,
          child: FloatingActionButton(
            hoverColor: Colors.blue[200],
            child: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ));

  delSelect(String id)async{
    var _inputselect = inputselect();
    final resultDel = await _inputselect.delsSelect(id);
    print(resultDel);
    Navigator.pop(context, 'Cancel');
    Navigator.of(context).pop();
    final snackBar = SnackBar(
      content: const Text('เอาออกแล้ว'),
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
