import 'package:cloud_firestore/cloud_firestore.dart';

class HomeFire{
  static Future<List<Map<String, dynamic>>> getquizzes() async {
    List<Map<String, dynamic>> all_quiz = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("quizzes").get();

    if (querySnapshot.docs.isEmpty) {
      print("⚠️ No quizzes found.");
      return all_quiz;
    }

    for (var quiz in querySnapshot.docs) {
      Map<String, dynamic> myQuiz = quiz.data() as Map<String, dynamic>;
      myQuiz["Quizid"] = quiz.reference.id;
      all_quiz.add(myQuiz);
    }

    return all_quiz;
  }
}