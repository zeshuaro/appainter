import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class AppBarEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'App Bar',
      children: [
        SideBySideList(
          children: [
            _ColorPicker(),
            _ShadowColorPicker(),
            _BrightnessSwitch(),
            _CenterTitleSwitch(),
            _ElevationTextField(),
            _TitleSpacingTextField(),
          ],
        ),
      ],
    );
  }
}

class _ColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.color !=
                current.themeData.appBarTheme.color ||
            previous.themeData.primaryColor != current.themeData.primaryColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('appbarEditor_colorPicker'),
          title: 'Color',
          color:
              state.themeData.appBarTheme.color ?? state.themeData.primaryColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().appBarColorChanged(color);
          },
        );
      },
    );
  }
}

class _ShadowColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.shadowColor !=
                current.themeData.appBarTheme.shadowColor ||
            previous.themeData.shadowColor != current.themeData.shadowColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('appbarEditor_shadowColorPicker'),
          title: 'Shadow Color',
          color: state.themeData.appBarTheme.shadowColor ??
              state.themeData.shadowColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().appBarShadowColorChanged(color);
          },
        );
      },
    );
  }
}

class _BrightnessSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.brightness !=
            current.themeData.appBarTheme.brightness;
      },
      builder: (context, state) {
        final isDark =
            state.themeData.appBarTheme.brightness == Brightness.dark;

        return MySwitchListTile(
          key: const Key('appbarEditor_brightnessSwitch'),
          title: 'Brightness',
          value: isDark,
          onChanged: (value) {
            context.read<AdvancedThemeCubit>().appBarBrightnessChanged(value);
          },
          label: 'Dark',
        );
      },
    );
  }
}

class _CenterTitleSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.centerTitle !=
            current.themeData.appBarTheme.centerTitle;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('appbarEditor_centerTitleSwitch'),
          title: 'Center Title',
          value: state.themeData.appBarTheme.centerTitle ?? true,
          onChanged: (value) {
            context.read<AdvancedThemeCubit>().appBarCenterTitleChanged(value);
          },
        );
      },
    );
  }
}

class _ElevationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.elevation !=
            current.themeData.appBarTheme.elevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('appbarEditor_elevationTextField'),
          labelText: 'Elevation',
          initialValue: state.themeData.appBarTheme.elevation?.toString() ??
              kAppBarElevation.toString(),
          onChanged: (value) {
            context.read<AdvancedThemeCubit>().appBarElevationChanged(value);
          },
        );
      },
    );
  }
}

class _TitleSpacingTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.titleSpacing !=
            current.themeData.appBarTheme.titleSpacing;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('appbarEditor_titleSpacingTextField'),
          labelText: 'Title Spacing',
          initialValue: state.themeData.appBarTheme.titleSpacing?.toString() ??
              kAppBarTitleSpacing.toString(),
          onChanged: (value) {
            context.read<AdvancedThemeCubit>().appBarTitleSpacingChanged(value);
          },
        );
      },
    );
  }
}
