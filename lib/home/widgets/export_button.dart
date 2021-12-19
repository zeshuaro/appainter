import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExportButton extends StatelessWidget {
  const ExportButton({Key? key}) : super(key: key);

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
        context.read<HomeCubit>().themeExported(theme);
      },
      icon: const FaIcon(
        FontAwesomeIcons.download,
        color: Colors.white,
        size: 20,
      ),
      label: const Text(
        'Export',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
