import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_se_new/Addon/SouceItem.dart';
import '../Preparedata/Assignmentin.dart';
import '../Preparedata/Scorein.dart';
import '../Preparedata/Scoreon.dart';
import '../inputAssignment.dart';
import '../inputScore.dart';

class GiveScoreAssignment extends StatefulWidget {
  final String id;

  const GiveScoreAssignment({Key? key, required this.id}) : super(key: key);

  @override
  State<GiveScoreAssignment> createState() => _GiveScoreAssignmentState();
}

class _GiveScoreAssignmentState extends State<GiveScoreAssignment> {
  List<Assignmentin> LoadResultAsset = [];
  List<Scorein> LoadResultScorein = [];
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
                          "ให้คะแนนเควส",
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
                          "ให้คะแนนเท่าไหร่ดี",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RatingBar(
                          initialRating: 0,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: Image.asset('image/icon/heart.png'),
                            half: Image.asset('image/icon/heart_half.png'),
                            empty: Image.asset('image/icon/heart_border.png'),
                          ),
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          onRatingUpdate: (rating) {
                            setState(() {
                              scoreWork = rating.toString();
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
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
              'ยืนยันที่จะให้คะแนนตามนี้ไหม',
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
                  SaveScore();
                },
                child: const Text('ยืนยัน'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  fetchdataSend() async {
    String idAssignment = widget.id;
    var _inputAssignment = inputAssignment();
    final List<Map<String, dynamic>> queryResultGive =
        await _inputAssignment.showAssign(idAssignment);
    setState(() {
      LoadResultAsset =
          queryResultGive.map((e) => Assignmentin.fromJson(e)).toList();
    });
    if (LoadResultAsset.length == 0) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: const Text('คุณได้เคยให้คะแนนเควสนี้ไปแล้ว'),
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

  SaveScore() async {
    var _inputAssignment = inputAssignment();
    var resultScore =
        _inputAssignment.GiveScore(scoreWork.toString(), widget.id);
    print(LoadResultAsset[0].NamepersonWhoSelect.toString());
    return await saveScoreFinal();
  }

  saveScoreFinal() async{
    var _inputScore = inputScore();
    String username = LoadResultAsset[0].NamepersonWhoSelect.toString();
    final List<Map<String, dynamic>> queryResultScore =
    await _inputScore.CheckScore(username);
    print(queryResultScore);
    setState(() {
      LoadResultScorein =
          queryResultScore.map((e) => Scorein.fromJson(e)).toList();
    });
    if(LoadResultScorein.length == 0){
      var _Scoreon = Scoreon();
      _Scoreon.username_user = LoadResultAsset[0].NamepersonWhoSelect;
      _Scoreon.Score = scoreWork.toString();
      var resultScore = await _inputScore.saveScore(_Scoreon);
      if (resultScore >= 1) {
        print(_Scoreon.username_user);
        Navigator.pop(context);
        Navigator.pop(context);
        final snackBar = SnackBar(
          content: const Text('ให้คะแนนแล้ว'),
          action: SnackBarAction(
            label: 'ปิด',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }else{
        final snackBar = SnackBar(
          content: const Text('เกิดข้อผิดพลาดกรุณาลองใหม่ภายหลัง'),
          action: SnackBarAction(
            label: 'ปิด',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }else{
      double ScoreLast = double.parse(LoadResultScorein[0].Score.toString());
      double Thisscore = double.parse(scoreWork.toString());
      double Finalscore = ScoreLast + Thisscore;
      String id_score = LoadResultScorein[0].id.toString();
      await _inputScore.ScoreEnd(Finalscore.toString(), id_score);
      Navigator.pop(context);
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: const Text('ให้คะแนนแล้ว'),
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
