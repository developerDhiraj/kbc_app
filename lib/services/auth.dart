import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kbc_app_yt/services/localdb.dart';
import 'firedb.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<User?> signWithGoogle() async {
  try {
    final GoogleSignInAccount? googlesignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googlesignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    final usercredential = await _auth.signInWithCredential(credential);
    final User? user = usercredential.user;

    assert(!user!.isAnonymous);
    assert(await user!.getIdToken() != null);

    final User? currentUser = await _auth.currentUser;
    assert(currentUser!.uid == user!.uid);
    print(user);
    await FireDB().createNewUser(
      user!.displayName.toString(),
      user.email.toString(),
      user.photoURL.toString(),
      user.uid.toString(),
    );
    await LocalDB.saveUserID(user.uid);
  } catch (e) {
    print("Error occured in Sign In");
    print(e);
  }
}
Future<String> signOut() async {
  await _auth.signOut();
  await googleSignIn.signOut();
  await LocalDB.saveUserID("");
  return "Signed Out";
}
