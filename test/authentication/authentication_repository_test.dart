import 'package:appainter/authentication/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late AuthenticationRepository repo;
  late FirebaseAuth firebaseAuth;
  late User user;
  late UserCredential credential;

  setUp(() {
    firebaseAuth = MockFirebaseAuth();
    user = MockUser();
    credential = MockUserCredential();

    repo = AuthenticationRepository(
      firebaseAuth: firebaseAuth,
    );
  });

  test('emits signed in user', () async {
    when(() => firebaseAuth.authStateChanges()).thenAnswer(
      (_) => Stream.value(user),
    );
    await expectLater(repo.user, emits(user));
    verifyNever(() => firebaseAuth.signInAnonymously());
  });

  test('emits newly signed in user', () async {
    when(() => firebaseAuth.authStateChanges()).thenAnswer(
      (_) => Stream.value(null),
    );
    when(() => credential.user).thenReturn(user);
    when(() => firebaseAuth.signInAnonymously()).thenAnswer(
      (_) => Future.value(credential),
    );

    await expectLater(repo.user, emits(user));
    verify(() => firebaseAuth.signInAnonymously()).called(1);
  });
}
