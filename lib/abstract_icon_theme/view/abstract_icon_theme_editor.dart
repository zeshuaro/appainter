import 'package:appainter/abstract_icon_theme/abstract_icon_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/widgets/widgets.dart';

abstract class AbstractIconThemeEditor<T extends AbstractIconThemeCubit>
    extends ExpansionPanelItem {
  const AbstractIconThemeEditor({super.key});

  String? get keyPrefix;

  Color? fallbackColor(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<T, IconThemeState>(
      builder: (context, state) {
        final cubit = context.read<T>();
        final theme = state.theme;
        late final String prefix;

        if (keyPrefix != null) {
          prefix = '${keyPrefix}_';
        } else {
          prefix = '';
        }

        return NestedListView(
          children: [
            ColorListTile(
              key: Key('${prefix}colorPicker'),
              title: 'Color',
              color: theme.color ?? fallbackColor(context) ?? kIconThemeColor,
              onColorChanged: cubit.colorChanged,
            ),
            SideBySide(
              left: MyTextFormField(
                key: Key('${prefix}sizeTextField'),
                labelText: 'Size',
                onChanged: cubit.sizeChanged,
                initialValue: (theme.size ?? kIconThemeSize).toString(),
              ),
              right: MyTextFormField(
                key: Key('${prefix}opacityTextField'),
                labelText: 'Opacity',
                onChanged: cubit.opacityChanged,
                initialValue: (theme.opacity ?? kIconThemeOpacity).toString(),
              ),
            ),
          ],
        );
      },
    );
  }
}
