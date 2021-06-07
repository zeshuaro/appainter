import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/cubits.dart';
import 'src/home_page.dart';

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
