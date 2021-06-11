import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'basic_theme/basic_theme.dart';
import 'cubits/cubits.dart';
import 'home/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeCubit()),
        BlocProvider(create: (_) => BasicThemeCubit()),
        BlocProvider(create: (_) => AdvancedThemeCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Theme',
        home: HomePage(),
      ),
    );
  }
}
