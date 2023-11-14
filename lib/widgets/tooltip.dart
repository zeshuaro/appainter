import 'package:appainter/common/common.dart';
import 'package:flutter/material.dart';

class MyTooltip extends StatelessWidget {
  final String? tooltip;
  final Widget child;

  const MyTooltip({super.key, this.tooltip, required this.child});

  @override
  Widget build(BuildContext context) {
    return tooltip != null
        ? Tooltip(
            message: tooltip!,
            padding: const EdgeInsets.all(kMargin / 2),
            child: child,
          )
        : child;
  }
}
