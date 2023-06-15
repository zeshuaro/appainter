import 'package:appainter/analytics/analytics_repository_impl.dart';
import 'package:appainter/authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

class MockAnalyticsRepository extends Mock implements AnalyticsRepositoryImpl {}

void main() {
  late AuthenticationRepository authRepo;
  late AnalyticsRepositoryImpl analyticsRepo;
  late FirebaseAuth firebaseAuth;
  late User user;
  late UserCredential credential;

  setUp(() {
    firebaseAuth = MockFirebaseAuth();
    user = MockUser();
    credential = MockUserCredential();
    analyticsRepo = MockAnalyticsRepository();

    authRepo = AuthenticationRepository(
      firebaseAuth: firebaseAuth,
      analyticsRepo: analyticsRepo,
    );
  });

  test('emits signed in user', () async {
    const userId = 'userId';
    when(() => user.uid).thenReturn(userId);
    when(() => firebaseAuth.authStateChanges()).thenAnswer(
      (_) => Stream.value(user),
    );

    await expectLater(authRepo.user, emits(user));

    verify(() => analyticsRepo.setUserId(userId)).called(1);
    verifyNever(() => firebaseAuth.signInAnonymously());
    verifyNever(() => analyticsRepo.logSignIn());
  });

  test('emits newly signed in user', () async {
    when(() => firebaseAuth.authStateChanges()).thenAnswer(
      (_) => Stream.value(null),
    );
    when(() => credential.user).thenReturn(user);
    when(() => firebaseAuth.signInAnonymously()).thenAnswer(
      (_) => Future.value(credential),
    );

    await expectLater(authRepo.user, emits(user));
    verify(() => firebaseAuth.signInAnonymously()).called(1);
    verify(() => analyticsRepo.logSignIn()).called(1);
  });
}
