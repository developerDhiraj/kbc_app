import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class QuizQueCreator{


  static Future<Map> genQuizQue(String quizID, int queMoney) async {
    late Map queData;
    await FirebaseFirestore.instance.collection("quizzes").doc(quizID).collection("questions").where("money",isEqualTo: queMoney).get().then((value){
      //Task - Generate a rendom number between 0 to value.docs.length


      if (value.docs.isEmpty) {
        print("⚠️ No questions found for money = $queMoney");
        return;
      }
      int randomIndex = Random().nextInt(value.docs.length);
      queData = value.docs.elementAt(randomIndex).data();
    });
    print(queData);
    return queData;
  }

}