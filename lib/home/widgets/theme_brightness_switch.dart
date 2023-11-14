import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBrightnessSwitch extends StatelessWidget {
  const ThemeBrightnessSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Brightness',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const _Switch(),
      ],
    );
  }
}

class _Switch extends StatelessWidget {
  const _Switch();

  @override
  Widget build(BuildContext context) {
    final editMode = context.watch<HomeCubit>().state.editMode;
    final basicThemeIsDark = context.watch<BasicThemeCubit>().state.isDark;
    final advancedThemeIsDark =
        context.watch<AdvancedThemeCubit>().state.isDark;

    return Switch(
      activeColor: Colors.blueGrey,
      onChanged: (value) => _onChanged(context, editMode, value),
      value:
          editMode == EditMode.basic ? basicThemeIsDark : advancedThemeIsDark,
    );
  }

  void _onChanged(BuildContext context, EditMode editMode, bool value) {
    if (editMode == EditMode.basic) {
      context.read<BasicThemeCubit>().themeBrightnessChanged(value);
    } else {
      context.read<AdvancedThemeCubit>().themeBrightnessChanged(value);
    }
  }
}
