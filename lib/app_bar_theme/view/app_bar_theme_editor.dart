import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/models/models.dart';
import 'package:appainter/widgets/widgets.dart';

class AppBarThemeEditor extends ExpansionPanelItem {
  const AppBarThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'App bar';

  @override
  Widget build(BuildContext context) {
    return NestedListView(
      children: [
        const SideBySideList(
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
        MyExpansionPanelList(
          items: const [
            _ActionsIconThemeCard(),
          ],
        )
      ],
    );
  }
}

class _BackgroundColorPicker extends StatelessWidget {
  const _BackgroundColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        context.watch<AppBarThemeCubit>().state.theme.backgroundColor;
    final primaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.primary;

    return ColorListTile(
      key: const Key('appBarThemeEditor_backgroundColorPicker'),
      title: 'Background color',
      color: backgroundColor ?? primaryColor,
      onColorChanged: (color) {
        context.read<AppBarThemeCubit>().backgroundColorChanged(color);
      },
    );
  }
}

class _ForegroundColorPicker extends StatelessWidget {
  const _ForegroundColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        context.watch<AppBarThemeCubit>().state.theme.foregroundColor;
    final onPrimaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.onPrimary;

    return ColorListTile(
      key: const Key('appBarThemeEditor_foregroundColorPicker'),
      title: 'Foreground color',
      color: foregroundColor ?? onPrimaryColor,
      onColorChanged: (color) {
        context.read<AppBarThemeCubit>().foregroundColorChanged(color);
      },
    );
  }
}

class _ElevationTextField extends StatelessWidget {
  const _ElevationTextField({Key? key}) : super(key: key);

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
  const _ShadowColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shadowColor =
        context.watch<AppBarThemeCubit>().state.theme.shadowColor;
    final themeShadowColor = context.watch<ColorThemeCubit>().state.shadowColor;

    return ColorListTile(
      key: const Key('appBarThemeEditor_shadowColorPicker'),
      title: 'Shadow color',
      color: shadowColor ?? themeShadowColor,
      onColorChanged: (color) {
        context.read<AppBarThemeCubit>().shadowColorChanged(color);
      },
    );
  }
}

class _CenterTitleSwitch extends StatelessWidget {
  const _CenterTitleSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.centerTitle != current.theme.centerTitle;
      },
      builder: (context, state) {
        return MySwitchListTile(
          key: const Key('appBarThemeEditor_centerTitleSwitch'),
          title: 'Center title',
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
  const _TitleSpacingTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.titleSpacing != current.theme.titleSpacing;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('appBarThemeEditor_titleSpacingTextField'),
          labelText: 'Title spacing',
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
  const _ToolBarHeightTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.toolbarHeight != current.theme.toolbarHeight;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('appBarThemeEditor_toolBarHeightTextField'),
          labelText: 'Tool bar height',
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
  const _SystemUiOverlayStyleDropdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      buildWhen: (previous, current) {
        return previous.theme.systemOverlayStyle !=
            current.theme.systemOverlayStyle;
      },
      builder: (context, state) {
        return DropdownListTile(
          key: const Key('appBarThemeEditor_systemUiOverlayStyleDropdown'),
          title: 'System UI overlay style',
          value: MySystemUiOverlayStyle().convertToString(
            state.theme.systemOverlayStyle ?? SystemUiOverlayStyle.light,
          )!,
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

class _ActionsIconThemeCard extends ExpansionPanelItem {
  const _ActionsIconThemeCard({Key? key}) : super(key: key);

  static const _iconThemeFallback = IconThemeData.fallback();

  @override
  String get header => 'Actions icon theme';

  @override
  Widget build(BuildContext context) {
    final appBarTheme = context.watch<AppBarThemeCubit>().state.theme;
    final onPrimaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.onPrimary;
    final cubit = context.read<AppBarThemeCubit>();

    final iconTheme = appBarTheme.actionsIconTheme;
    final iconColor = iconTheme?.color;
    final foregroundColor = appBarTheme.foregroundColor;

    return IconThemeCard(
      keyPrefix: 'appbarThemeEditor_actionsIconThemeCard',
      color: iconColor ?? foregroundColor ?? onPrimaryColor,
      onColorChanged: cubit.actionsIconThemeColorChanged,
      size: iconTheme?.size ?? _iconThemeFallback.size!,
      onSizeChanged: cubit.actionsIconThemeSizeChanged,
      opacity: iconTheme?.opacity ?? _iconThemeFallback.opacity!,
      onOpacityChanged: cubit.actionsIconThemeOpacityChanged,
    );
  }
}
