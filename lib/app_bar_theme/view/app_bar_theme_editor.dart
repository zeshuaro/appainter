import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarThemeEditor extends ExpansionPanelItem {
  const AppBarThemeEditor({super.key});

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
            _ElevationTextField(),
            _CenterTitleSwitch(),
            _TitleSpacingTextField(),
            _ToolBarHeightTextField(),
          ],
        ),
        MyExpansionPanelList(
          items: const [
            SystemOverlayStyleCard(
              key: Key('appBarThemeEditor_systemOverlayStyleCard'),
            ),
            _IconThemeCard(key: Key('appBarThemeEditor_iconThemeCard')),
            _ActionsIconThemeCard(
              key: Key('appBarThemeEditor_actionsIconThemeCard'),
            ),
            _TitleTextStyleCard(
              key: Key('appBarThemeEditor_titleTextStyleCard'),
            ),
            _ToolbarTextStyleCard(
              key: Key('appBarThemeEditor_toolbarTextStyleCard'),
            ),
          ],
        ),
      ],
    );
  }
}

class _BackgroundColorPicker extends StatelessWidget {
  const _BackgroundColorPicker();

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        context.watch<AppBarThemeCubit>().state.theme.backgroundColor;
    final primaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.primary;

    return ColorListTile(
      key: const Key('appBarThemeEditor_backgroundColorPicker'),
      title: 'Background color',
      tooltip: AppBarThemeDocs.backgroundColor,
      color: backgroundColor ?? primaryColor,
      onColorChanged: (color) {
        context.read<AppBarThemeCubit>().backgroundColorChanged(color);
      },
    );
  }
}

class _ForegroundColorPicker extends StatelessWidget {
  const _ForegroundColorPicker();

  @override
  Widget build(BuildContext context) {
    final foregroundColor =
        context.watch<AppBarThemeCubit>().state.theme.foregroundColor;
    final onPrimaryColor =
        context.watch<ColorThemeCubit>().state.colorScheme.onPrimary;

    return ColorListTile(
      key: const Key('appBarThemeEditor_foregroundColorPicker'),
      title: 'Foreground color',
      tooltip: AppBarThemeDocs.foregroundColor,
      color: foregroundColor ?? onPrimaryColor,
      onColorChanged: (color) {
        context.read<AppBarThemeCubit>().foregroundColorChanged(color);
      },
    );
  }
}

class _ElevationTextField extends StatelessWidget {
  const _ElevationTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      key: const Key('appBarThemeEditor_elevationTextField'),
      buildWhen: (previous, current) {
        return previous.theme.elevation != current.theme.elevation;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Elevation',
          tooltip: AppBarThemeDocs.elevation,
          initialValue: (state.theme.elevation ?? kAppBarElevation).toString(),
          onChanged: (value) {
            context.read<AppBarThemeCubit>().elevationChanged(value);
          },
        );
      },
    );
  }
}

class _ShadowColorPicker extends StatelessWidget {
  const _ShadowColorPicker();

  @override
  Widget build(BuildContext context) {
    final shadowColor =
        context.watch<AppBarThemeCubit>().state.theme.shadowColor;
    final themeShadowColor = context.watch<ColorThemeCubit>().state.shadowColor;

    return ColorListTile(
      key: const Key('appBarThemeEditor_shadowColorPicker'),
      title: 'Shadow color',
      tooltip: AppBarThemeDocs.shadowColor,
      color: shadowColor ?? themeShadowColor,
      onColorChanged: (color) {
        context.read<AppBarThemeCubit>().shadowColorChanged(color);
      },
    );
  }
}

class _CenterTitleSwitch extends StatelessWidget {
  const _CenterTitleSwitch();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      key: const Key('appBarThemeEditor_centerTitleSwitch'),
      buildWhen: (previous, current) {
        return previous.theme.centerTitle != current.theme.centerTitle;
      },
      builder: (context, state) {
        return MySwitchListTile(
          title: 'Center title',
          tooltip: AppBarThemeDocs.centerTitle,
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
  const _TitleSpacingTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      key: const Key('appBarThemeEditor_titleSpacingTextField'),
      buildWhen: (previous, current) {
        return previous.theme.titleSpacing != current.theme.titleSpacing;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Title spacing',
          tooltip: AppBarThemeDocs.titleSpacing,
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
  const _ToolBarHeightTextField();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      key: const Key('appBarThemeEditor_toolBarHeightTextField'),
      buildWhen: (previous, current) {
        return previous.theme.toolbarHeight != current.theme.toolbarHeight;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Tool bar height',
          tooltip: AppBarThemeDocs.toolbarHeight,
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

class _ActionsIconThemeCard
    extends AbstractIconThemeEditor<AppBarActionsIconThemeCubit> {
  const _ActionsIconThemeCard({super.key});

  @override
  String get keyPrefix => 'appBarThemeEditor_actionsIconThemeCard';

  @override
  String get header => 'Actions icon theme';

  @override
  String? get tooltip => AppBarThemeDocs.actionsIconTheme;

  @override
  Color? fallbackColor(BuildContext context) {
    return _iconThemeColorFallback(context);
  }
}

class _IconThemeCard extends AbstractIconThemeEditor<AppBarIconThemeCubit> {
  const _IconThemeCard({super.key});

  @override
  String get keyPrefix => 'appBarThemeEditor_iconThemeCard';

  @override
  String get header => 'Icon theme';

  @override
  String? get tooltip => AppBarThemeDocs.iconTheme;

  @override
  Color? fallbackColor(BuildContext context) {
    return _iconThemeColorFallback(context);
  }
}

class _TitleTextStyleCard
    extends AbstractTextStyleEditor<AppBarTitleTextStyleCubit> {
  const _TitleTextStyleCard({super.key});

  @override
  String get header => 'Title text style';

  @override
  String? get tooltip => AppBarThemeDocs.titleTextStyle;
}

class _ToolbarTextStyleCard
    extends AbstractTextStyleEditor<AppBarToolbarTextStyleCubit> {
  const _ToolbarTextStyleCard({super.key});

  @override
  String get header => 'Toolbar text style';

  @override
  String? get tooltip => AppBarThemeDocs.toolbarTextStyle;
}

Color? _iconThemeColorFallback(BuildContext context) {
  final foregroundColor =
      context.watch<AppBarThemeCubit>().state.theme.foregroundColor;
  final onPrimaryColor =
      context.watch<ColorThemeCubit>().state.colorScheme.onPrimary;
  return foregroundColor ?? onPrimaryColor;
}
