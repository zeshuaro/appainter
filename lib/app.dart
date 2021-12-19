import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/theme_repository/theme_repository.dart';

class MyApp extends StatelessWidget {
  final HomeRepo homeRepo;
  final ThemeRepository themeRepo;

  const MyApp({Key? key, required this.homeRepo, required this.themeRepo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => themeRepo,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => HomeCubit(homeRepo)),
          BlocProvider(create: (_) => BasicThemeCubit()),
          BlocProvider(create: (_) => AdvancedThemeCubit()),
        ],
        child: const MaterialApp(
          title: 'Flutter Theme',
          home: HomePage(),
        ),
      ),
    );
  }
}
