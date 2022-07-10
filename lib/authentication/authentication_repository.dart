import 'package:appainter/analytics/analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required this.analyticsRepo,
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth =
            firebaseAuth ?? FirebaseAuth.instance; // coverage:ignore-line

  final FirebaseAuth _firebaseAuth;
  final AnalyticsRepository analyticsRepo;

  Stream<User> get user {
    return _firebaseAuth.authStateChanges().asyncMap((user) async {
      if (user != null) {
        analyticsRepo.setUserId(user.uid);
        return user;
      }
      return await _signInAnonymously();
    });
  }

  Future<User> _signInAnonymously() async {
    final credential = await _firebaseAuth.signInAnonymously();
    analyticsRepo.logSignIn();
    return credential.user!;
  }
}
