import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  AuthenticationRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth =
            firebaseAuth ?? FirebaseAuth.instance; // coverage:ignore-line

  final FirebaseAuth _firebaseAuth;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().asyncMap((user) async {
      if (user != null) {
        return user;
      }
      return await _signInAnonymously();
    });
  }

  Future<User> _signInAnonymously() async {
    final credential = await _firebaseAuth.signInAnonymously();
    return credential.user!;
  }
}
