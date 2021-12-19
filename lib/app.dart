import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/home/home.dart';

class MyApp extends StatelessWidget {
  final HomeRepo homeRepo;

  const MyApp({Key? key, required this.homeRepo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit(homeRepo)),
        BlocProvider(create: (_) => BasicThemeCubit()),
        BlocProvider(create: (_) => AdvancedThemeCubit()),
      ],
      child: const MaterialApp(
        title: 'Flutter Theme',
        home: HomePage(),
      ),
    );
  }
}
