import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Addon/SouceItem.dart';
import '../Preparedata/Assignmentin.dart';
import '../inputAssignment.dart';

class ShowResiveQuest extends StatefulWidget {
  final String id;
  const ShowResiveQuest({Key? key,required this.id}) : super(key: key);

  @override
  State<ShowResiveQuest> createState() => _ShowResiveQuestState();
}

class _ShowResiveQuestState extends State<ShowResiveQuest> {
  List<Assignmentin> LoadResultAsset = [];
  String? scoreWork;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchdataSend();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 100.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(75.0),
                          bottomRight: Radius.circular(75.0))),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ข้อมูลเควสที่ส่ง",
                          style: TextStyle(
                              fontSize: 45,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 10.0),
                          child: SingleChildScrollView(
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border:
                                Border.all(width: 1.8, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                LoadResultAsset[0].QuestHeader.toString(),
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 5.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: CheckSouce(),
                          ),
                        ),
                        Text(
                          "คำอธิบาย",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 5.0),
                          child: Container(
                              height: MediaQuery.of(context).size.height - 680,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border:
                                Border.all(width: 1.8, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  LoadResultAsset[0].SendTextHomework.toString(),
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "คะแนนของคุณ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 5.0),
                          child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border:
                                Border.all(width: 1.8, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  LoadResultAsset[0].Score.toString(),
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }

  fetchdataSend() async {
    String idAssignment = widget.id;
    var _inputAssignment = inputAssignment();
    final List<Map<String, dynamic>> queryResultEnD =
    await _inputAssignment.queryResultEnD(idAssignment);
    setState(() {
      LoadResultAsset =
          queryResultEnD.map((e) => Assignmentin.fromJson(e)).toList();
    });
  }

  CheckSouce() {
    if (LoadResultAsset[0].SentType == "image") {
      final String url = LoadResultAsset[0].Urlhomework.toString();
      return imageSorce(url: url);
    } else if (LoadResultAsset[0].SentType == "video") {
      final String url = LoadResultAsset[0].Urlhomework.toString();
      return vdoSorce(url: url);
    } else if (LoadResultAsset[0].SentType == "gif") {
      final String url = LoadResultAsset[0].Urlhomework.toString();
      return imageSorce(url: url);
    } else if (LoadResultAsset[0].SentType == "pdf") {
      final String url = LoadResultAsset[0].Urlhomework.toString();
      return;
    } else if (LoadResultAsset[0].SentType == "atc") {
      final String url = LoadResultAsset[0].Urlhomework.toString();
    }
  }
}
