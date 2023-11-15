import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/home/home.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ndialog/ndialog.dart';

class ImportButton extends StatefulWidget {
  final Color color;

  const ImportButton({super.key, required this.color});

  @override
  State<ImportButton> createState() => _ImportButtonState();
}

class _ImportButtonState extends State<ImportButton> {
  ProgressDialog? _dialog;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state.isImportingTheme) {
          _dialog = ProgressDialog(
            context,
            title: const Text('Import'),
            message: const Text('Importing theme data'),
            dismissable: false,
          )..show();
        } else if (!state.isImportingTheme) {
          _dialog?.dismiss();
        }
      },
      child: TextButton.icon(
        icon: Icon(
          MdiIcons.applicationImport,
          color: widget.color,
        ),
        label: Text(
          'Import',
          style: TextStyle(color: widget.color),
        ),
        onPressed: () => context.read<HomeCubit>().themeImported(),
      ),
    );
  }
}
