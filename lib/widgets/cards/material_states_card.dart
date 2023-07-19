import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';

typedef MaterialStateColorPicker = Color;
typedef MaterialStateTextField = String;
typedef MaterialStateDropdown = String;

class MaterialStatesCard<T> extends StatelessWidget {
  final String header;
  final String? tooltip;
  final List<MaterialStateItem<T>> items;

  const MaterialStatesCard({
    Key? key,
    required this.header,
    required this.items,
    this.tooltip,
  })  : assert(T == MaterialStateColorPicker ||
            T == MaterialStateTextField ||
            T == MaterialStateDropdown), // coverage:ignore-line
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.grey[700] // coverage:ignore-line
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
  }) : assert(T == MaterialStateColorPicker ||
            T == MaterialStateTextField ||
            T == MaterialStateDropdown); // coverage:ignore-line
}

class _Header extends StatelessWidget {
  final String header;
  final String? tooltip;

  const _Header({Key? key, required this.header, this.tooltip})
      : super(key: key);

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
    Key? key,
    required this.title,
    required this.value,
    required this.onValueChanged,
    this.tooltip,
    this.colorEnableOpacity = true,
  })  : assert(T == MaterialStateColorPicker ||
            T == MaterialStateTextField ||
            T == MaterialStateDropdown), // coverage:ignore-line
        super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (T) {
      case MaterialStateColorPicker:
        return ColorListTile(
          title: title,
          tooltip: tooltip,
          color: value as Color,
          onColorChanged: onValueChanged as ValueChanged<Color>,
          enableOpacity: colorEnableOpacity,
        );
      case MaterialStateTextField:
        return MyTextFormField(
          labelText: title,
          tooltip: tooltip,
          initialValue: value as String,
          onChanged: onValueChanged as ValueChanged<String>,
        );
      default:
        throw Exception('Unsupported type: $T'); // coverage:ignore-line
    }
  }
}
