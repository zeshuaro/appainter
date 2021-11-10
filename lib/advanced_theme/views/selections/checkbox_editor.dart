import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class CheckboxEditor extends StatelessWidget {
  const CheckboxEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'Checkbox',
      children: [
        SideBySideList(
          children: [
            _FillColorPicker(),
            _CheckColorPicker(),
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
        return previous.themeData.checkboxTheme.fillColor !=
                current.themeData.checkboxTheme.fillColor ||
            previous.themeData.toggleableActiveColor !=
                current.themeData.toggleableActiveColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('checkboxEditor_fillColorPicker'),
          title: 'Fill Color',
          color: state.themeData.checkboxTheme.fillColor
                  ?.resolve(kSelectedState) ??
              state.themeData.toggleableActiveColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().checkboxFillColorChanged(color);
          },
        );
      },
    );
  }
}

class _CheckColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.checkboxTheme.checkColor !=
            current.themeData.checkboxTheme.checkColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('checkboxEditor_checkColorPicker'),
          title: 'Check Color',
          color: state.themeData.checkboxTheme.checkColor
                  ?.resolve(kSelectedState) ??
              Colors.white,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().checkboxCheckColorChanged(color);
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
        return previous.themeData.checkboxTheme.splashRadius !=
            current.themeData.checkboxTheme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('checkboxEditor_splashRadiusTextField'),
          labelText: 'Splash Radius',
          initialValue:
              state.themeData.checkboxTheme.splashRadius?.toString() ??
                  kRadialReactionRadius.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .checkboxSplashRadiusChanged(value);
          },
        );
      },
    );
  }
}
