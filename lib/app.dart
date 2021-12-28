import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/color_theme/color_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/icon_theme/icon_theme.dart';
import 'package:flutter_theme/input_decoration_theme/input_decoration_theme.dart';
import 'package:flutter_theme/outlined_button_theme/outlined_button_theme.dart';
import 'package:flutter_theme/switch_theme/switch_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';

class MyApp extends StatelessWidget {
  final HomeRepository homeRepo;

  const MyApp({Key? key, required this.homeRepo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

    final colorThemeCubit = ColorThemeCubit(
      appBarThemeCubit: appBarThemeCubit,
      bottomNavigationBarThemeCubit: bottomNavigationBarThemeCubit,
      floatingActionButtonThemeCubit: floatingActionButtonThemeCubit,
      elevatedButtonThemeCubit: elevatedButtonThemeCubit,
      outlinedButtonThemeCubit: outlinedButtonThemeCubit,
      textButtonThemeCubit: textButtonThemeCubit,
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
    );

    return MultiBlocProvider(
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
      ],
      child: const MaterialApp(
        title: 'Flutter Theme',
        home: HomePage(),
      ),
    );
  }
}
