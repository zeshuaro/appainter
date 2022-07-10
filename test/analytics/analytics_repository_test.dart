import 'package:appainter/analytics/analytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAnalytics extends Mock implements FirebaseAnalytics {}

void main() {
  late AnalyticsRepository repo;
  late FirebaseAnalytics firebaseAnalytics;

  setUp(() {
    firebaseAnalytics = MockFirebaseAnalytics();
    repo = AnalyticsRepository(
      firebaseAnalytics: firebaseAnalytics,
    );
  });

  test('logs app open', () async {
    when(() => firebaseAnalytics.logAppOpen()).thenAnswer((_) async {});
    repo.logAppOpen();
    verify(() => firebaseAnalytics.logAppOpen()).called(1);
  });

  test('logs sign in', () async {
    when(() => firebaseAnalytics.logLogin()).thenAnswer((_) async {});
    repo.logSignIn();
    verify(() => firebaseAnalytics.logLogin()).called(1);
  });

  test('sets user ID', () async {
    const userId = 'userId';
    when(() => firebaseAnalytics.setUserId(id: userId)).thenAnswer(
      (_) async {},
    );
    repo.setUserId(userId);
    verify(() => firebaseAnalytics.setUserId(id: userId)).called(1);
  });
}
