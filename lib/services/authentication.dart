import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vonette_web/models/user.dart';
import 'package:vonette_web/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: "1024503668914-o5qnvp4kp7unmo2qumug26i3rcoa71c5.apps.googleusercontent.com"
  );

  String _getMessageFromErrorCode(String e) {
    switch (e) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email Already Used By Other User.";
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong Email/Password Combination.";
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No User Found With This Email.";
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User Disabled By Administrator";
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too Many Login Requests";
      case "ERROR_OPERATION_NOT_ALLOWED":
        return "Server Error, Please Try Again Later.";
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email Address Is Invalid.";
      case "requires-recent-login":
        return "This Operation Is Sensitive And Requires Recent Authentication. Login Again.";
      default:
        return "Login failed. Please Try Again.";
    }
  }

  // create user obj based on firebase User?
  UserInApp? _userFromFirebase(User? user) {
    return user != null
        ? UserInApp(
            uid: user.uid, email: user.email, username: user.displayName, profileUrl: user.photoURL)
        : null;
  }

  // returns the current user state; this is monitored by the provider
  // service in several files. Check main.dart as example
  Stream<UserInApp?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user));
  }

  Future get signInWithGoogle async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      UserCredential result = await _auth.signInWithCredential(authCredential);

      User? user = result.user;
      UserInApp? userInApp = _userFromFirebase(user);
      List docs = await DatabaseService(user: userInApp).getUIDList;
      
      for(String s in docs) {
        if (s == user?.uid) {
          return [userInApp];
        }
      }
      await DatabaseService(user: userInApp).firstTimeCreateDM(user?.photoURL);
      return [userInApp];
      
    } on FirebaseAuthException catch (e) {
      String error = _getMessageFromErrorCode(e.code);
      return [null, error];
    }
  }

  // signout method for user
  Future signOut() async {
    try {
      await _googleSignIn.signOut();
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


}
