import 'package:flutter/material.dart';

import '../Addon/FinishScoreQuest.dart';
import '../Addon/waittingScoreQuest.dart';

class CompleteQuest extends StatefulWidget {

  @override
  State<CompleteQuest> createState() => _CompleteQuestState();
}

class _CompleteQuestState extends State<CompleteQuest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: MediaQuery.of(context)
              .size
              .height - 420,
          width: MediaQuery.of(context)
              .size
              .width - 45,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(75.0))),
          child: DefaultTabController(
              length: 2, // length of tabs
              initialIndex: 0,
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
                Container(
                  child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    tabs: [
                      Tab(child: Text("รอการให้คะแนน",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.yellow[800]))),
                      Tab(child: Text("ให้คะแนนแล้ว",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.green[800])))
                    ],
                  ),
                ),
                Container(
                    height: 550, //height of TabBarView
                    decoration: BoxDecoration(
                        border: Border(top: BorderSide(color: Colors.grey, width: 0.5))
                    ),
                    child: TabBarView(children: <Widget>[
                      waittingScoreQuest(),
                      FinishScoreQuest()
                    ])
                )
              ])
          ),
        ),
      ),
    );
  }
}
