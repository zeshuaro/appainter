import 'package:appainter/home/home.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

enum AnalyticsAction { start, complete, incomplete }

class AnalyticsRepository {
  AnalyticsRepository({FirebaseAnalytics? firebaseAnalytics})
      : _firebaseAnalytics = firebaseAnalytics ??
            FirebaseAnalytics.instance; // coverage:ignore-line

  final FirebaseAnalytics _firebaseAnalytics;

  void logAppOpen() => _firebaseAnalytics.logAppOpen();

  void logSignIn() => _firebaseAnalytics.logLogin();

  void setUserId(String userId) => _firebaseAnalytics.setUserId(id: userId);

  void logChangeEditMode(EditMode editMode) {
    _logEvent(
      name: 'change_edit_mode',
      parameters: {
        'edit_mode': editMode.name,
      },
    );
  }

  void logImportTheme(AnalyticsAction action) {
    _logEvent(
      name: 'import_theme',
      parameters: {
        'action': action.name,
      },
    );
  }

  void _logEvent({
    required String name,
    required Map<String, Object?> parameters,
  }) {
    _firebaseAnalytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}
