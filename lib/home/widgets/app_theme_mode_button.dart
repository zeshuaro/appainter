import 'package:appainter/common/common.dart';
import 'package:appainter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppThemeModeButton extends StatelessWidget {
  const AppThemeModeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        late final bool isDark;
        if (state.themeMode == ThemeMode.system) {
          isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
        } else {
          isDark = state.themeMode == ThemeMode.dark;
        }

        return IconButton(
          icon: Icon(isDark ? MdiIcons.weatherNight : MdiIcons.weatherSunny),
          splashRadius: kSplashRadius,
          onPressed: () => context.read<HomeCubit>().themeModeChanged(!isDark),
        );
      },
    );
  }
}
