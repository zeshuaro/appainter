import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';

enum PaddingSize { small, medium, normal, large, extraLarge }

class VerticalPadding extends StatelessWidget {
  final PaddingSize size;

  const VerticalPadding({Key? key, this.size = PaddingSize.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: _getSize(size));
  }
}

class HorizontalPadding extends StatelessWidget {
  final PaddingSize size;

  const HorizontalPadding({Key? key, this.size = PaddingSize.normal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: _getSize(size));
  }
}

double _getSize(PaddingSize paddingSize) {
  late final double size;
  switch (paddingSize) {
    case PaddingSize.small:
      size = kMargin / 4;
      break;
    case PaddingSize.medium:
      size = kMargin / 2;
      break;
    case PaddingSize.large:
      size = kMargin * 2;
      break;
    case PaddingSize.extraLarge:
      size = kMargin * 4;
      break;
    default:
      size = kMargin;
  }

  return size;
}
