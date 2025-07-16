import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kbc_app_yt/services/QuestionModel.dart';
import 'package:kbc_app_yt/services/firedb.dart';
import 'package:kbc_app_yt/services/quizQueCreator.dart';
import 'package:kbc_app_yt/views/win.dart';
import 'package:kbc_app_yt/widgets/lifeline_sidebar.dart';

import '../services/localdb.dart';
import 'loser.dart';

class Question extends StatefulWidget {
  String quizID;
  int queMoney;
  Question({required this.quizID, required this.queMoney});

  @override
  State<Question> createState() => _QuestionState();
  }


class _QuestionState extends State<Question> {

  QuestionModel questionModel = new QuestionModel();
  genQue() async {
    final queData = await QuizQueCreator.genQuizQue(widget.quizID, widget.queMoney);


    if (queData == null) {
      // Show an alert if no question found
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("No question found"),
          content: Text("No question available for this money level."),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"))
          ],
        ),
      );
      return;
    }

    setState(() {
      questionModel.question = queData["Question"] ?? "No Question";
      questionModel.correctAnswer = queData["correctAnswer"] ?? "";

      List options = [
        queData["opt1"] ?? "",
        queData["opt2"] ?? "",
        queData["opt3"] ?? "",
        queData["opt4"] ?? "",
      ];

      options.shuffle();
      questionModel.option1 = options[0];
      questionModel.option2 = options[1];
      questionModel.option3 = options[2];
      questionModel.option4 = options[3];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genQue();
    // setLifeLAvail();
    print("this is data from initState $genQue");
  }
  //
  // setLifeLAvail()async{
  //   await LocalDB.saveAud(true);
  //   await LocalDB.saveJoker(true);
  //   await LocalDB.save50(true);
  //   await LocalDB.saveExp(true);
  // }

  bool optALocked = false;
  bool optBLocked = false;
  bool optCLocked = false;
  bool optDLocked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/kbc_blur.jpg")),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Rs ${widget.queMoney}", style: TextStyle(fontSize: 25)),
          centerTitle: true,
        ),
        drawer: Lifeline_Drawer(question: questionModel.question,opt1: questionModel.option1, opt2: questionModel.option2,opt3: questionModel.option3, opt4: questionModel.option4,correctAns: questionModel.correctAnswer,quizID: widget.quizID,currentQueMon: widget.queMoney,),
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          child: Text("Quit Game"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    strokeWidth: 12,
                    backgroundColor: Colors.red,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text(
                      "47",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(14),
              margin: EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                questionModel.question,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              onTap: (){
                print("Double tab to lock the screen");
              },
              onLongPress: (){
                setState(() {
                  optALocked = true;
                });
                Future.delayed(Duration(seconds: 2),()async{
                  if(questionModel.option1 == questionModel.correctAnswer){
                    print("Badhiya Hai yaar");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Win(widget.queMoney, widget.quizID)));
                  }else{
                    await FireDB.updateMoney(widget.queMoney~/2);
                    print("Bada dukh hua dekh kar");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Looser(wonMon: widget.queMoney~/2,correctAns: questionModel.correctAnswer,)));
                  }
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                decoration: BoxDecoration(
                  color: optALocked ? Colors.yellow.withAlpha(150) : Colors.purple.withAlpha(150),
                  borderRadius: BorderRadius.circular(30),
                ),
                child:Text(
                  "A. ${questionModel.option1}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                print("Double tab to lock the screen");
              },
              onLongPress: (){
                setState(() {
                  optBLocked = true;
                });
                Future.delayed(Duration(seconds: 2),()async{
                  if(questionModel.option2 == questionModel.correctAnswer){
                    print("Badhiya Hai yaar");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Win(widget.queMoney, widget.quizID)));
                  }else{
                    await FireDB.updateMoney(widget.queMoney~/2);
                    print("Bada dukh hua dekh kar");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Looser(wonMon: widget.queMoney~/2,correctAns: questionModel.correctAnswer,)));
                  }
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                decoration: BoxDecoration(
                  color: optBLocked ? Colors.yellow.withAlpha(150) : Colors.purple.withAlpha(150),
                  borderRadius: BorderRadius.circular(30),
                ),
                child:Text(
                  "B. ${questionModel.option2}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                print("Double tab to lock the screen");
              },
              onLongPress: (){
                setState(() {
                  optCLocked = true;
                });
                Future.delayed(Duration(seconds: 2),()async{
                  if(questionModel.option3 == questionModel.correctAnswer){
                    print("Badhiya Hai yaar");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Win(widget.queMoney, widget.quizID)));
                  }else{
                    await FireDB.updateMoney(widget.queMoney~/2);
                    print("Bada dukh hua dekh kar");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Looser(wonMon: widget.queMoney~/2,correctAns: questionModel.correctAnswer,)));
                  }
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                decoration: BoxDecoration(
                  color: optCLocked ? Colors.yellow.withAlpha(150) : Colors.purple.withAlpha(150),
                  borderRadius: BorderRadius.circular(30),
                ),
                child:Text(
                  "C. ${questionModel.option3}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            InkWell(
              onTap: (){
                print("Double tab to lock the screen");
              },
              onLongPress: (){
                setState(() {
                  optDLocked = true;
                });
                Future.delayed(Duration(seconds: 2),()async{
                  if(questionModel.option4 == questionModel.correctAnswer){
                    print("Badhiya Hai yaar");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Win(widget.queMoney, widget.quizID)));
                  }else{
                    await FireDB.updateMoney(widget.queMoney~/2);
                    print("Bada dukh hua dekh kar");
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Looser(wonMon: widget.queMoney~/2,correctAns: questionModel.correctAnswer,)));
                  }
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(14),
                margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
                decoration: BoxDecoration(
                  color: optDLocked ? Colors.yellow.withAlpha(150) : Colors.purple.withAlpha(150),
                  borderRadius: BorderRadius.circular(30),
                ),
                child:Text(
                  "D. ${questionModel.option4}",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
