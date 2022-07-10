import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsRepository {
  AnalyticsRepository({FirebaseAnalytics? firebaseAnalytics})
      : _firebaseAnalytics = firebaseAnalytics ??
            FirebaseAnalytics.instance; // coverage:ignore-line

  final FirebaseAnalytics _firebaseAnalytics;

  void logAppOpen() => _firebaseAnalytics.logAppOpen();

  void logSignIn() => _firebaseAnalytics.logLogin();

  void setUserId(String userId) => _firebaseAnalytics.setUserId(id: userId);
}
