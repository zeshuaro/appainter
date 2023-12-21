import 'package:appainter/app_bar_theme/app_bar_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/services/util_service.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const _defaultSystemOverlayStyle = SystemUiOverlayStyle.light;

class SystemOverlayStyleCard extends ExpansionPanelItem {
  const SystemOverlayStyleCard({super.key});

  @override
  String get header => 'System overlay style';

  @override
  Widget build(BuildContext context) {
    return const SideBySideList(
      padding: kPaddingAll,
      children: [
        _StatusBarColorPicker(),
        _StatusBarBrightnessDropdown(),
        _StatusBarIconBrightnessDropdown(),
      ],
    );
  }
}

class _StatusBarColorPicker extends StatelessWidget {
  const _StatusBarColorPicker();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      key: const Key('systemOverlayStyleCard_statusBarColorPicker'),
      buildWhen: (previous, current) {
        return previous.theme.systemOverlayStyle?.statusBarColor !=
            current.theme.systemOverlayStyle?.statusBarColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Status bar color',
          color: state.theme.systemOverlayStyle?.statusBarColor ??
              Colors.transparent,
          onColorChanged:
              context.read<AppBarThemeCubit>().statusBarColorChanged,
        );
      },
    );
  }
}

class _StatusBarBrightnessDropdown extends StatelessWidget {
  const _StatusBarBrightnessDropdown();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      key: const Key('systemOverlayStyleCard_statusBarBrightnessDropdown'),
      buildWhen: (previous, current) {
        return previous.theme.systemOverlayStyle?.statusBarBrightness !=
            current.theme.systemOverlayStyle?.statusBarBrightness;
      },
      builder: (context, state) {
        return DropdownListTile(
          title: 'Status bar brightness',
          value: UtilService.enumToString(
            (state.theme.systemOverlayStyle ?? _defaultSystemOverlayStyle)
                .statusBarBrightness,
          ),
          values: UtilService.getEnumStrings(Brightness.values),
          onChanged:
              context.read<AppBarThemeCubit>().statusBarBrightnessChanged,
        );
      },
    );
  }
}

class _StatusBarIconBrightnessDropdown extends StatelessWidget {
  const _StatusBarIconBrightnessDropdown();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBarThemeCubit, AppBarThemeState>(
      key: const Key('systemOverlayStyleCard_statusBarIconBrightnessDropdown'),
      buildWhen: (previous, current) {
        return previous.theme.systemOverlayStyle?.statusBarIconBrightness !=
            current.theme.systemOverlayStyle?.statusBarIconBrightness;
      },
      builder: (context, state) {
        return DropdownListTile(
          title: 'Status bar icon brightness',
          value: UtilService.enumToString(
            (state.theme.systemOverlayStyle ?? _defaultSystemOverlayStyle)
                .statusBarIconBrightness,
          ),
          values: UtilService.getEnumStrings(Brightness.values),
          onChanged:
              context.read<AppBarThemeCubit>().statusBarIconBrightnessChanged,
        );
      },
    );
  }
}
