import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kbc_app_yt/services/localdb.dart';

class CheckQuizUnlock {
  static Future<bool> checkQuizUnlockStatus(String quiz_doc_id) async {
    String? user_id = await LocalDB.getUserID();

    final docSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(user_id)
        .collection("unlocked_quiz")
        .doc(quiz_doc_id)
        // .doc("NjyQj0l3kUCjJkkfZbdj")
        .get();
    print("In file checkQuizUnlock, the quiz_doc_id : $quiz_doc_id");


    return docSnapshot.exists;
  }
}
