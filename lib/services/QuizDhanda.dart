import 'package:cloud_firestore/cloud_firestore.dart';
import 'localdb.dart';

class QuizDhandha{
  static Future<bool> buyQuiz({required int QuizPrice, required String QuizID}) async {
    String user_id = "";
    bool paisaHaiKya = false;
    await LocalDB.getUserID().then((uID){
      user_id = uID!;
    });
    if (user_id == null) {
      print("User ID not found.");
      return false;
    }
    await FirebaseFirestore.instance.collection("users").doc(user_id).get().then((user){
     paisaHaiKya = QuizPrice <= user.data()!["money"];
    });
    if(paisaHaiKya){
      await FirebaseFirestore.instance.collection("users").doc(user_id).collection("unlocked_quiz").doc(QuizID).set(
        {"unlocked_at" : DateTime.now()}
      );
      print("Quiz is Unlocked Now");
      return true;
    }
    else{
      print("Paisaa Kamaa ke aao Pahlee");
      return false;
    }
  }
}