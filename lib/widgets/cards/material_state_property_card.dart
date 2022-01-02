import 'package:flutter/material.dart';
import 'package:appainter/widgets/widgets.dart';

class MaterialStateItem<T> {
  final Key? key;
  final String title;
  final T value;
  final ValueChanged<T> onValueChanged;

  const MaterialStateItem({
    required this.title,
    required this.value,
    required this.onValueChanged,
    this.key,
  });
}

class MaterialStatePropertyCard<T> extends StatelessWidget {
  final String header;
  final List<MaterialStateItem<T>> items;

  const MaterialStatePropertyCard({
    Key? key,
    required this.header,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyCard(
      color: Colors.grey[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const VerticalPadding(),
          SideBySideList(
            children: items.map(
              (item) {
                return _PropertyListTile<T>(
                  key: item.key,
                  title: item.title,
                  value: item.value,
                  onValueChanged: item.onValueChanged,
                );
              },
            ).toList(),
          ),
        ],
      ),
    );
  }
}

class _PropertyListTile<T> extends StatelessWidget {
  final String title;
  final T value;
  final ValueChanged<T> onValueChanged;

  const _PropertyListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onValueChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (T == Color) {
      return ColorListTile(
        title: title,
        color: value as Color,
        onColorChanged: onValueChanged as ValueChanged<Color>,
      );
    } else if (T == String) {
      return MyTextFormField(
        labelText: title,
        initialValue: value as String,
        onChanged: onValueChanged as ValueChanged<String>,
      );
    } else {
      throw Exception('Unsupported type: $T');
    }
  }
}
