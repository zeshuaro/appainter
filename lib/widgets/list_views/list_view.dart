import 'package:flutter/material.dart';
import 'package:appainter/widgets/widgets.dart';

class MyListView extends StatelessWidget {
  final List<Widget> children;
  final bool shrinkwrap;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;

  const MyListView({
    super.key,
    required this.children,
    this.shrinkwrap = false,
    this.physics,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: padding,
      physics: physics,
      shrinkWrap: shrinkwrap,
      itemCount: children.length,
      itemBuilder: (context, index) => children[index],
      separatorBuilder: (context, index) => const VerticalPadding(),
    );
  }
}
