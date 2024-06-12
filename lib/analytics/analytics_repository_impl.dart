import 'package:appainter/analytics/analytics.dart';
import 'package:appainter/home/home.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsRepositoryImpl extends AnalyticsRepository {
  AnalyticsRepositoryImpl({FirebaseAnalytics? firebaseAnalytics})
      : _firebaseAnalytics = firebaseAnalytics ??
            FirebaseAnalytics.instance; // coverage:ignore-line

  final FirebaseAnalytics _firebaseAnalytics;

  @override
  void logAppOpen() => _firebaseAnalytics.logAppOpen();

  @override
  void logSignIn() => _firebaseAnalytics.logLogin();

  @override
  void setUserId(String userId) => _firebaseAnalytics.setUserId(id: userId);

  @override
  void logChangeEditMode(EditMode editMode) {
    _logEvent(
      name: 'change_edit_mode',
      parameters: {
        'mode': editMode.name,
      },
    );
  }

  @override
  void logImportTheme(AnalyticsAction action) {
    _logEvent(
      name: 'import_theme',
      parameters: {
        'action': action.name,
      },
    );
  }

  @override
  void logExportTheme(AnalyticsAction action, EditMode editMode) {
    _logEvent(
      name: 'export_theme',
      parameters: {
        'action': action.name,
        'mode': editMode.name,
      },
    );
  }

  void _logEvent({
    required String name,
    required Map<String, Object> parameters,
  }) {
    _firebaseAnalytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}
