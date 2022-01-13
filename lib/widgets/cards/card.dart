import 'package:flutter/material.dart';
import 'package:appainter/common/consts.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? color;

  const MyCard({
    Key? key,
    required this.child,
    this.padding = kPaddingAll,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fllbackColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[800]
        : Colors.grey[50];
    return Card(
      color: color ?? fllbackColor,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
