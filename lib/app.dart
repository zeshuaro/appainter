import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/elevated_button_theme/elevated_button_theme.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:appainter/icon_theme/icon_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/outlined_button_theme/outlined_button_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/text_button_theme/text_button_theme.dart';
import 'package:appainter/text_theme/text_theme.dart';

class MyApp extends StatelessWidget {
  final HomeRepository homeRepo;
  final TextThemeRepository textThemeRepo;

  const MyApp({
    Key? key,
    required this.homeRepo,
    required this.textThemeRepo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorThemeCubit = ColorThemeCubit();
    final appBarThemeCubit = AppBarThemeCubit();
    final tabBarThemeCubit = TabBarThemeCubit();
    final bottomNavigationBarThemeCubit = BottomNavigationBarThemeCubit();
    final floatingActionButtonThemeCubit = FloatingActionButtonThemeCubit();
    final elevatedButtonThemeCubit = ElevatedButtonThemeCubit();
    final outlinedButtonThemeCubit = OutlinedButtonThemeCubit();
    final textButtonThemeCubit = TextButtonThemeCubit();
    final iconThemeCubit = IconThemeCubit();
    final inputDecorationThemeCubit = InputDecorationThemeCubit();
    final switchThemeCubit = SwitchThemeCubit();
    final checkboxThemeCubit = CheckboxThemeCubit();
    final radioThemeCubit = RadioThemeCubit();
    final sliderThemeCubit = SliderThemeCubit();

    final headline1TextStyleCubit = Headline1TextStyleCubit();
    final headline2TextStyleCubit = Headline2TextStyleCubit();
    final headline3TextStyleCubit = Headline3TextStyleCubit();
    final headline4TextStyleCubit = Headline4TextStyleCubit();
    final headline5TextStyleCubit = Headline5TextStyleCubit();
    final headline6TextStyleCubit = Headline6TextStyleCubit();

    final subtitle1TextStyleCubit = Subtitle1TextStyleCubit();
    final subtitle2TextStyleCubit = Subtitle2TextStyleCubit();
    final bodyText1TextStyleCubit = BodyText1TextStyleCubit();
    final bodyText2TextStyleCubit = BodyText2TextStyleCubit();

    final buttonTextStyleCubit = ButtonTextStyleCubit();
    final captionTextStyleCubit = CaptionTextStyleCubit();
    final overlineTextStyleCubit = OverlineTextStyleCubit();

    final textThemeCubit = TextThemeCubit(
      headline1TextStyleCubit: headline1TextStyleCubit,
      headline2TextStyleCubit: headline2TextStyleCubit,
      headline3TextStyleCubit: headline3TextStyleCubit,
      headline4TextStyleCubit: headline4TextStyleCubit,
      headline5TextStyleCubit: headline5TextStyleCubit,
      headline6TextStyleCubit: headline6TextStyleCubit,
      subtitle1TextStyleCubit: subtitle1TextStyleCubit,
      subtitle2TextStyleCubit: subtitle2TextStyleCubit,
      bodyText1TextStyleCubit: bodyText1TextStyleCubit,
      bodyText2TextStyleCubit: bodyText2TextStyleCubit,
      buttonTextStyleCubit: buttonTextStyleCubit,
      captionTextStyleCubit: captionTextStyleCubit,
      overlineTextStyleCubit: overlineTextStyleCubit,
    );

    final advancedThemeCubit = AdvancedThemeCubit(
      colorThemeCubit: colorThemeCubit,
      appBarThemeCubit: appBarThemeCubit,
      tabBarThemeCubit: tabBarThemeCubit,
      bottomNavigationBarThemeCubit: bottomNavigationBarThemeCubit,
      floatingActionButtonThemeCubit: floatingActionButtonThemeCubit,
      elevatedButtonThemeCubit: elevatedButtonThemeCubit,
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
      value: textThemeRepo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HomeCubit(homeRepo, advancedThemeCubit)),
          BlocProvider(create: (_) => BasicThemeCubit()),
          BlocProvider(create: (_) => advancedThemeCubit),
          BlocProvider(create: (_) => colorThemeCubit),
          BlocProvider(create: (_) => appBarThemeCubit),
          BlocProvider(create: (_) => tabBarThemeCubit),
          BlocProvider(create: (_) => bottomNavigationBarThemeCubit),
          BlocProvider(create: (_) => floatingActionButtonThemeCubit),
          BlocProvider(create: (_) => elevatedButtonThemeCubit),
          BlocProvider(create: (_) => outlinedButtonThemeCubit),
          BlocProvider(create: (_) => textButtonThemeCubit),
          BlocProvider(create: (_) => iconThemeCubit),
          BlocProvider(create: (_) => inputDecorationThemeCubit),
          BlocProvider(create: (_) => switchThemeCubit),
          BlocProvider(create: (_) => checkboxThemeCubit),
          BlocProvider(create: (_) => radioThemeCubit),
          BlocProvider(create: (_) => sliderThemeCubit),
          BlocProvider(create: (_) => textThemeCubit),
          BlocProvider(create: (_) => headline1TextStyleCubit),
          BlocProvider(create: (_) => headline2TextStyleCubit),
          BlocProvider(create: (_) => headline3TextStyleCubit),
          BlocProvider(create: (_) => headline4TextStyleCubit),
          BlocProvider(create: (_) => headline5TextStyleCubit),
          BlocProvider(create: (_) => headline6TextStyleCubit),
          BlocProvider(create: (_) => subtitle1TextStyleCubit),
          BlocProvider(create: (_) => subtitle2TextStyleCubit),
          BlocProvider(create: (_) => bodyText1TextStyleCubit),
          BlocProvider(create: (_) => bodyText2TextStyleCubit),
          BlocProvider(create: (_) => buttonTextStyleCubit),
          BlocProvider(create: (_) => captionTextStyleCubit),
          BlocProvider(create: (_) => overlineTextStyleCubit),
        ],
        child: const _MaterialApp(),
      ),
    );
  }
}

class _MaterialApp extends StatefulWidget {
  const _MaterialApp({Key? key}) : super(key: key);

  @override
  State<_MaterialApp> createState() => _MaterialAppState();
}

class _MaterialAppState extends State<_MaterialApp> {
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
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
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
  const _LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
