import 'package:flutter/material.dart';

class Fifty50 extends StatefulWidget {
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String CorrectAns;
   Fifty50({required this.opt1, required this.opt2, required this.opt3, required this.opt4, required this.CorrectAns});

  @override
  State<Fifty50> createState() => _Fifty50State();
}

class _Fifty50State extends State<Fifty50> {
  late String WrongOpt1;
  late String WrongOpt2;
  List WrongOption = [];
  fatchWrongOptions(){
    setState(() {
      if(widget.opt1 != widget.CorrectAns){
        WrongOption.add(widget.opt1);
      }
      if(widget.opt2 != widget.CorrectAns){
        WrongOption.add(widget.opt2);
      }
      if(widget.opt3 != widget.CorrectAns){
        WrongOption.add(widget.opt3);
      }
      if(widget.opt4 != widget.CorrectAns){
        WrongOption.add(widget.opt4);
      }
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchWrongOptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Container(
          decoration: BoxDecoration(color: Colors.purpleAccent,
          borderRadius: BorderRadius.circular(20)),
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 200),
          child: Column(
            children: [
              Text("Fifity Fifty Lifeline", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white,),textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Text("${WrongOption[0]} and ${WrongOption[1]} is incorrect answers" ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}
