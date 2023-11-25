import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Material3Switch extends StatelessWidget {
  const Material3Switch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Material 3',
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
    final basicThemeUseMaterial3 =
        context.watch<BasicThemeCubit>().state.useMaterial3;
    final advancedThemeUseMaterial3 =
        context.watch<AdvancedThemeCubit>().state.useMaterial3;

    return Switch(
      activeColor: Colors.blueGrey,
      onChanged: (value) => _onChanged(context, editMode, value),
      value: editMode == EditMode.basic
          ? basicThemeUseMaterial3
          : advancedThemeUseMaterial3,
    );
  }

  void _onChanged(BuildContext context, EditMode editMode, bool value) {
    if (editMode == EditMode.basic) {
      context.read<BasicThemeCubit>().useMaterial3Changed(value);
    } else {
      context.read<AdvancedThemeCubit>().useMaterial3Changed(value);
    }
  }
}
