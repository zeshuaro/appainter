import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/common/consts.dart';
import 'package:appainter/widgets/widgets.dart';

abstract class AbstractIconThemeEditor<T extends AbstractIconThemeCubit>
    extends ExpansionPanelItem {
  const AbstractIconThemeEditor({Key? key}) : super(key: key);

  String? get keyPrefix;

  Color? fallbackColor(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, IconThemeState>(
      builder: (context, state) {
        final cubit = context.read<T>();
        return IconThemeCard(
          keyPrefix: keyPrefix,
          color: state.theme.color ?? fallbackColor(context) ?? kIconThemeColor,
          onColorChanged: cubit.colorChanged,
          size: state.theme.size ?? kIconThemeSize,
          onSizeChanged: cubit.sizeChanged,
          opacity: state.theme.opacity ?? kIconThemeOpacity,
          onOpacityChanged: cubit.opacityChanged,
        );
      },
    );
  }
}
