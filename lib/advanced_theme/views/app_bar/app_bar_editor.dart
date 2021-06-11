import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

part 'app_bar_icon_theme.dart';
part 'app_bar_title_text_style.dart';

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
        // _IconThemeEditor(),
        // _TitleTextStyleEditor(),
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
            current.themeData.appBarTheme.color;
      },
      builder: (context, state) {
        return ColorListTile(
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
            current.themeData.appBarTheme.shadowColor;
      },
      builder: (context, state) {
        return ColorListTile(
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
