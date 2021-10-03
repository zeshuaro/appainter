import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';

class VerticalPadding extends StatelessWidget {
  const VerticalPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: kMargin);
  }
}

class VerticalPaddingSm extends StatelessWidget {
  const VerticalPaddingSm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: kMarginSm);
  }
}

class HorizontalPadding extends StatelessWidget {
  const HorizontalPadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: kMargin);
  }
}

class HorizontalPaddingSm extends StatelessWidget {
  const HorizontalPaddingSm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(width: kMarginSm);
  }
}
