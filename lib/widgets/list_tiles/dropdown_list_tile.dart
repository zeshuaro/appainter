import 'package:flutter/material.dart';

import 'list_tile.dart';

class DropdownListTile extends StatelessWidget {
  final String title;
  final String? tooltip;
  final String value;
  final List<String> values;
  final void Function(String?) onChanged;

  const DropdownListTile({
    super.key,
    required this.title,
    required this.value,
    required this.values,
    required this.onChanged,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      title: title,
      tooltip: tooltip,
      trailing: DropdownButton(
        key: const Key('dropdownListTile_dropdownButton'),
        value: value,
        onChanged: onChanged,
        items: values.map((String value) {
          return DropdownMenuItem(
            key: ValueKey(value),
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
