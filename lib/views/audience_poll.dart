import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AudiencePoll extends StatefulWidget {
  String question;
  String otp1;
  String otp2;
  String otp3;
  String otp4;
  String CorrectAns;

  AudiencePoll({required this.question, required this.otp1, required this.otp2, required this.otp3, required this.otp4, required this.CorrectAns});



  @override
  State<AudiencePoll> createState() => _AudiencePollState();
}

class _AudiencePollState extends State<AudiencePoll> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VotingMachine();
  }

  int opt1Votes = 0;
  int opt2Votes = 0;
  int opt3Votes = 0;
  int opt4Votes = 0;
  bool isVoting = true;

  VotingMachine() async{
    await Future.delayed(Duration(seconds: 5), (){});
    setState(() {
      if(widget.otp1 == widget.CorrectAns){
        opt1Votes = Random().nextInt(100);
      }else {
        opt1Votes = Random().nextInt(40);
      }

      if(widget.otp2 == widget.CorrectAns){
        opt2Votes = Random().nextInt(100);
      }else {
        opt2Votes = Random().nextInt(40);
      }
      if(widget.otp3 == widget.CorrectAns){
        opt3Votes = Random().nextInt(100);
      }else {
        opt3Votes = Random().nextInt(40);
      }
      if(widget.otp4 == widget.CorrectAns){
        opt4Votes = Random().nextInt(100);
      }else {
        opt4Votes = Random().nextInt(40);
      }
      isVoting = false;
    });
    Future.delayed(Duration(seconds: 7),(){
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 170,horizontal: 30),
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.purpleAccent,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(

            children: [
            Text("Audience Poll Lifefile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
              SizedBox(height: 20,),
              Text("Question - ${widget.question}", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22, color: Colors.white),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text(isVoting ? "Audience is Voting" : "Here are the Results", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17, color: Colors.white),),
              SizedBox(height: 10,),
              isVoting ? LinearProgressIndicator() : Container(),
              SizedBox(height: 20,),
              Text("${widget.otp1}\t\t${opt1Votes} Votes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
              Text("${widget.otp2}\t\t${opt2Votes} Votes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
              Text("${widget.otp3}\t\t${opt3Votes} Votes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
              Text("${widget.otp4}\t\t${opt4Votes} Votes", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
