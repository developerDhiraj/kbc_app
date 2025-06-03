import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';

class QuizIntro extends StatelessWidget {
  const QuizIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: Text("Start Quiz", style: TextStyle(fontSize: 20)),
      ),
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
                      "Quiz Name",
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
                "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
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
                      "Science, Space, Astronomy, Rocket, ISRO",
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
                    Text("10 Minutes", style: TextStyle(fontSize: 17)),
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
                      " sdfd sfd dfs  sfdfa fas fs  fddsfsda sfd fds dfd sfd dfs  sfdfa fas fs  fddsfsda sfd fds dfd sfd dfs  sfdfa fas fs  fddsfsda sfd fds dfd sfd dfs  sfdfa fas fs  fddsfsda sfd fds  ",
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
