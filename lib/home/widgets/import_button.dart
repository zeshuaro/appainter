import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/theme_repository/theme_repository.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ndialog/ndialog.dart';

class ImportButton extends StatelessWidget {
  const ImportButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => _onPressed(context),
      icon: const FaIcon(
        FontAwesomeIcons.upload,
        color: Colors.white,
        size: 20,
      ),
      label: const Text(
        'Import',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Future<void> _onPressed(BuildContext context) async {
    final dialog = ProgressDialog(
      context,
      title: const Text('Import'),
      message: const Text('Importing theme data'),
      dismissable: false,
    )..show();
    final theme = await context.read<ThemeRepository>().import();
    if (theme != null) {
      context.read<AdvancedThemeCubit>().themeDataChanged(theme);
      context.read<HomeCubit>().editModeChanged(EditMode.advanced);
    }
    dialog.dismiss();
  }
}
