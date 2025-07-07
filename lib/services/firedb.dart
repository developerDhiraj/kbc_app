import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;
import 'package:kbc_app_yt/services/localdb.dart';

class FireDB {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  createNewUser(String name, String email, String photoUrl, String uid) async {
    final User? current_user = _auth.currentUser;
    print("Checking if user exists...");
    if (await getUser()) {
      print("User already exists, not creating again.");
    } else {
      print("Creating new user document...");
      await FirebaseFirestore.instance
          .collection("users")
          .doc(current_user!.uid)
          .set({
        "name": name,
        "email": email,
        "photoUrl": photoUrl,
        "money": 0,
        "rank": "NA",
        "level": "0"
      })
          .then((value) async {
        await LocalDB.saveMoney("0");
        await LocalDB.saveRank("NA");
        await LocalDB.saveLevel("0");
        print("✅ User registered successfully in Firestore.");
      }).catchError((e) {
        print("❌ Firestore error: $e");
      });
    }
  }

  static  updateMoney(int amount) async{
    final FirebaseAuth _myauth = FirebaseAuth.instance;
    await FirebaseFirestore.instance.collection("users").doc(_myauth.currentUser!.uid).get().then((value) async{
      await LocalDB.saveMoney((value.data()!["money"] + amount).toString());
      await FirebaseFirestore.instance.collection("users").doc(_myauth.currentUser!.uid).update(
          {"money" : value.data()!["money"] + amount}
      );
    });
  }


  Future<bool> getUser() async {
    final User? current_user = _auth.currentUser;

    if (current_user == null) return false;
    print(current_user.uid);

    final doc = await FirebaseFirestore.instance
        .collection("users")
        .doc(current_user.uid)
        .get();

    if (!doc.exists) {
      print("⚠️ User document not found.");

      return false;
    }

    final data = doc.data();
    if (data == null) {
      print("⚠️ User document exists but data is null.");
      return false;
    }

    if (data != null) {
      await LocalDB.saveMoney(data["money"]);
      await LocalDB.saveRank(data["rank"]);
      await LocalDB.saveLevel(data["level"]);
      print("User document exists and fetching the data");
    }

    return true;
  }

}
