import 'package:firebase_auth/firebase_auth.dart';

class AuthHelper {
  static final AuthHelper _instance = AuthHelper._internal();

  factory AuthHelper() {
    return _instance;
  }

  AuthHelper._internal();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+44 7123 123 456',
        verificationCompleted: (PhoneAuthCredential credential) {
          // Handle verification completion
        },
        verificationFailed: (FirebaseAuthException e) {
          // Handle verification failure
        },
        codeSent: (String verificationId, int? resendToken) {
          // Handle code sent
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto retrieval timeout
        },
      );
    } catch (e) {
      // Handle exceptions
    }
  }
}

//create user obj based on Firebase user

//auth change user stream
// Stream<User> get user {
// return
// }
//sign in with phone & password
//register with phone & email & password
//sign out
