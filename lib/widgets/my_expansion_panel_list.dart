import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';

abstract class ExpansionPanelItem extends StatelessWidget {
  String get header;

  const ExpansionPanelItem({Key? key}) : super(key: key);
}

class MyExpansionPanelList extends StatefulWidget {
  final List<ExpansionPanelItem> items;
  final Color? color;

  const MyExpansionPanelList({
    Key? key,
    required this.items,
    this.color,
  }) : super(key: key);

  @override
  State<MyExpansionPanelList> createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  late final List<bool> _expandStates;

  @override
  void initState() {
    super.initState();
    _expandStates = List.filled(widget.items.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (int index, bool isExpanded) {
        setState(() => _expandStates[index] = !isExpanded);
      },
      children: widget.items.mapIndexed((index, item) {
        return ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kMargin * 1.5,
                horizontal: kMargin,
              ),
              child: Text(
                item.header,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            );
          },
          body: item,
          isExpanded: _expandStates[index],
          canTapOnHeader: true,
          backgroundColor: widget.color,
        );
      }).toList(),
    );
  }
}
