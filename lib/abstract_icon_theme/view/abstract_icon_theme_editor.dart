import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/common/consts.dart';
import 'package:appainter/widgets/widgets.dart';

class AbstractIconThemeEditor<T extends AbstractIconThemeCubit>
    extends ExpansionPanelItem {
  final String? keyPrefix;
  final Color? fallbackColor;

  const AbstractIconThemeEditor({Key? key, this.keyPrefix, this.fallbackColor})
      : super(key: key);

  @override
  String get header => throw UnimplementedError();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, IconThemeState>(
      builder: (context, state) {
        final cubit = context.read<T>();
        return IconThemeCard(
          keyPrefix: keyPrefix,
          color: state.theme.color ?? fallbackColor ?? kIconThemeColor,
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
