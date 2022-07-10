import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  AuthenticationRepository({FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().asyncMap((firebaseUser) async {
      if (firebaseUser != null) {
        return firebaseUser;
      }
      return await signInAnonymously();
    });
  }

  Future<User> signInAnonymously() async {
    final credentials = await _firebaseAuth.signInAnonymously();
    return credentials.user!;
  }
}
