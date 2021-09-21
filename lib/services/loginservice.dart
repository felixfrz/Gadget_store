import 'package:course_store/models/loginusermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
  LoginService() {
    Firebase
        .initializeApp(); // 1. This is required before using the firebase instance
  }
  LoginUserModel _userModel;
  LoginUserModel get loggedInUserModel => _userModel;

  //=================================
  // 2. let's a method called signInWithGoogle that return a future of type boolean with async keyword bcecause some of the task will be asynchronous and needed to be waited on.
  Future<bool> signInWithGoogle() async {
    // 3. Trigger the authentication flow by creating by instantiating the google signing component.
    GoogleSignIn googleSignIn = GoogleSignIn();
    //4. fetch the google signing account information by calling the signing method out of it
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    //5. i will do a simple validation and check if the google signin is null or not and return otherwise proceed
    if (googleUser == null) {
      return false;
    }
    // 6. Obtain the auth details from the request type GoogleSignInAuthentication out of authentication from the googleUser refrence
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    //7  Create a new credential out of
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //8.  Once signed in, return the UserCredential
    UserCredential userCreds =
        await FirebaseAuth.instance.signInWithCredential(credential);
    if (userCreds != null) {
      // ignore: todo
      //TODO: collect user info here
      _userModel = LoginUserModel(
          displayName: userCreds.user.displayName,
          photoUrl: userCreds.user.photoURL,
          email: userCreds.user.email);
    }
    return true;
  }

  Future<void> signOut() async {
    await GoogleSignIn().signOut();
    _userModel = null;
  }
}
