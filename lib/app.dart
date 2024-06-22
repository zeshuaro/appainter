import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/analytics/analytics.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/font/font.dart';
import 'package:appainter/home/home.dart';
import 'package:appainter/icon_theme/icon_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  final HomeRepository homeRepo;
  final FontRepository fontRepo;
  final AnalyticsRepository analyticsRepo;

  const MyApp({
    super.key,
    required this.homeRepo,
    required this.fontRepo,
    required this.analyticsRepo,
  });

  @override
  Widget build(BuildContext context) {
    final colorThemeCubit = ColorThemeCubit();

    final appBarActionsIconThemeCubit = AppBarActionsIconThemeCubit();
    final appBarIconThemeCubit = AppBarIconThemeCubit();
    final appBarTitleTextStyleCubit = AppBarTitleTextStyleCubit();
    final appBarToolbarTextStyleCubit = AppBarToolbarTextStyleCubit();
    final appBarThemeCubit = AppBarThemeCubit(
      actionsIconThemeCubit: appBarActionsIconThemeCubit,
      iconThemeCubit: appBarIconThemeCubit,
      titleTextStyleCubit: appBarTitleTextStyleCubit,
      toolbarTextStyleCubit: appBarToolbarTextStyleCubit,
    );

    final tabBarLabelTextStyleCubit = TabBarLabelTextStyleCubit();
    final tabBarUnselectedLabelTextStyleCubit =
        TabBarUnselectedLabelTextStyleCubit();
    final tabBarThemeCubit = TabBarThemeCubit(
      labelTextStyleCubit: tabBarLabelTextStyleCubit,
      unselectedLabelTextStyleCubit: tabBarUnselectedLabelTextStyleCubit,
    );

    final bottomNavigationBarLabelTextStyleCubit =
        BottomNavigationBarLabelTextStyleCubit();
    final bottomNavigationBarUnselectedLabelTextStyleCubit =
        BottomNavigationBarUnselectedLabelTextStyleCubit();
    final bottomNavigationBarThemeCubit = BottomNavigationBarThemeCubit(
      labelTextStyleCubit: bottomNavigationBarLabelTextStyleCubit,
      unselectedLabelTextStyleCubit:
          bottomNavigationBarUnselectedLabelTextStyleCubit,
    );

    final floatingActionButtonThemeCubit = FloatingActionButtonThemeCubit();
    final elevatedButtonThemeCubit = ElevatedButtonThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );
    final filledButtonThemeCubit = FilledButtonThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );
    final outlinedButtonThemeCubit = OutlinedButtonThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );
    final textButtonThemeCubit = TextButtonThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );

    final iconThemeCubit = IconThemeCubit();
    final inputDecorationThemeCubit = InputDecorationThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );

    final switchThemeCubit = SwitchThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );
    final checkboxThemeCubit = CheckboxThemeCubit(
      colorThemeCubit: colorThemeCubit,
    );
    final radioThemeCubit = RadioThemeCubit(colorThemeCubit: colorThemeCubit);
    final sliderThemeCubit = SliderThemeCubit();

    final displayLargeTextStyleCubit = DisplayLargeTextStyleCubit();
    final displayMediumTextStyleCubit = DisplayMediumTextStyleCubit();
    final displaySmallTextStyleCubit = DisplaySmallTextStyleCubit();

    final headlineLargeTextStyleCubit = HeadlineLargeTextStyleCubit();
    final headlineMediumTextStyleCubit = HeadlineMediumTextStyleCubit();
    final headlineSmallTextStyleCubit = HeadlineSmallTextStyleCubit();

    final titleLargeTextStyleCubit = TitleLargeTextStyleCubit();
    final titleMediumTextStyleCubit = TitleMediumTextStyleCubit();
    final titleSmallTextStyleCubit = TitleSmallTextStyleCubit();

    final labelLargeTextStyleCubit = LabelLargeTextStyleCubit();
    final labelMediumTextStyleCubit = LabelMediumTextStyleCubit();
    final labelSmallTextStyleCubit = LabelSmallTextStyleCubit();

    final bodyLargeTextStyleCubit = BodyLargeTextStyleCubit();
    final bodyMediumTextStyleCubit = BodyMediumTextStyleCubit();
    final bodySmallTextStyleCubit = BodySmallTextStyleCubit();

    final textThemeCubit = TextThemeCubit(
      displayLargeTextStyleCubit: displayLargeTextStyleCubit,
      displayMediumTextStyleCubit: displayMediumTextStyleCubit,
      displaySmallTextStyleCubit: displaySmallTextStyleCubit,
      headlineLargeTextStyleCubit: headlineLargeTextStyleCubit,
      headlineMediumTextStyleCubit: headlineMediumTextStyleCubit,
      headlineSmallTextStyleCubit: headlineSmallTextStyleCubit,
      titleLargeTextStyleCubit: titleLargeTextStyleCubit,
      titleMediumTextStyleCubit: titleMediumTextStyleCubit,
      titleSmallTextStyleCubit: titleSmallTextStyleCubit,
      labelLargeTextStyleCubit: labelLargeTextStyleCubit,
      labelMediumTextStyleCubit: labelMediumTextStyleCubit,
      labelSmallTextStyleCubit: labelSmallTextStyleCubit,
      bodyLargeTextStyleCubit: bodyLargeTextStyleCubit,
      bodyMediumTextStyleCubit: bodyMediumTextStyleCubit,
      bodySmallTextStyleCubit: bodySmallTextStyleCubit,
    );

    final advancedThemeCubit = AdvancedThemeCubit(
      colorThemeCubit: colorThemeCubit,
      appBarThemeCubit: appBarThemeCubit,
      tabBarThemeCubit: tabBarThemeCubit,
      bottomNavigationBarThemeCubit: bottomNavigationBarThemeCubit,
      floatingActionButtonThemeCubit: floatingActionButtonThemeCubit,
      elevatedButtonThemeCubit: elevatedButtonThemeCubit,
      filledButtonThemeCubit: filledButtonThemeCubit,
      outlinedButtonThemeCubit: outlinedButtonThemeCubit,
      textButtonThemeCubit: textButtonThemeCubit,
      iconThemeCubit: iconThemeCubit,
      inputDecorationThemeCubit: inputDecorationThemeCubit,
      switchThemeCubit: switchThemeCubit,
      checkboxThemeCubit: checkboxThemeCubit,
      radioThemeCubit: radioThemeCubit,
      sliderThemeCubit: sliderThemeCubit,
      textThemeCubit: textThemeCubit,
    );

    return RepositoryProvider.value(
      value: fontRepo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => HomeCubit(
              homeRepo: homeRepo,
              analyticsRepo: analyticsRepo,
              advancedThemeCubit: advancedThemeCubit,
            ),
          ),
          BlocProvider(create: (_) => BasicThemeCubit()),
          BlocProvider(create: (_) => advancedThemeCubit),
          BlocProvider(create: (_) => colorThemeCubit),
          BlocProvider(create: (_) => appBarThemeCubit),
          BlocProvider(create: (_) => appBarActionsIconThemeCubit),
          BlocProvider(create: (_) => appBarIconThemeCubit),
          BlocProvider(create: (_) => appBarTitleTextStyleCubit),
          BlocProvider(create: (_) => appBarToolbarTextStyleCubit),
          BlocProvider(create: (_) => tabBarThemeCubit),
          BlocProvider(create: (_) => tabBarLabelTextStyleCubit),
          BlocProvider(create: (_) => tabBarUnselectedLabelTextStyleCubit),
          BlocProvider(create: (_) => bottomNavigationBarThemeCubit),
          BlocProvider(create: (_) => bottomNavigationBarLabelTextStyleCubit),
          BlocProvider(
            create: (_) => bottomNavigationBarUnselectedLabelTextStyleCubit,
          ),
          BlocProvider(create: (_) => floatingActionButtonThemeCubit),
          BlocProvider(create: (_) => elevatedButtonThemeCubit),
          BlocProvider(create: (_) => filledButtonThemeCubit),
          BlocProvider(create: (_) => outlinedButtonThemeCubit),
          BlocProvider(create: (_) => textButtonThemeCubit),
          BlocProvider(create: (_) => iconThemeCubit),
          BlocProvider(create: (_) => inputDecorationThemeCubit),
          BlocProvider(create: (_) => switchThemeCubit),
          BlocProvider(create: (_) => checkboxThemeCubit),
          BlocProvider(create: (_) => radioThemeCubit),
          BlocProvider(create: (_) => sliderThemeCubit),
          BlocProvider(create: (_) => textThemeCubit),
          BlocProvider(create: (_) => displayLargeTextStyleCubit),
          BlocProvider(create: (_) => displayMediumTextStyleCubit),
          BlocProvider(create: (_) => displaySmallTextStyleCubit),
          BlocProvider(create: (_) => headlineLargeTextStyleCubit),
          BlocProvider(create: (_) => headlineMediumTextStyleCubit),
          BlocProvider(create: (_) => headlineSmallTextStyleCubit),
          BlocProvider(create: (_) => titleLargeTextStyleCubit),
          BlocProvider(create: (_) => titleMediumTextStyleCubit),
          BlocProvider(create: (_) => titleSmallTextStyleCubit),
          BlocProvider(create: (_) => labelLargeTextStyleCubit),
          BlocProvider(create: (_) => labelMediumTextStyleCubit),
          BlocProvider(create: (_) => labelSmallTextStyleCubit),
          BlocProvider(create: (_) => bodyLargeTextStyleCubit),
          BlocProvider(create: (_) => bodyMediumTextStyleCubit),
          BlocProvider(create: (_) => bodySmallTextStyleCubit),
        ],
        child: const _MaterialApp(),
      ),
    );
  }
}

class _MaterialApp extends StatefulWidget {
  const _MaterialApp();

  @override
  State<_MaterialApp> createState() => _MaterialAppState();
}

class _MaterialAppState extends State<_MaterialApp> {
  final _seedColor = Colors.blue;

  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().themeModeFetched();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Appainter',
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: _seedColor,
            ),
          ),
          darkTheme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: _seedColor,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: state.themeMode,
          home: state.status == HomeStatus.success
              ? const HomePage()
              : const _LoadingPage(),
        );
      },
    );
  }
}

class _LoadingPage extends StatelessWidget {
  const _LoadingPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
