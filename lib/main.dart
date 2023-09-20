import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_se_new/screen/CompleteQuest.dart';
import 'package:project_se_new/screen/GiveScoreQuest.dart';
import 'package:project_se_new/screen/IndexPage.dart';
import 'package:project_se_new/screen/Selectted.dart';
import 'package:project_se_new/screen/Setting.dart';
import 'package:project_se_new/screen/login.dart';
import 'InputRegis.dart';
import 'InputUser.dart';
import 'Preparedata/Registeron.dart';
import 'Preparedata/UserOn.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.lightBlueAccent,
      ),
      home: const MyHomePage(title: 'Quest'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var _regis = registeron();
    var _inputregis = inputregis();
    _regis.username_user = "test_student1";
    _regis.password_user = "1234";
    _regis.student_id = "1";
    _inputregis.createusertb(_regis);
    check_log_user();
  }

  Future check_log_user() async {
    var _useron = useron();
    var _inputuser = inputuser();
    _useron.username_user = "test1";
    _useron.status_user = "0";
    await _inputuser.createuserlogtb(_useron);
    var result = await _inputuser.CheckUserLog();
    var usernamelogs_on = "";
    if (result == "1") {
      return Navigator.push(context, MaterialPageRoute(builder: (context) {
        return login();
      }));
    }
  }

  int index = 2;
  final pages_indexxx = [
    Selectted(),
    CompleteQuest(),
    IndexPage(),
    GiveScoreQuest(),
    settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: TabBarView(
          children: [pages_indexxx[index]],
        ),
        bottomNavigationBar: NavigationBar(
          height: 60,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.newspaper_outlined),
              selectedIcon: Icon(Icons.newspaper),
              label: 'SELECTQ',
            ),
            NavigationDestination(
              icon: Icon(Icons.add_task_outlined),
              selectedIcon: Icon(Icons.add_task),
              label: 'COMPLETEQ',
            ),
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.access_time),
              selectedIcon: Icon(Icons.access_time_filled),
              label: 'WaitCheckQ',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: 'SETTING',
            )
          ],
        ),
      ),
    );
  }
}
