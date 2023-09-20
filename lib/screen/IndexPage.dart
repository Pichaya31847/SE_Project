import 'package:flutter/material.dart';
import '../Addon/ProfileIndex.dart';
import '../Addon/QuestDetail.dart';
import '../Preparedata/ListUser.dart';

class IndexPage extends StatefulWidget {

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  var usernamelogs_on;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernamelogs_on = Log_User[0];
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 17,
              ),
              ProfileIndex(),
              SizedBox(height: 15,),
              QuestDetail()
            ],
          ),
        ),
      ),
    );
  }
}




