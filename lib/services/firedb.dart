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
        "money": "0",
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

    // if (await getUser()) {
    //   print("User already exist");
    // } else {
    //   await FirebaseFirestore.instance
    //       .collection("users")
    //       .doc(current_user!.uid)
    //       .set({
    //         "name": name,
    //         "email": email,
    //         "photoUrl": photoUrl,
    //         "money": "0",
    //          "rank" : "NA",
    //           "level" : "0"
    //       })
    //       .then((value) async{
    //         await LocalDB.saveMoney("0");
    //         await LocalDB.saveRank("NA");
    //         await LocalDB.saveLevel("0");
    //         print("User Register Succcesfully");
    //       });
    // }
  }

  Future<bool> getUser() async {
    final User? current_user = _auth.currentUser;
    String user = "";


    if (user.toString() == "null") {
      return false;
    } else {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(current_user!.uid)
          .get()
          .then((value) async {
        user = value.data().toString();
        await LocalDB.saveMoney(value["money"]);
        await LocalDB.saveRank(value["rank"]);
        await LocalDB.saveLevel(value["level"]);

      });
      return true;
    }
  }


  // Future<bool> getUser() async {
  //   final User? current_user = _auth.currentUser;
  //
  //   if (current_user == null) return false;
  //
  //   final doc = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(current_user.uid)
  //       .get();
  //
  //   if (!doc.exists) {
  //     return false;
  //   }
  //
  //   final data = doc.data();
  //   if (data != null) {
  //     await LocalDB.saveMoney(data["money"]);
  //     await LocalDB.saveRank(data["rank"]);
  //     await LocalDB.saveLevel(data["level"]);
  //   }
  //
  //   return true;
  // }

}
