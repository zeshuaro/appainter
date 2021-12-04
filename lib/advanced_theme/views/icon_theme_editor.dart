import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/consts.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class IconThemeEditor extends ExpansionPanelItem {
  const IconThemeEditor({Key? key}) : super(key: key);

  @override
  String get header => 'Icon Theme';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.iconTheme != current.themeData.iconTheme;
      },
      builder: (context, state) {
        final theme = state.themeData.iconTheme;
        return IconThemeCard(
          key: const Key('iconThemeEditor_iconThemeCard'),
          color: theme.color ?? kIconThemeColor,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().iconThemeColorChanged(color);
          },
          size: theme.size ?? kIconThemeSize,
          onSizeChanged: (value) {
            context.read<AdvancedThemeCubit>().iconThemeSizeChanged(value);
          },
          opacity: theme.opacity ?? kIconThemeOpacity,
          onOpacityChanged: (value) {
            context.read<AdvancedThemeCubit>().iconThemeOpacityChanged(value);
          },
        );
      },
    );
  }
}
