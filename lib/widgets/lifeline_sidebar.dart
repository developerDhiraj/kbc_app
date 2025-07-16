import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kbc_app_yt/views/Fifty50.dart';
import 'package:kbc_app_yt/views/audience_poll.dart';
import 'package:kbc_app_yt/views/question.dart';

import '../services/localdb.dart';

class Lifeline_Drawer extends StatefulWidget {
  String question;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String quizID;
  String correctAns;
  int currentQueMon;

  Lifeline_Drawer(
      {required this.question, required this.opt1, required this.opt2, required this.opt3, required this.opt4, required this.correctAns, required this.quizID, required this.currentQueMon});


  @override
  State<Lifeline_Drawer> createState() => _Lifeline_DrawerState();
}

class _Lifeline_DrawerState extends State<Lifeline_Drawer> {



  Future<bool?> checkAudAvail() async {
    bool? AudAvail = true;
    await LocalDB.getAud().then((value) {
      AudAvail = value;
    });
    return AudAvail;
  }

  Future<bool?> checkJokAvail() async {
    bool? JokAvail = true;
    await LocalDB.getJoker().then((value) {
      JokAvail = value;
    });
    return JokAvail;

  }

  Future<bool?> checkf50Avail() async {
    bool? f50Avail = true;
    await LocalDB.get50().then((value) {
      f50Avail = value;
    });
    return f50Avail;

  }

  Future<bool?> checkExpAvail() async {
    bool? ExpAvail = true;
    await LocalDB.getExp().then((value) {
      ExpAvail = value;
    });
    return ExpAvail;

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Lifeline",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () async{
                        if(await checkAudAvail() ?? true){
                          await LocalDB.saveAud(false);
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) =>
                              AudiencePoll(question: widget.question,
                                  otp1: widget.opt1,
                                  otp2: widget.opt2,
                                  otp3: widget.opt3,
                                  otp4: widget.opt4,
                                  CorrectAns: widget.correctAns)));
                        }else{
                          print("Audience poll is already used");
                        }

                      },
                      child: Card(
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.purpleAccent,
                          ),
                          child: Icon(
                            Icons.people,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("Audiance \n Poll", textAlign: TextAlign.center),
                  ],
                ),
                InkWell(
                  onTap: ()async{
                    if (await checkJokAvail() ?? false){
                      await LocalDB.saveJoker(false);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Question(quizID: widget.quizID, queMoney: widget.currentQueMon)));
                    }
                    else{
                      print("Joker lifeline is already Used");
                    }
                  },
                  child: Column(
                    children: [
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: Icon(
                            Icons.people,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Joker \n Question", textAlign: TextAlign.center),
                    ],
                  ),
                ),
                InkWell(
                  onTap: ()async{
                  if (await checkf50Avail() ?? false){
                    await LocalDB.save50(false);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Fifty50(opt1: widget.opt1, opt2: widget.opt2, opt3: widget.opt3, opt4: widget.opt4, CorrectAns: widget.correctAns)));
                  }
                  else{
                    print("You already used 50:50 Lifeline");
                  }
                  },
                  child: Column(
                    children: [
                      Card(
                        elevation: 12,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.purpleAccent,
                          ),
                          child: Icon(
                            Icons.people,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("Fifty \n 50", textAlign: TextAlign.center),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Card(
                      elevation: 12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.purpleAccent,
                        ),
                        child: Icon(
                          Icons.people,
                          size: 32,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text("sfdjsfkkds \n Poll", textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
            SizedBox(height: 5),
            Container(
              margin: EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Prizes",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(color: Colors.black, thickness: 1),
            SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: 454,
                child: Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      itemCount: 13, itemBuilder: (context, index) {
                    return ListTile(leading: Text("${index + 1}.",
                      style: TextStyle(fontSize: 20, color: Colors.grey),),
                      title: Text("Rs. ${2500 * (pow(2, index + 1))}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),),
                      trailing: Icon(Icons.circle),);
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
