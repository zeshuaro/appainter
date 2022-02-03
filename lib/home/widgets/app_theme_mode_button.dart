import 'package:appainter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppThemeModeButton extends StatelessWidget {
  const AppThemeModeButton({Key? key}) : super(key: key);

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
          onPressed: () => context.read<HomeCubit>().themeModeChanged(!isDark),
          icon: Icon(isDark ? MdiIcons.weatherNight : MdiIcons.weatherSunny),
        );
      },
    );
  }
}
