import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/cubit/cubit.dart';
import 'package:flutter_theme/app_bar_theme/app_bar_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/models/models.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class AppBarThemeEditor extends ExpansionPanelItem {
  const AppBarThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'App Bar';

  @override
  Widget build(BuildContext context) {
    return SideBySideList(
      padding: kPaddingAll,
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
    );
  }
}

class _BackgroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        context.watch<AppBarThemeCubit>().state.theme.backgroundColor;
    final primaryColor =
        context.watch<AdvancedThemeCubit>().state.themeData.primaryColor;

    return ColorListTile(
      key: const Key('appBarThemeEditor_backgroundColorPicker'),
      title: 'Background Color',
      color: backgroundColor ?? primaryColor,
      onColorChanged: (color) {
        context.read<AppBarThemeCubit>().backgroundColorChanged(color);
      },
    );
  }
}

class _ForegroundColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        context.watch<AppBarThemeCubit>().state.theme.foregroundColor;
    final onPrimary = context
        .watch<AdvancedThemeCubit>()
        .state
        .themeData
        .colorScheme
        .onPrimary;

    return ColorListTile(
      key: const Key('appBarThemeEditor_foregroundColorPicker'),
      title: 'Foreground Color',
      color: foregroundColor ?? onPrimary,
      onColorChanged: (color) {
        context.read<AppBarThemeCubit>().foregroundColorChanged(color);
      },
    );
  }
}

class _ElevationTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.elevation != current.theme.elevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('appBarThemeEditor_elevationTextField'),
          labelText: 'Elevation',
          initialValue:
              state.theme.elevation?.toString() ?? kAppBarElevation.toString(),
          onChanged: (value) {
            context.read<AppBarThemeCubit>().elevationChanged(value);
          },
        );
      },
    );
  }
}

class _ShadowColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shadowColor =
        context.watch<AppBarThemeCubit>().state.theme.shadowColor;
    final themeShadowColor =
        context.watch<AdvancedThemeCubit>().state.themeData.shadowColor;

    return ColorListTile(
      key: const Key('appBarThemeEditor_shadowColorPicker'),
      title: 'Shadow Color',
      color: shadowColor ?? themeShadowColor,
      onColorChanged: (color) {
        context.read<AppBarThemeCubit>().shadowColorChanged(color);
      },
    );
  }
}

class _CenterTitleSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.centerTitle != current.theme.centerTitle;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('appBarThemeEditor_centerTitleSwitch'),
          title: 'Center Title',
          value: state.theme.centerTitle ?? true,
          onChanged: (value) {
            context.read<AppBarThemeCubit>().centerTitleChanged(value);
          },
        );
      },
    );
  }
}

class _TitleSpacingTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.titleSpacing != current.theme.titleSpacing;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('appBarThemeEditor_titleSpacingTextField'),
          labelText: 'Title Spacing',
          initialValue: state.theme.titleSpacing?.toString() ??
              kAppBarTitleSpacing.toString(),
          onChanged: (value) {
            context.read<AppBarThemeCubit>().titleSpacingChanged(value);
          },
        );
      },
    );
  }
}

class _ToolBarHeightTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.toolbarHeight != current.theme.toolbarHeight;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('appBarThemeEditor_toolBarHeightTextField'),
          labelText: 'Tool Bar Height',
          initialValue: state.theme.toolbarHeight?.toString() ??
              kToolbarHeight.toString(),
          onChanged: (value) {
            context.read<AppBarThemeCubit>().toolBarHeightChanged(value);
          },
        );
      },
    );
  }
}

class _SystemUiOverlayStyleDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.systemOverlayStyle !=
            current.theme.systemOverlayStyle;
      },
      builder: (context, state) {
        return DropdownListTile(
          key: const Key('appbarThemeEditor_systemUiOverlayStyleDropdown'),
          title: 'System UI Overlay Style',
          value: MySystemUiOverlayStyle()
                  .stringFromEnum(state.theme.systemOverlayStyle) ??
              'Light',
          values: MySystemUiOverlayStyle().names,
          onChanged: (value) {
            context
                .read<AppBarThemeCubit>()
                .systemUiOverlayStyleChanged(value!);
          },
        );
      },
    );
  }
}
