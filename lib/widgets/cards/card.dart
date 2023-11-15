import 'package:flutter/material.dart';
import 'package:appainter/common/consts.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final Color? color;
  final EdgeInsets? margin;
  final GestureTapCallback? onTap;

  const MyCard({
    super.key,
    required this.child,
    this.padding = kPaddingAll,
    this.color,
    this.margin,
    this.onTap,
  });

  static final colorDark = Colors.grey[800];
  static final colorLight = Colors.grey[50];

  @override
  Widget build(BuildContext context) {
    final fllbackColor = Theme.of(context).brightness == Brightness.dark
        ? colorDark
        : colorLight;
    return Card(
      color: color ?? fllbackColor,
      margin: margin,
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
        onTap: onTap,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
