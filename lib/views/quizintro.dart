import 'package:flutter/material.dart';

import 'package:kbc_app_yt/services/QuizDhanda.dart';
import 'package:kbc_app_yt/services/quizQueCreator.dart';
import 'package:kbc_app_yt/views/checkQuizUnlock.dart';
import 'package:kbc_app_yt/views/question.dart';

class QuizIntro extends StatefulWidget {
  String quizName;
  String quizImgUrl;
  String quizTopics;
  String quizDuration;
  String quizAbout;
  String QuizId;
 String QuizPrice;
  QuizIntro({
      required this.quizName,
      required this.quizImgUrl,
      required this.quizTopics,
      required this.quizDuration,
      required this.quizAbout,
      required this.QuizId,
      required this.QuizPrice
        }
      );
  @override
  State<QuizIntro> createState() => _QuizIntroState();
}

class _QuizIntroState extends State<QuizIntro> {
    bool quizIsUnlock = false;
    getAllQuizzesAndCheckUnlock() async {
    await CheckQuizUnlock.checkQuizUnlockStatus(widget.QuizId).then((unlockStatus){
      print("In quizintro : Unlock status for ${widget.QuizId} is: $unlockStatus");
      setState(() {
        quizIsUnlock = unlockStatus;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllQuizzesAndCheckUnlock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: Text( quizIsUnlock ? "Start Quiz" : "Unlock Quiz", style: TextStyle(fontSize: 20)),
        onPressed: () async {
          quizIsUnlock
              ?
          // print("Quiz is already Unlocked")
          // await QuizQueCreator.genQuizQue(widget.QuizId, 6000)
          // print("Navigate to Question Page")
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Question(quizID: widget.QuizId, queMoney: 6000)))
              : QuizDhandha.buyQuiz(QuizPrice : int.parse(widget.QuizPrice), QuizID : widget.QuizId).then((quizKharidLiya){
            if(quizKharidLiya){
              setState(() {
                quizIsUnlock = true;
              });
            }
            else{
              return showDialog(context: context, builder: (context)=>AlertDialog(
                title: Text("You don't have enough money to buy this quiz"),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("OK"))
                ],
              ));
            }
          });
        }),
      appBar: AppBar(title: Text("KBC Quiz App")),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.quizName,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Image.network(
                widget.quizImgUrl,
                fit: BoxFit.cover,
                height: 230,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.topic_outlined),
                        SizedBox(width: 6),
                        Text(
                          "Related To - ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.quizTopics,
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.timer),
                        SizedBox(width: 6),
                        Text(
                          "Duration",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text("${widget.quizDuration} Minutes", style: TextStyle(fontSize: 17)),
                  ],
                ),
              ),
              quizIsUnlock ? Container() : Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(width: 6),
                        Text(
                          "Money",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text("Rs. ${widget.QuizPrice}", style: TextStyle(fontSize: 17)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.topic_outlined),
                        SizedBox(width: 6),
                        Text(
                          "About Quiz -",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.quizAbout,
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
