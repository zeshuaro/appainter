import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/app_bar_theme/cubit/app_bar_theme_cubit.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:flutter_theme/elevated_button_theme/elevated_button_theme.dart';
import 'package:flutter_theme/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/icon_theme/icon_theme.dart';
import 'package:flutter_theme/input_decoration_theme/input_decoration_theme.dart';
import 'package:flutter_theme/outlined_button_theme/outlined_button_theme.dart';
import 'package:flutter_theme/tab_bar_theme/tab_bar_theme.dart';
import 'package:flutter_theme/text_button_theme/text_button_theme.dart';
import 'package:flutter_theme/theme_preview/theme_preview.dart';

class ThemePreview extends StatelessWidget {
  final List<PreviewBody> _pages = const [
    ButtonsPage(),
    InputsPage(),
    SelectionsPage(),
    TextPage(),
  ];

  const ThemePreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final basicTheme = context.watch<BasicThemeCubit>().state.themeData;

        final appBarTheme = context.watch<AppBarThemeCubit>().state.theme;
        final tabBarTheme = context.watch<TabBarThemeCubit>().state.theme;
        final bottomNavigationBarTheme =
            context.watch<BottomNavigationBarThemeCubit>().state.theme;
        final floatingActionButtonTheme =
            context.watch<FloatingActionButtonThemeCubit>().state.theme;
        final elevatedButtonTheme =
            context.watch<ElevatedButtonThemeCubit>().state.theme;
        final outlinedButtonTheme =
            context.watch<OutlinedButtonThemeCubit>().state.theme;
        final textButtonTheme =
            context.watch<TextButtonThemeCubit>().state.theme;
        final iconTheme = context.watch<IconThemeCubit>().state.theme;
        final inputDecorationTheme =
            context.watch<InputDecorationThemeCubit>().state.theme;
        final advancedTheme =
            context.watch<AdvancedThemeCubit>().state.themeData.copyWith(
                  appBarTheme: appBarTheme,
                  tabBarTheme: tabBarTheme,
                  bottomNavigationBarTheme: bottomNavigationBarTheme,
                  floatingActionButtonTheme: floatingActionButtonTheme,
                  elevatedButtonTheme: elevatedButtonTheme,
                  outlinedButtonTheme: outlinedButtonTheme,
                  textButtonTheme: textButtonTheme,
                  iconTheme: iconTheme,
                  inputDecorationTheme: inputDecorationTheme,
                );

        final theme =
            state.editMode == EditMode.basic ? basicTheme : advancedTheme;

        return DevicePreview(builder: (context) {
          return MaterialApp(
            theme: theme,
            locale: DevicePreview.locale(context),
            useInheritedMediaQuery: true,
            home: DefaultTabController(
              length: _pages.length,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Theme Preview'),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.notifications),
                      onPressed: () {},
                    )
                  ],
                  bottom: TabBar(
                    tabs: _pages.map((page) {
                      return Tab(
                        icon: Icon(page.icon),
                        text: page.label,
                      );
                    }).toList(),
                  ),
                ),
                drawer: _Drawer(),
                body: TabBarView(
                  children: _pages,
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(Icons.add),
                ),
                bottomNavigationBar: _BottomNavigationBar(),
              ),
            ),
          );
        });
      },
    );
  }
}

class _Drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currIndex,
      onTap: (index) => setState(() => _currIndex = index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
    );
  }
}
