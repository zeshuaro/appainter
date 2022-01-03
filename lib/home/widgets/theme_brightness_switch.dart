import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/basic_theme/basic_theme.dart';

class ThemeBrightnessSwitch extends StatelessWidget {
  const ThemeBrightnessSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Brightness',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        BlocBuilder<BasicThemeCubit, BasicThemeState>(
          builder: (context, state) {
            return Switch(
              activeColor: Colors.blueGrey,
              onChanged: (value) {
                context.read<BasicThemeCubit>().themeBrightnessChanged(value);
              },
              value: state.isDark,
            );
          },
        ),
      ],
    );
  }
}
