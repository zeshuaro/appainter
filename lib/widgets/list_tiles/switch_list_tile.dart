import 'package:flutter/material.dart';

import 'list_tile.dart';

class MySwitchListTile extends StatelessWidget {
  final String title;
  final String? tooltip;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;

  const MySwitchListTile({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.tooltip,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyListTile(
      title: title,
      tooltip: tooltip,
      trailing: Row(
        children: [
          Switch(
            activeColor: Colors.blueGrey,
            onChanged: onChanged,
            value: value,
          ),
          if (label != null) Text(label!),
        ],
      ),
    );
  }
}
