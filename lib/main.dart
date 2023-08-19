import 'package:appainter/analytics/analytics.dart';
import 'package:appainter/authentication/authentication.dart';
import 'package:appainter/firebase_options.dart';
import 'package:appainter/font/font.dart';
import 'package:appainter/home/home.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:universal_io/io.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  EquatableConfig.stringify = kDebugMode;

  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      size: Size(1350, 850),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.maximize();
      await windowManager.show();
      await windowManager.focus();
    });
  }

  if (kDebugMode) {
    _runApp();
  } else {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://47d366aa51604755b3d78635f1e320be@o1248621.ingest.sentry.io/6680781';
        options.tracesSampleRate = 1.0;
      },
      appRunner: _runApp,
    );
  }
}

Future<void> _runApp() async {
  late final AnalyticsRepository analyticsRepo;
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    analyticsRepo = AnalyticsRepositoryImpl();
    final authRepo = AuthenticationRepository(analyticsRepo: analyticsRepo);
    await authRepo.user.first;
    analyticsRepo.logAppOpen();
  } else {
    analyticsRepo = EmptyAnalyticsRepository();
  }

  runApp(MyApp(
    homeRepo: HomeRepository(),
    fontRepo: FontRepository(),
    analyticsRepo: analyticsRepo,
  ));
}
