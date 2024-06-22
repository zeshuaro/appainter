import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/app_bar_theme/cubit/app_bar_theme_cubit.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/bottom_navigation_bar_theme/bottom_navigation_bar_theme.dart';
import 'package:appainter/button_theme/button_theme.dart';
import 'package:appainter/checkbox_theme/checkbox_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/floating_action_button_theme/floating_action_button_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:appainter/icon_theme/icon_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/radio_theme/radio_theme.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:appainter/switch_theme/switch_theme.dart';
import 'package:appainter/tab_bar_theme/tab_bar_theme.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:appainter/theme_preview/theme_preview.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemePreview extends StatelessWidget {
  final List<PreviewBody> _pages = const [
    ButtonsPage(),
    InputsPage(),
    SelectionsPage(),
    TextPage(),
  ];

  const ThemePreview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final basicTheme = context.watch<BasicThemeCubit>().state.theme;

        final advancedThemeState = context.watch<AdvancedThemeCubit>().state;
        final colorTheme = context.watch<ColorThemeCubit>().state;
        final appBarTheme = context.watch<AppBarThemeCubit>().state.theme;
        final tabBarTheme = context.watch<TabBarThemeCubit>().state.theme;
        final bottomNavigationBarTheme =
            context.watch<BottomNavigationBarThemeCubit>().state.theme;
        final floatingActionButtonTheme =
            context.watch<FloatingActionButtonThemeCubit>().state.theme;
        final elevatedButtonTheme = ElevatedButtonThemeData(
          style: context.watch<ElevatedButtonThemeCubit>().state.style,
        );
        final filledButtonTheme = FilledButtonThemeData(
          style: context.watch<FilledButtonThemeCubit>().state.style,
        );
        final outlinedButtonTheme = OutlinedButtonThemeData(
          style: context.watch<OutlinedButtonThemeCubit>().state.style,
        );
        final textButtonTheme = TextButtonThemeData(
          style: context.watch<TextButtonThemeCubit>().state.style,
        );
        final iconTheme = context.watch<IconThemeCubit>().state.theme;
        final inputDecorationTheme =
            context.watch<InputDecorationThemeCubit>().state.theme;
        final switchTheme = context.watch<SwitchThemeCubit>().state.theme;
        final checkboxTheme = context.watch<CheckboxThemeCubit>().state.theme;
        final radioTheme = context.watch<RadioThemeCubit>().state.theme;
        final sliderTheme = context.watch<SliderThemeCubit>().state.theme;
        final fontFamily = context.watch<TextThemeCubit>().state.fontFamily;

        final displayLargeTextStyle =
            context.watch<DisplayLargeTextStyleCubit>().state.style;
        final displayMediumTextStyle =
            context.watch<DisplayMediumTextStyleCubit>().state.style;
        final displaySmallTextStyle =
            context.watch<DisplaySmallTextStyleCubit>().state.style;

        final headlineLargeTextStyle =
            context.watch<HeadlineLargeTextStyleCubit>().state.style;
        final headlineMediumTextStyle =
            context.watch<HeadlineMediumTextStyleCubit>().state.style;
        final headlineSmallTextStyle =
            context.watch<HeadlineSmallTextStyleCubit>().state.style;

        final titleLargeTextStyle =
            context.watch<TitleLargeTextStyleCubit>().state.style;
        final titleMediumTextStyle =
            context.watch<TitleMediumTextStyleCubit>().state.style;
        final titleSmallTextStyle =
            context.watch<TitleSmallTextStyleCubit>().state.style;

        final labelLargeTextStyle =
            context.watch<LabelLargeTextStyleCubit>().state.style;
        final labelMediumTextStyle =
            context.watch<LabelMediumTextStyleCubit>().state.style;
        final labelSmallTextStyle =
            context.watch<LabelSmallTextStyleCubit>().state.style;

        final bodyLargeTextStyle =
            context.watch<BodyLargeTextStyleCubit>().state.style;
        final bodyMediumTextStyle =
            context.watch<BodyMediumTextStyleCubit>().state.style;
        final bodySmallTextStyle =
            context.watch<BodySmallTextStyleCubit>().state.style;

        final advancedTheme = ThemeData(
          useMaterial3: advancedThemeState.useMaterial3,
          fontFamily: fontFamily,
          colorScheme: colorTheme.colorScheme,
          brightness: colorTheme.colorScheme.brightness,
          primaryColor: colorTheme.primaryColor,
          primaryColorLight: colorTheme.primaryColorLight,
          primaryColorDark: colorTheme.primaryColorDark,
          canvasColor: colorTheme.canvasColor,
          cardColor: colorTheme.cardColor,
          dialogBackgroundColor: colorTheme.dialogBackgroundColor,
          disabledColor: colorTheme.disabledColor,
          dividerColor: colorTheme.dividerColor,
          focusColor: colorTheme.focusColor,
          highlightColor: colorTheme.highlightColor,
          hintColor: colorTheme.hintColor,
          hoverColor: colorTheme.hoverColor,
          indicatorColor: colorTheme.indicatorColor,
          scaffoldBackgroundColor: colorTheme.scaffoldBackgroundColor,
          secondaryHeaderColor: colorTheme.secondaryHeaderColor,
          shadowColor: colorTheme.shadowColor,
          splashColor: colorTheme.splashColor,
          unselectedWidgetColor: colorTheme.unselectedWidgetColor,
          appBarTheme: appBarTheme,
          tabBarTheme: tabBarTheme,
          bottomNavigationBarTheme: bottomNavigationBarTheme,
          floatingActionButtonTheme: floatingActionButtonTheme,
          elevatedButtonTheme: elevatedButtonTheme,
          filledButtonTheme: filledButtonTheme,
          outlinedButtonTheme: outlinedButtonTheme,
          textButtonTheme: textButtonTheme,
          iconTheme: iconTheme,
          inputDecorationTheme: inputDecorationTheme,
          switchTheme: switchTheme,
          checkboxTheme: checkboxTheme,
          radioTheme: radioTheme,
          sliderTheme: sliderTheme,
          textTheme: GoogleFonts.getTextTheme(
            fontFamily,
            TextTheme(
              displayLarge: displayLargeTextStyle,
              displayMedium: displayMediumTextStyle,
              displaySmall: displaySmallTextStyle,
              headlineLarge: headlineLargeTextStyle,
              headlineMedium: headlineMediumTextStyle,
              headlineSmall: headlineSmallTextStyle,
              titleLarge: titleLargeTextStyle,
              titleMedium: titleMediumTextStyle,
              titleSmall: titleSmallTextStyle,
              labelLarge: labelLargeTextStyle,
              labelMedium: labelMediumTextStyle,
              labelSmall: labelSmallTextStyle,
              bodyLarge: bodyLargeTextStyle,
              bodyMedium: bodyMediumTextStyle,
              bodySmall: bodySmallTextStyle,
            ),
          ),
        );

        final theme =
            state.editMode == EditMode.basic ? basicTheme : advancedTheme;

        return DevicePreview(
          builder: (context) {
            return MaterialApp(
              title: 'Appainter',
              theme: theme,
              locale: DevicePreview.locale(context),
              home: DefaultTabController(
                length: _pages.length,
                child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Theme Preview'),
                    actions: [
                      Row(
                        children: [
                          const Text('1'),
                          IconButton(
                            icon: const Icon(Icons.notifications),
                            onPressed: () {},
                          ),
                        ],
                      ),
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
                  // ignore: prefer_const_constructors
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
          },
        );
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
              'Drawer header',
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
