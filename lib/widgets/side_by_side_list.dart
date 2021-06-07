import 'package:flutter/material.dart';
import 'package:flutter_theme/widgets/paddings.dart';
import 'package:flutter_theme/widgets/side_by_side.dart';

class SideBySideList extends StatelessWidget {
  final List<Widget> children;

  const SideBySideList({Key? key, required this.children}) : super(key: key);

  static const _chunkSize = 2;

  @override
  Widget build(BuildContext context) {
    final chunks = _getChunks();
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: chunks.length,
      itemBuilder: (context, index) {
        final chunk = chunks[index];
        return chunk.length == _chunkSize
            ? SideBySide(
                left: chunk[0],
                right: chunk[1],
              )
            : chunk[0];
      },
      separatorBuilder: (context, index) => VerticalPadding(),
    );
  }

  List<List<Widget>> _getChunks() {
    final chunks = <List<Widget>>[];
    for (var i = 0; i < children.length; i += _chunkSize) {
      chunks.add(
        children.sublist(
          i,
          i + _chunkSize > children.length ? children.length : i + _chunkSize,
        ),
      );
    }

    return chunks;
  }
}
