import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // login l = new login();
  final FirebaseAuth _firebaseAuth;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  AuthService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  Future<void> signout() async {
    await _firebaseAuth.signOut();
  }

// getuid

// signinwithgoogle
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // Future<Void> signInWithGoogle() async {
  //   bool isSignedIn = await _googleSignIn.isSignedIn();
  //   final GoogleSignInAccount account = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication _googleAuth = await account.authentication;
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: _googleAuth.accessToken, idToken: _googleAuth.idToken);
  // }

// signin with email and password
  Future<String> signin({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'signedin';
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "${e.message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return e.message;
    } catch (e) {
      print("error in catch $e");
    }
    return 'finished processing';
  }

// signup with email and password
  Future<String> signup({String email, String password}) async {
    try {
      print("Username:$email");
      print("Password:$password");
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'signed up';
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "${e.message}",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
      return e.message;
    } catch (e) {}
    return 'finished';
  }
}
