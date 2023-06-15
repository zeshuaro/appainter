import 'package:appainter/analytics/analytics.dart';
import 'package:appainter/home/home.dart';

/// Used for Windows and Linux as firebase_analytics is not supported
class EmptyAnalyticsRepository extends AnalyticsRepository {
  @override
  void logAppOpen() {}

  @override
  void logSignIn() {}

  @override
  void setUserId(String userId) {}

  @override
  void logChangeEditMode(EditMode editMode) {}

  @override
  void logExportTheme(AnalyticsAction action, EditMode editMode) {}

  @override
  void logImportTheme(AnalyticsAction action) {}
}
