import 'package:flutter/material.dart';

class Looser extends StatelessWidget {
  const Looser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/loose.jpg"),fit: BoxFit.cover)),
      child: Scaffold(
        floatingActionButton: ElevatedButton(onPressed: (){}, child: Text("Retry"),),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Oh Sorry!", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                  Text("Your answer is Incorrect",style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  SizedBox(height: 15,),
                  Text("You won ",),
                  Text("Rs.50,000",style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),),
                  Icon(Icons.error_outline,size: 50,color: Colors.red,),


                  ElevatedButton(onPressed: (){}, child: Text("Go To Rewards"))
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
