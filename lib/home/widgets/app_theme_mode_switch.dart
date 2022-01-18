import 'package:appainter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppThemeModeSwitch extends StatelessWidget {
  const AppThemeModeSwitch({Key? key}) : super(key: key);

  static const _iconSize = 20.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        FaIcon(
          FontAwesomeIcons.sun,
          size: _iconSize,
        ),
        _Switch(),
        FaIcon(
          FontAwesomeIcons.moon,
          size: _iconSize,
        )
      ],
    );
  }
}

class _Switch extends StatelessWidget {
  const _Switch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        late final bool value;
        if (state.themeMode == ThemeMode.system) {
          value = MediaQuery.of(context).platformBrightness == Brightness.dark;
        } else {
          value = state.themeMode == ThemeMode.dark;
        }

        return Switch(
          activeColor: Colors.blueGrey,
          onChanged: (value) {
            context.read<HomeCubit>().themeModeChanged(value);
          },
          value: value,
        );
      },
    );
  }
}
