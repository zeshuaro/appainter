import 'package:flutter/material.dart';
import 'package:flutter_theme/common/common.dart';

class VerticalPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: kMargin);
  }
}

class VerticalPaddingSm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: kMarginSm);
  }
}

class HorizontalPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: kMargin);
  }
}

class HorizontalPaddingSm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: kMarginSm);
  }
}
