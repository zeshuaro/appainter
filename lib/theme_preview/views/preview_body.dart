import 'package:flutter/material.dart';

abstract class PreviewBody extends StatelessWidget {
  const PreviewBody({super.key});

  IconData get icon;
  String get label;
}
