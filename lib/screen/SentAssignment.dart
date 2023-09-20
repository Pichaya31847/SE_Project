import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project_se_new/inputSelect.dart';
import 'package:video_player/video_player.dart';
import '../Preparedata/Assignmenton.dart';
import '../Preparedata/ListUser.dart';
import '../Preparedata/Selectin.dart';
import '../inputAssignment.dart';

class SentAssignment extends StatefulWidget {
  final String id;

  const SentAssignment({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<SentAssignment> createState() => _SentAssignmentState();
}

class _SentAssignmentState extends State<SentAssignment> {
  PlatformFile? pickedfile;
  UploadTask? uploadTask;
  List<Selectin> LoadResultAsse = [];
  String? urlDownloadAsse;
  bool imageSe = false;
  bool VideoSe = false;
  bool GifSe = false;
  bool PDFSe = false;
  bool AnotherFile = false;
  final _describcontrol = TextEditingController();
  final fromkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: fromkey,
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
                            "มาส่งเควสกัน",
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
                                  LoadResultAsse[0].Questheader.toString(),
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
                            child: SingleChildScrollView(
                              child: Container(
                                height: MediaQuery.of(context).size.height - 680,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1.8, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: SingleChildScrollView(
                                  child: Text(
                                    LoadResultAsse[0].QuestDetail.toString(),
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (imageSe == true)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height - 600,
                                width: MediaQuery.of(context).size.width,
                                child: Expanded(
                                    child: Container(
                                  color: Colors.blue[100],
                                  child: Image.file(
                                    File(pickedfile!.path!),
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                              ),
                            ),
                          if (VideoSe == true)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height - 600,
                                width: MediaQuery.of(context).size.width,
                                child: Expanded(
                                    child: Container(
                                        color: Colors.blue[100],
                                        child: Center(
                                          child: Text(
                                            pickedfile!.name,
                                            style: TextStyle(fontSize: 20),
                                            textAlign: TextAlign.center,
                                          ),
                                        ))),
                              ),
                            ),
                          if (GifSe == true)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height - 600,
                                width: MediaQuery.of(context).size.width,
                                child: Expanded(
                                    child: Container(
                                  color: Colors.blue[100],
                                  child: Image.file(
                                    File(pickedfile!.path!),
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                              ),
                            ),
                          if (PDFSe == true)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height - 600,
                                width: MediaQuery.of(context).size.width,
                                child: Expanded(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height - 600,
                                    width: MediaQuery.of(context).size.width,
                                    child: Expanded(
                                        child: Container(
                                            color: Colors.blue[100],
                                            child: Center(
                                              child: Text(
                                                pickedfile!.name,
                                                style: TextStyle(fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                            ))),
                                  ),
                                ),
                              ),
                            ),
                          if (AnotherFile == true)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height - 600,
                                width: MediaQuery.of(context).size.width,
                                child: Expanded(
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height - 600,
                                    width: MediaQuery.of(context).size.width,
                                    child: Expanded(
                                        child: Container(
                                            color: Colors.blue[100],
                                            child: Center(
                                              child: Text(
                                                pickedfile!.name,
                                                style: TextStyle(fontSize: 20),
                                                textAlign: TextAlign.center,
                                              ),
                                            ))),
                                  ),
                                ),
                              ),
                            ),
                          buildProgress(),
                          //ปุ้มเพิ่มไฟล์ต่างๆ-------------------------------------------------------------
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //ปุ่มเพิ่มรูปภาพ-------------------------------------------------
                              ElevatedButton(
                                onPressed: SelectFileIMG,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.photo,
                                    size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              //ปุ่มเพิ่มวีดีโอ-------------------------------------------------
                              ElevatedButton(
                                onPressed: SelectFileVideo,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.video_file,
                                    size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              //ปุ่มเพิ่มไฟล์กิฟล์-------------------------------------------------
                              ElevatedButton(
                                onPressed: SelectFileGif,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.gif_box_sharp,
                                    size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              //ปุ่มเพิ่มไฟล์pdf-------------------------------------------------
                              ElevatedButton(
                                onPressed: SelectFilePdf,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.picture_as_pdf,
                                    size: 30,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              //ไฟล์อื่นๆ------------------------------------------------------
                              ElevatedButton(
                                onPressed: SelectFileAtc,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(
                                    Icons.link,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 5.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                controller: _describcontrol,
                                textAlign: TextAlign.center,
                                maxLines: 5,
                                decoration: InputDecoration.collapsed(
                                    hintText: "คำอธิบาย"),
                              ),
                            ),
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
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed:() => showDialog<String>(
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
            'ยืนยันที่จะส่งเควสนี้ไหม เมื่อส่งไปแล้วจะไม่สามารถแก้ไขได้',
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
                uploadQuest();
              },
              child: const Text('ยืนยัน'),
            ),
          ],
        ),
      ),
      ),
    );
  }

  fetchData() async {
    String ownername = Log_User[0];
    String idSelect = widget.id;
    var _inputselect = inputselect();
    final List<Map<String, dynamic>> queryResultSelect =
        await _inputselect.showQuest(idSelect, ownername);
    setState(() {
      LoadResultAsse =
          queryResultSelect.map((e) => Selectin.fromJson(e)).toList();
    });
    if (LoadResultAsse.length == 0) {
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: const Text('เควสนี้ได้ถูกส่งหรือลบไปแล้ว'),
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

  Future SelectFileIMG() async {
    final resultImg = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );
    if (resultImg == null) return;

    setState(() {
      pickedfile = resultImg.files.first;
      imageSe = true;
      VideoSe = false;
      GifSe = false;
      PDFSe = false;
      AnotherFile = false;
    });
  }

  Future SelectFileVideo() async {
    final resultVdo = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );
    if (resultVdo == null) return;

    setState(() {
      pickedfile = resultVdo.files.first;
      imageSe = false;
      VideoSe = true;
      GifSe = false;
      PDFSe = false;
      AnotherFile = false;
    });
  }

  Future SelectFileGif() async {
    final resultImg = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['gif'],
    );
    if (resultImg == null) return;

    setState(() {
      pickedfile = resultImg.files.first;
      imageSe = false;
      VideoSe = false;
      GifSe = true;
      PDFSe = false;
      AnotherFile = false;
    });
  }

  Future SelectFilePdf() async {
    final resultImg = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['pdf'],
    );
    if (resultImg == null) return;

    setState(() {
      pickedfile = resultImg.files.first;
      imageSe = false;
      VideoSe = false;
      GifSe = false;
      PDFSe = true;
      AnotherFile = false;
    });
  }

  Future SelectFileAtc() async {
    final resultImg = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (resultImg == null) return;

    setState(() {
      pickedfile = resultImg.files.first;
      imageSe = false;
      VideoSe = false;
      GifSe = false;
      PDFSe = false;
      AnotherFile = true;
    });
  }

  Future uploadQuest() async {
    final path = 'files/${widget.id}/${pickedfile!.name}';
    final file = File(pickedfile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    print('Download Link :' + urlDownload);

    setState(() {
      uploadTask = null;
    });

    if (urlDownload != "") {
      setState(() {
        urlDownloadAsse = urlDownload;
      });
      SaveAssignmentData();
    }
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;

          return SizedBox(
            height: 30,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Colors.green,
                ),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: const TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox(
            height: 30,
          );
        }
      });

  Future SaveAssignmentData() async {
    var _Assignment = Assignmenton();
    var _inputAssignment = inputAssignment();
    var _inputSelect = inputselect();
    String? SendTextHomework;
    if (_describcontrol.text == "") {
      SendTextHomework = "ไม่มีคำอธิบาย";
    } else {
      SendTextHomework = _describcontrol.text;
    }
    String id = widget.id;
    _Assignment.QuestHeader = LoadResultAsse[0].Questheader;
    _Assignment.QuestDetail = LoadResultAsse[0].QuestDetail;
    _Assignment.QuestOwner = LoadResultAsse[0].QuestOwner;
    _Assignment.NamepersonWhoSelect = LoadResultAsse[0].NamepersonWhoSelect;
    _Assignment.Urlhomework = urlDownloadAsse;
    _Assignment.SendTextHomework = SendTextHomework;
    _Assignment.Status = '0';
    _Assignment.Score = '0.0';
    if (imageSe == true) {
      _Assignment.SentType = "image";
    } else if (VideoSe == true) {
      _Assignment.SentType = "video";
    } else if (GifSe == true) {
      _Assignment.SentType = "gif";
    } else if (PDFSe == true) {
      _Assignment.SentType = "pdf";
    } else if (AnotherFile == true) {
      _Assignment.SentType = "atc";
    }
    print("Headder");
    print(LoadResultAsse[0].Questheader);
    print("คำอธิบาย");
    print(LoadResultAsse[0].QuestDetail);
    print("เจ้าของ");
    print(LoadResultAsse[0].QuestOwner);
    print("คนส่ง");
    print(LoadResultAsse[0].NamepersonWhoSelect);
    print("ลิงค์");
    print(urlDownloadAsse);
    print("คำอธิบายที่ส่ง");
    print(SendTextHomework);
    print("รูปแบบที่ส่ง");
    print(_Assignment.SentType);
    print(_Assignment.Status);

    var result = await _inputAssignment.saveSelect(_Assignment);
    if (result >= 1) {
      await _inputSelect.delsSelect(id);
      Navigator.pop(context);
      Navigator.pop(context);
      final snackBar = SnackBar(
        content: const Text('ส่งเสร็จเรียบร้อย รอคนสร้างมาให้คะแนนนะ'),
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
