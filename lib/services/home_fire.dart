import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getUnlockedQuizzes(String userId) async {
  List<Map<String, dynamic>> all_quiz = [];

  QuerySnapshot querySnapshot =
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("unlocked_quiz")
          .get();

  if (querySnapshot.docs.isEmpty) {
    print("⚠️ No unlocked quizzes found.");
    return all_quiz;
  }

  for (var quiz in querySnapshot.docs) {
    Map<String, dynamic> myQuiz = quiz.data() as Map<String, dynamic>;
    myQuiz["Quizid"] = quiz.reference.id;
    print("Without adding my myQuiz, all_quiz is ${quiz.data()}");
    all_quiz.add(myQuiz);
    print("After adding my myQuiz, all_quiz is ${quiz.data()}");
  }

  return all_quiz;
}
