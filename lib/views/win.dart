import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Win extends StatefulWidget {
  const Win({super.key});

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {

  late ConfettiController confettiController;
  @override
  void initState() {
    super.initState();
    setState(() {
      initController();
    });
    confettiController.play();
  }
  void initController(){
    confettiController= ConfettiController(duration: Duration(seconds: 1));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/kbc_blur.jpg"),fit: BoxFit.cover)),
      child: Scaffold(
        floatingActionButton: ElevatedButton(onPressed: (){}, child: Text("Share with friends"),),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Congratulation!", style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),),
                  Text("Your answer is correct",style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500),),
                  SizedBox(height: 15,),
                  Text("You won ", style: TextStyle(color: Colors.white),),
                  Text("Rs.50,000",style: TextStyle(color: Colors.white,fontSize: 34, fontWeight: FontWeight.w500),),
                  Container(
                    padding: EdgeInsets.all(20),
                      child: Image.asset("assets/images/cheque.jpg")),
                  ElevatedButton(onPressed: (){}, child: Text("Next Question"))
                ],
              ),
            ),
            buildConfettiWidget(confettiController, pi/2),
          ],
        ),
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection){
    return Align(alignment: Alignment.topCenter,
    child: ConfettiWidget(
      maximumSize: Size(30, 30),
      shouldLoop: false,
      confettiController: controller,
      blastDirection: blastDirection,
      blastDirectionality: BlastDirectionality.explosive,
      maxBlastForce: 20,
      minBlastForce: 8,
      emissionFrequency: 0.02,
      numberOfParticles: 8,
      gravity: 0.6,
    ),);
  }


}
