import 'package:flutter/cupertino.dart';
import 'package:project_se_new/management/QuestSqlMaNagement.dart';

import 'Preparedata/QuestOn.dart';

class ActressList extends StatefulWidget {
  @override
  State<ActressList> createState() => _ActressListState();
}

class _ActressListState extends State<ActressList> {
  List<Queston> listActress = [];
  SqlliteManage oDB = SqlliteManage();

  void queryActressData() async{
    final String strSQL = "";
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
