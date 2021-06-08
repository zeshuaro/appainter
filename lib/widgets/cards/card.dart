import 'package:flutter/material.dart';
import 'package:flutter_theme/common/consts.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const MyCard({
    Key? key,
    required this.child,
    this.padding = kPaddingAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
