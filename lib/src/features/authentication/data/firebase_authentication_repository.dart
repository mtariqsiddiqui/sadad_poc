import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  String? errorCode;

  Future<String> signIn({required String email, required String password}) async {
    if (kDebugMode) {
      print('>> signIn');
    }
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      if (kDebugMode) {
        print("Signed In successfully!");
      }
      return "Signed In";
    } on FirebaseAuthException catch (errorCode) {
      print("${errorCode.code}, ${errorCode.message}");
      if (errorCode.code == 'user-not-found') {
        return "No user found for that email.";
      } else if (errorCode.code == 'wrong-password') {
        return "Wrong password provided for that user.";
      } else {
        return "Something Went Wrong.";
      }
    }
  }

  Future<Object> signUp({required String email, required String password, required String username}) async {
    try {
      if (kDebugMode) {
        print('>> signUp');
        print('$email $password $username');
      }
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if (_firebaseAuth.currentUser != null) await _firebaseAuth.currentUser?.updateProfile(displayName: username);

      if (kDebugMode) {
        print('<< signUp');
      }
      return "Signed Up";
    } on FirebaseAuthException catch (errorCode) {
      if (errorCode.code == 'weak-password') {
        return "The password provided is too weak.";
      } else if (errorCode.code == 'email-already-in-use') {
        return "The account already exists for that email.";
      } else {
        return "Something Went Wrong.";
      }
    } catch (errorCode) {
      print(errorCode);
      return errorCode;
    }
  }

  Future<void> signOut() async {
    if(kDebugMode) {
      print('>> signOut');
    }
    await _firebaseAuth.signOut();
    if(kDebugMode) {
      print('<< signOut');
    }
  }

  String getMessageFromErrorCode(errorCode) {
    switch (errorCode) {
      case "ERROR_EMAIL_ALREADY_IN_USE":
      case "account-exists-with-different-credential":
      case "email-already-in-use":
        return "Email already used. Go to login page.";
        break;
      case "ERROR_WRONG_PASSWORD":
      case "wrong-password":
        return "Wrong email/password combination.";
        break;
      case "ERROR_USER_NOT_FOUND":
      case "user-not-found":
        return "No user found with this email.";
        break;
      case "ERROR_USER_DISABLED":
      case "user-disabled":
        return "User disabled.";
        break;
      case "ERROR_TOO_MANY_REQUESTS":
      case "operation-not-allowed":
        return "Too many requests to log into this account.";
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
      case "operation-not-allowed":
        return "Server error, please try again later.";
        break;
      case "ERROR_INVALID_EMAIL":
      case "invalid-email":
        return "Email address is invalid.";
      // break;
      default:
        return "Login failed. Please try again.";
        break;
    }
  }
}