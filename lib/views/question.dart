import 'package:flutter/material.dart';
import 'package:kbc_app_yt/widgets/lifeline_sidebar.dart';

class Question extends StatefulWidget {
  const Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/kbc_blur.jpg")),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Rs 20000", style: TextStyle(fontSize: 25)),
          centerTitle: true,
        ),
        drawer: Lifeline_Drawer(),
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
                "Question 1 - This is the first question. You name is _________.",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(14),
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(150),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "A. First Option",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(14),
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.green.withAlpha(200),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "B. Second Option",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(14),
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.yellow.withAlpha(150),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "C. Third Option",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(14),
              margin: EdgeInsets.symmetric(horizontal: 17, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.red.withAlpha(150),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "D. Forth Option",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
