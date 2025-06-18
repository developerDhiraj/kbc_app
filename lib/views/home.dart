import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kbc_app_yt/services/home_fire.dart';
import 'package:kbc_app_yt/views/quizintro.dart';
import 'package:kbc_app_yt/widgets/sidenevbar.dart';

import '../services/localdb.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name = "User Name";
  String money = "--";
  String lead = "---";
  String proUrl = "---";
  String level = "0";
  List quizzes = [];

  getUserDet() async {
    await LocalDB.getName().then((value) {
      setState(() {
        name = value.toString();
      });
    });
    await LocalDB.getMoney().then((value) {
      setState(() {
        money = value.toString();
      });
    });
    await LocalDB.getRank().then((value) {
      setState(() {
        lead = value.toString();
      });
    });
    await LocalDB.getUrl().then((value) {
      setState(() {
        proUrl = value.toString();
      });
    });
    await LocalDB.getLevel().then((value) {
      setState(() {
        level = value.toString();
      });
    });
  }
  getquiz() async {
    await HomeFire.getquizzes().then((returend_quizzes){
      setState(() {
        quizzes = returend_quizzes;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    getUserDet();
    getquiz();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KBC - Quiz Game")),
      drawer: SideNav(name, money, lead, proUrl, level),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CarouselSlider(
                items: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 180,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(backgroundColor: Colors.purple, radius: 30),
                    CircleAvatar(backgroundColor: Colors.redAccent, radius: 30),
                    CircleAvatar(backgroundColor: Colors.green, radius: 30),
                    CircleAvatar(
                      backgroundColor: Colors.yellowAccent,
                      radius: 30,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,

                            child: Container(
                              child: Image.network(
                                "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,
                            child: Container(
                              child: Image.network(
                                "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,
                            child: Container(
                              child: Image.network(
                                "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,
                            child: Container(
                              child: Image.network(
                                "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Stack(
                  children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top player in this list",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Last Updated 5 days ago",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              radius: 50,
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dhiraj Kumar",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Player ID - ABC554",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "Rs 55 Lakhs",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Unlock New Quizzes",
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),

              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: quizzes.length > 1
                          ? InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuizIntro(
                                quizAbout: quizzes[1]["about"],
                                quizImgUrl: quizzes[1]["url_pic"],
                                quizTopics: quizzes[1]["topics"],
                                quizName: quizzes[1]["quiz_name"],
                                quizDuration: quizzes[1]["duration"],
                                QuizId: quizzes[1]["Quizid"],
                              ),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Card(
                              elevation: 8,
                              child: Container(
                                child: Image.network(
                                  quizzes[1]["url_pic"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                          : Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),

                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,
                            child: Container(
                              child: Image.network(
                                "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,
                            child: Container(
                              child: Image.network(
                                "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,
                            child: Container(
                              child: Image.network(
                                "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,

                            child: Container(
                              child: Image.network(
                                "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,
                            child: Container(
                              child: Image.network(
                                "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Stack(
                  children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: Image.network(
                          "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              CarouselSlider(
                items: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1747956895655-163ff55bdc6e?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  height: 180,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(backgroundColor: Colors.purple, radius: 30),
                    CircleAvatar(backgroundColor: Colors.redAccent, radius: 30),
                    CircleAvatar(backgroundColor: Colors.green, radius: 30),

                  ],
                ),
              ),Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(backgroundColor: Colors.purple, radius: 30),
                    CircleAvatar(backgroundColor: Colors.redAccent, radius: 30),
                    CircleAvatar(backgroundColor: Colors.green, radius: 30),

                  ],
                ),
              ),Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(backgroundColor: Colors.purple, radius: 30),
                    CircleAvatar(backgroundColor: Colors.redAccent, radius: 30),
                    CircleAvatar(backgroundColor: Colors.green, radius: 30),

                  ],
                ),
              ),
              SizedBox(height: 15,),
              Text("V1.0.0 Made By Devloper Dhiraj", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),)

            ],
          ),
        ),
      ),
    );
  }
}
