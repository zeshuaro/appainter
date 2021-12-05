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

  MyExpansionPanelList({
    Key? key,
    List<ExpansionPanelItem>? items,
    ExpansionPanelItem? item,
    this.color,
  })  : assert(items != null || item != null),
        items = items ?? [item!],
        super(key: key);

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
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int index, bool isExpanded) {
          setState(() => _expandStates[index] = !isExpanded);
        },
        children: widget.items.mapIndexed((index, item) {
          return ExpansionPanel(
            headerBuilder: (context, isExpanded) {
              return _Header(header: item.header);
            },
            body: item,
            isExpanded: _expandStates[index],
            canTapOnHeader: true,
            backgroundColor: widget.color,
          );
        }).toList(),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final String header;

  const _Header({Key? key, required this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kMargin * 1.5,
        horizontal: kMargin,
      ),
      child: Text(
        header,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
