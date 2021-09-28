import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class SwitchEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'Switch',
      children: [
        SideBySideList(
          children: [
            _ThumbColorPicker(),
            _TrackColorPicker(),
            _SplashRadiusTextField(),
          ],
        ),
      ],
    );
  }
}

class _ThumbColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.switchTheme.thumbColor !=
            current.themeData.switchTheme.thumbColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('switchEditor_thumbColorPicker'),
          title: 'Thumb Color',
          color:
              state.themeData.switchTheme.thumbColor?.resolve(kSelectedState) ??
                  state.themeData.toggleableActiveColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().switchThumbColorChanged(color);
          },
        );
      },
    );
  }
}

class _TrackColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.switchTheme.trackColor !=
            current.themeData.switchTheme.trackColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('switchEditor_trackColorPicker'),
          title: 'Thumb Color',
          color:
              state.themeData.switchTheme.trackColor?.resolve(kSelectedState) ??
                  state.themeData.toggleableActiveColor.withAlpha(0x80),
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().switchTrackColorChanged(color);
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
        return previous.themeData.switchTheme.splashRadius !=
            current.themeData.switchTheme.splashRadius;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('switchEditor_splashRadiusTextField'),
          labelText: 'Splash Radius',
          initialValue: state.themeData.switchTheme.splashRadius?.toString() ??
              kRadialReactionRadius.toString(),
          onChanged: (value) {
            context.read<AdvancedThemeCubit>().switchSplashRadiusChanged(value);
          },
        );
      },
    );
  }
}
