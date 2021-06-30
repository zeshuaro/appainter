import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/services/services.dart';

class ExportBtn extends StatelessWidget {
  final ThemeService themeService;

  const ExportBtn({Key? key, required this.themeService}) : super(key: key);

  static const exportFileName = 'flutter_theme.json';

  @override
  Widget build(BuildContext context) {
    final editMode = context.select((HomeCubit cubit) {
      return cubit.state.editMode;
    });
    final basicTheme = context.select((BasicThemeCubit cubit) {
      return cubit.state.themeData;
    });
    final advancedTheme = context.select((AdvancedThemeCubit cubit) {
      return cubit.state.themeData;
    });

    return TextButton.icon(
      onPressed: () {
        final theme = editMode == EditMode.basic ? basicTheme : advancedTheme;
        themeService.export(theme);
      },
      icon: Icon(
        Icons.download,
        color: Colors.white,
      ),
      label: Text(
        'Export',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
