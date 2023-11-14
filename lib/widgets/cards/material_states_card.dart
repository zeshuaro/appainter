import 'package:flutter/material.dart';
import 'package:appainter/widgets/widgets.dart';

class MaterialStateItem<T> {
  final Key? key;
  final String title;
  final String? tooltip;
  final T value;
  final ValueChanged<T> onValueChanged;
  final bool colorEnableOpacity;

  const MaterialStateItem({
    required this.title,
    required this.value,
    required this.onValueChanged,
    this.key,
    this.tooltip,
    this.colorEnableOpacity = true,
  });
}

class MaterialStatesCard<T> extends StatelessWidget {
  final String header;
  final String? tooltip;
  final List<MaterialStateItem<T>> items;

  const MaterialStatesCard({
    super.key,
    required this.header,
    required this.items,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return MyCard(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[700]
          : Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(
            header: header,
            tooltip: tooltip,
          ),
          const VerticalPadding(),
          SideBySideList(
            children: items.map(
              (item) {
                return _StateListTile<T>(
                  key: item.key,
                  title: item.title,
                  tooltip: item.tooltip,
                  value: item.value,
                  onValueChanged: item.onValueChanged,
                  colorEnableOpacity: item.colorEnableOpacity,
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String header;
  final String? tooltip;

  const _Header({required this.header, this.tooltip});

  @override
  Widget build(BuildContext context) {
    return MyTooltip(
      tooltip: tooltip,
      child: Text(
        header,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _StateListTile<T> extends StatelessWidget {
  final String title;
  final String? tooltip;
  final T value;
  final ValueChanged<T> onValueChanged;
  final bool colorEnableOpacity;

  const _StateListTile({
    super.key,
    required this.title,
    required this.value,
    required this.onValueChanged,
    this.tooltip,
    this.colorEnableOpacity = true,
  });

  @override
  Widget build(BuildContext context) {
    if (T == Color) {
      return ColorListTile(
        title: title,
        tooltip: tooltip,
        color: value as Color,
        onColorChanged: onValueChanged as ValueChanged<Color>,
        enableOpacity: colorEnableOpacity,
      );
    } else if (T == String) {
      return MyTextFormField(
        labelText: title,
        tooltip: tooltip,
        initialValue: value as String,
        onChanged: onValueChanged as ValueChanged<String>,
      );
    } else {
      throw Exception('Unsupported type: $T');
    }
  }
}
