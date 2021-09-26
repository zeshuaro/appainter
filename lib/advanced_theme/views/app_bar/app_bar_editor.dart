import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/models/models.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class AppBarEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpandableCard(
      header: 'App Bar',
      children: [
        SideBySideList(
          children: [
            _BackgroundColorPicker(),
            _ForegroundColorPicker(),
            _ShadowColorPicker(),
            _SystemUiOverlayStyleDropdown(),
            _ElevationTextField(),
            _CenterTitleSwitch(),
            _TitleSpacingTextField(),
            _ToolBarHeightTextField(),
          ],
        ),
      ],
    );
  }
}

class _BackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.backgroundColor !=
                current.themeData.appBarTheme.backgroundColor ||
            previous.themeData.primaryColor != current.themeData.primaryColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('appbarEditor_backgroundColorPicker'),
          title: 'Background Color',
          color: state.themeData.appBarTheme.backgroundColor ??
              state.themeData.primaryColor,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .appBarBackgroundColorChanged(color);
          },
        );
      },
    );
  }
}

class _ForegroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.foregroundColor !=
                current.themeData.appBarTheme.foregroundColor ||
            previous.themeData.colorScheme.onPrimary !=
                current.themeData.colorScheme.onPrimary;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('appbarEditor_foregroundColorPicker'),
          title: 'Foreground Color',
          color: state.themeData.appBarTheme.foregroundColor ??
              state.themeData.colorScheme.onPrimary,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .appBarForegroundColorChanged(color);
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

class _ToolBarHeightTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.toolbarHeight !=
            current.themeData.appBarTheme.toolbarHeight;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('appbarEditor_toolBarHeightTextField'),
          labelText: 'Tool Bar Height',
          initialValue: state.themeData.appBarTheme.toolbarHeight?.toString() ??
              kToolbarHeight.toString(),
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarToolBarHeightChanged(value);
          },
        );
      },
    );
  }
}

class _SystemUiOverlayStyleDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.appBarTheme.systemOverlayStyle !=
            current.themeData.appBarTheme.systemOverlayStyle;
      },
      builder: (context, state) {
        return DropdownListTile(
          title: 'System UI Overlay Style',
          value: MySystemUiOverlayStyle().stringFromEnum(
                  state.themeData.appBarTheme.systemOverlayStyle) ??
              'Light',
          values: MySystemUiOverlayStyle().names,
          onChanged: (value) {
            context
                .read<AdvancedThemeCubit>()
                .appBarSystemUiOverlayStyleChanged(value!);
          },
        );
      },
    );
  }
}
