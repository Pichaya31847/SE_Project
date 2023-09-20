import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Preparedata/ListUser.dart';
import '../Preparedata/Scorein.dart';
import '../inputScore.dart';
class ProfileIndex extends StatefulWidget {

  @override
  State<ProfileIndex> createState() => _ProfileIndexState();
}

class _ProfileIndexState extends State<ProfileIndex> {
  String user = Log_User[0];
  List<Scorein> LoadResultScorein = [];
  String score = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetxhScoreProfile();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        width: MediaQuery.of(context)
            .size
            .width - 45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75.0),
                bottomRight: Radius.circular(75.0))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                child: Text(user,
                  style: GoogleFonts.b612(
                    fontSize: 24,
                  ),)
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(score,
                        style: GoogleFonts.b612(
                            fontSize: 24,
                            color: Colors.blue
                        ),),
                    ),
                    Container(
                        child: Icon(
                            Icons.star,
                            color: Colors.blue)
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
  }
  fetxhScoreProfile() async{
    var _inputScore = inputScore();
    String username = Log_User[0];
    final List<Map<String, dynamic>> queryResultScore =
    await _inputScore.CheckScore(username);
    print(queryResultScore);
    setState(() {
      LoadResultScorein =
          queryResultScore.map((e) => Scorein.fromJson(e)).toList();
    });
    if(LoadResultScorein.length >= 1){
      setState(() {
        score = LoadResultScorein[0].Score.toString();
      });
    }else{
      score = "0.0";
    }
  }
}