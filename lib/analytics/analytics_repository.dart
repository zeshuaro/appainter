import 'package:appainter/home/home.dart';

enum AnalyticsAction { start, complete, incomplete }

abstract class AnalyticsRepository {
  void logAppOpen();

  void logSignIn();

  void setUserId(String userId);

  void logChangeEditMode(EditMode editMode);

  void logImportTheme(AnalyticsAction action);

  void logExportTheme(AnalyticsAction action, EditMode editMode);
}
