import 'package:flutter/material.dart';

abstract class PreviewBody extends StatelessWidget {
  const PreviewBody({Key? key}) : super(key: key);

  IconData get icon;
  String get label;
}
