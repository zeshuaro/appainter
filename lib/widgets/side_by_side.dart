import 'package:flutter/material.dart';

class SideBySide extends StatelessWidget {
  final Widget left;
  final Widget right;

  const SideBySide({Key? key, required this.left, required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(child: left),
          const VerticalDivider(),
          Expanded(child: right),
        ],
      ),
    );
  }
}
