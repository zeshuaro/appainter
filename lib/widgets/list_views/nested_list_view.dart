import 'package:flutter/material.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/widgets/widgets.dart';

class NestedListView extends StatelessWidget {
  final List<Widget> children;

  const NestedListView({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyListView(
      shrinkwrap: true,
      physics: const ScrollPhysics(),
      padding: kPaddingAll,
      children: children,
    );
  }
}
