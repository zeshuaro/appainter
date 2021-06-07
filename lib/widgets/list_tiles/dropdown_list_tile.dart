import 'package:flutter/material.dart';

import 'list_tile.dart';

class DropdownListTile extends StatelessWidget {
  final String title;
  final String value;
  final List<String> values;
  final void Function(String?) onChanged;

  const DropdownListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.values,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      title: title,
      trailing: DropdownButton(
        value: value,
        onChanged: onChanged,
        items: values.map((String value) {
          return DropdownMenuItem(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
