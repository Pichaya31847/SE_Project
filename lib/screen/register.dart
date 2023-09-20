import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../InputRegis.dart';
import '../Preparedata/Registeron.dart';
import '../Repository/RepositoryRegis.dart';

class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  List<String> items = ["ปี1", "ปี2", "ปี3", "ปี4", "อาจารย์"];
  String? _selectedItem = "ปี1";
  final _emailcontrol = TextEditingController();
  final _passwordcontrol = TextEditingController();
  final _emailsscontrol = TextEditingController();
  final _otpcontroller = TextEditingController();
  final fromkey = GlobalKey<FormState>();

  var _regis = registeron();
  var _inputregis = inputregis();

  Future registerin() async {
    Repository _repository = Repository();
    var username_user = _emailcontrol.text;
    bool NextTONextCommand = false;
    if (_selectedItem == "ปี1") {
      _selectedItem = "1";
      NextTONextCommand = true;
    } else if (_selectedItem == "ปี2") {
      _selectedItem = "2";
      NextTONextCommand = true;
    } else if (_selectedItem == "ปี3") {
      _selectedItem = "3";
      NextTONextCommand = true;
    } else if (_selectedItem == "ปี4") {
      _selectedItem = "4";
      NextTONextCommand = true;
    } else if (_selectedItem == "อาจารย์") {
      _selectedItem = "5";
      NextTONextCommand = true;
    }
    print(_selectedItem);
    if (NextTONextCommand == true) {
      _regis.username_user = _emailcontrol.text;
      _regis.password_user = _passwordcontrol.text;
      _regis.EmailUser = _emailsscontrol.text;
      _regis.student_id = _selectedItem;
      var ress = await _repository.getcheckUser(username_user,_emailsscontrol.text);
      print(ress);
      if (ress == '1') {
        final snackBar = SnackBar(
          content: const Text('usernameนี้มีคนใช้ไปแล้ว'),
          action: SnackBarAction(
            label: 'ปิด',
            onPressed: () {
              // Some code to undo the change.
            },
          ),
        );
        return ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        var result = await _inputregis.saveuser(_regis);
        if (result >= 1) {
          print(username_user);
          Navigator.pop(context);
          Navigator.pop(context);
          final snackBar = SnackBar(
            content: const Text('สมัครสมาชิคสำเร็จ'),
            action: SnackBarAction(
              label: 'ปิด',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          return ScaffoldMessenger.of(context).showSnackBar(snackBar);
        } else {
          final snackBar = SnackBar(
            content: const Text('เกิดข้อผิดพลาดกรุณาลองใหม่อีกครั้ง'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );
          return ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
    }
  }

  EmailAuth? emailAuth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailAuth = new EmailAuth(
      sessionName: "Verify OTP",
    );
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.android,
                    size: 100,
                  ),
                  //hello
                  Text(
                    "Register",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 52,
                    ),
                  ),

                  //username
                  Container(
                    child: Text(
                      "Username",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 22,
                      ),
                    ),
                    alignment: Alignment(-0.77, -1.0),
                  ),

                  SizedBox(
                    height: 2,
                  ),
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
                  Container(
                    child: Text(
                      "Password",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 22,
                      ),
                    ),
                    alignment: Alignment(-0.77, -1.0),
                  ),

                  SizedBox(
                    height: 2,
                  ),
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
                  //confirm password
                  Container(
                    child: Text(
                      "Confirm Password",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 22,
                      ),
                    ),
                    alignment: Alignment(-0.77, -1.0),
                  ),

                  SizedBox(
                    height: 2,
                  ),
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
                  Container(
                    child: Text(
                      "EMAIL",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 22,
                      ),
                    ),
                    alignment: Alignment(-0.77, -1.0),
                  ),

                  SizedBox(
                    height: 2,
                  ),
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
                            String pattern =
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                r"{0,253}[a-zA-Z0-9])?)*$";
                            RegExp regex = RegExp(pattern);
                            if (value == null || value.isEmpty) {
                              return 'Email ไม่สามารถปล่อยว่างได้';
                            }else if(!regex.hasMatch(value)){
                              return 'กรุณากรอกอีเมลให้ถูกต้อง';
                            }
                            return null;
                          },
                          controller: _emailsscontrol,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
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

                  //รหัสนักศึกษา

                  Container(
                    child: Text(
                      "class year",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 22,
                      ),
                    ),
                    alignment: Alignment(-0.77, -1.0),
                  ),
                  SizedBox(
                    width: 320,
                    child: DropdownButtonFormField<String>(
                      items: items
                          .map((item) => DropdownMenuItem<String>(
                              value: item, child: Text(item)))
                          .toList(),
                      value: _selectedItem,
                      onChanged: (item) => setState(() => _selectedItem = item),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //button register
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: GestureDetector(
                      onTap: () {
                        if (fromkey.currentState!.validate()) {
                          Checkusername();
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Register',
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
                      Text("Have a member?",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          " Login",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Checkusername()async{
    Repository _repository = Repository();
    var username_user = _emailcontrol.text;
    var ress = await _repository.getcheckUser(username_user,_emailsscontrol.text);
    print(ress);
    if (ress == '1') {
      final snackBar = SnackBar(
        content: const Text('UsernameหรือEmailนี้มีคนใช้ไปแล้ว'),
        action: SnackBarAction(
          label: 'ปิด',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }else{
      SentOTP();
      InputOTP();
    }
  }

  Future<String?> InputOTP() {
    return showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text(
              'ยืนยันOTP',
              style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25),
            ),
            content: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "รหัสOTP",
                labelText: "OTP",
                labelStyle: new TextStyle(
                  color: Colors.black
                )
              ),
              controller: _otpcontroller,
              style: TextStyle(fontSize: 18),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('ยกเลิก'),
              ),
              TextButton(
                onPressed: () {
                  verify();
                },
                child: const Text('ยืนยัน'),
              ),
            ],
          ),
        );
  }

  void SentOTP()async{
    bool result = await emailAuth!.sendOtp(
        recipientMail: _emailsscontrol.text, otpLength: 6);
    if(result){
      Otpsented();
    }
  }

  void verify() async{
    bool result = await emailAuth!.validateOtp(recipientMail: _emailsscontrol.text, userOtp: _otpcontroller.text);
    if(result){
      registerin();
    }else{
      OtpWrong();
    }
  }

  OtpWrong(){
    final snackBar = SnackBar(
      content: const Text('รหัสOTPไม่ถูกต้อง'),
      action: SnackBarAction(
        label: 'ปิด',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
    return ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Otpsented(){
    final snackBar = SnackBar(
      content: const Text('ส่งรหัสไปที่เมลเรียบร้อยแล้ว'),
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
