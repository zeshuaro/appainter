import 'package:flutter/material.dart';
import 'package:appainter/common/consts.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color color;

  MyCard({
    Key? key,
    required this.child,
    this.padding = kPaddingAll,
    Color? color,
  })  : color = color ?? Colors.grey[50]!,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
