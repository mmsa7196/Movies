import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseManager {
  static Future<void> createAccount(
      {required String emailAddress,
      required String password,
      required Function onLoading,
      required Function onSuccess,
      required Function onError}) async {
    try {
      onLoading();
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      onSuccess();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.code);
      } else if (e.code == 'email-already-in-use') {
        onError(e.code);
      }
    } catch (e) {
      onError("Some thing is Wrong");
    }
  }

  static Future<void> logIn(
      {required String emailAddress,
      required String password,
      required Function onLoading,
      required Function onSuccess,
      required Function onError}) async {
    try {
      onLoading();
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      onSuccess();
    } on FirebaseAuthException catch (e) {
      onError("Invalid Email Or Password");
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
