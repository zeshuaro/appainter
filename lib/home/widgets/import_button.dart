import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/home/home.dart';
import 'package:ndialog/ndialog.dart';

class ImportButton extends StatefulWidget {
  const ImportButton({Key? key}) : super(key: key);

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
      child: TextButton(
        onPressed: () => context.read<HomeCubit>().themeImported(),
        child: const Text(
          'Import',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
