import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_se_new/screen/register.dart';
import '../Preparedata/ListUser.dart';
import '../Repository/RepositoryRegis.dart';
import '../Repository/Repository_User.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  //text controllers
  final _emailcontrol = TextEditingController();
  final _passwordcontrol = TextEditingController();
  final fromkey = GlobalKey<FormState>();

  Future signIn() async {
    Repository _repository = Repository();
    Repository_user _repository_user = Repository_user();
    var username_user = _emailcontrol.text;
    var password = _passwordcontrol.text;
    var result = await _repository.getLoginUser(username_user, password);
    print(result);
    if(result == "1"){
      print(username_user);
      await _repository.checkstatusUser(username_user);
      var username_userss = Log_User[0];
      var status_user = Log_User[1];
      print("username =" + username_userss);
      print("status =" + status_user);
      await _repository_user.saveuserlog(username_userss, status_user);

      Navigator.pop(context,"เข้าสู่ระบบสำเร็จ");
      final snackBar = SnackBar(
        content: const Text('ล็อคอินสำเร็จ'),
        action: SnackBarAction(
          label: 'ปิด',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else if(result == '2'){
      final snackBar = SnackBar(
        content: const Text('username or password incorrect'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: fromkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.android,
                    size: 100,
                  ),
                  //hello
                  Text(
                    "Hello Again",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                    ),
                  ),

                  Text(
                    "Welcome back, you/'ve been missed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  //email
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username ไม่สามารถปล่อยว่างได้';
                            }
                            return null;
                          },
                          controller: _emailcontrol,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                            hintText: 'Username',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'กรุณาใส่รหัสผ่าน';
                            }
                            return null;
                          },
                          controller: _passwordcontrol,
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: InputBorder.none,
                            hintText: 'Password',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: (){if
                      (fromkey.currentState!.validate()){
                        signIn();
                      }
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Sign In',
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
                    height: 25,
                  ),

                  //not a member
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Not a member?",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return register();
                          }));
                        },
                        child: Text(
                          " Register now",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
