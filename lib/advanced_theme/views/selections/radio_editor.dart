import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class RadioEditor extends StatelessWidget {
  const RadioEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'Radio',
      children: [
        SideBySideList(
          children: [
            _FillColorPicker(),
            _SplashRadiusTextField(),
          ],
        ),
      ],
    );
  }
}

class _FillColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.radioTheme.fillColor !=
                current.themeData.radioTheme.fillColor ||
            previous.themeData.toggleableActiveColor !=
                current.themeData.toggleableActiveColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('radioEditor_fillColorPicker'),
          title: 'Fill Color',
          color:
              state.themeData.radioTheme.fillColor?.resolve(kSelectedState) ??
                  state.themeData.toggleableActiveColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().radioFillColorChanged(color);
          },
        );
      },
    );
  }
}

class _SplashRadiusTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.radioTheme.splashRadius !=
            current.themeData.radioTheme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('radioEditor_splashRadiusTextField'),
          labelText: 'Splash Radius',
          initialValue: state.themeData.radioTheme.splashRadius?.toString() ??
              kRadialReactionRadius.toString(),
          onChanged: (value) {
            context.read<AdvancedThemeCubit>().radioSplashRadiusChanged(value);
          },
        );
      },
    );
  }
}
