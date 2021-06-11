import 'dart:convert';
import 'dart:typed_data';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/cubits/cubits.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/src/editors/editors.dart';
import 'package:flutter_theme/src/theme_preview/theme_preview.dart';
import 'package:flutter_theme/widgets/widgets.dart';
import 'package:json_theme/json_theme.dart';
import 'package:ndialog/ndialog.dart';
import 'package:pretty_json/pretty_json.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Flutter Theme'),
        centerTitle: false,
        actions: [
          _ImportExportBtns(),
          HorizontalPadding(),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: _ScaffoldBody(),
      ),
    );
  }
}

class _ImportExportBtns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final editMode = context.select((HomeCubit cubit) {
          return cubit.state.editMode;
        });
        final basicTheme = context.select((BasicThemeCubit cubit) {
          return cubit.state.themeData;
        });
        final advancedTheme = context.select((AdvancedThemeCubit cubit) {
          return cubit.state.themeData;
        });

        return Row(
          children: [
            TextButton.icon(
              onPressed: () async {
                final dialog = ProgressDialog(
                  context,
                  title: Text('Import'),
                  message: Text('Importing theme data'),
                  dismissable: false,
                )..show();
                try {
                  final file = await FilePickerCross.importFromStorage(
                    type: FileTypeCross.custom,
                    fileExtension: 'json',
                  );
                  final themeBytes = file.toUint8List();
                  final themeStr = String.fromCharCodes(themeBytes);
                  final themeJson = jsonDecode(themeStr);
                  final theme = ThemeDecoder.decodeThemeData(themeJson);

                  if (theme != null) {
                    context.read<AdvancedThemeCubit>().themeDataChanged(theme);
                    context
                        .read<HomeCubit>()
                        .editModeChanged(EditMode.advanced);
                  }
                } on FileSelectionCanceledError {}
                dialog.dismiss();
              },
              icon: Icon(
                Icons.upload,
                color: Colors.white,
              ),
              label: Text(
                'Import',
                style: const TextStyle(color: Colors.white),
              ),
            ),
            HorizontalPadding(),
            TextButton.icon(
              onPressed: () async {
                final theme =
                    editMode == EditMode.basic ? basicTheme : advancedTheme;
                final themeJson = ThemeEncoder.encodeThemeData(theme);
                final themeStr = prettyJson(themeJson);
                final themeBytes = Uint8List.fromList(themeStr.codeUnits);
                final file = FilePickerCross(themeBytes);
                await file.exportToStorage(fileName: 'flutter_theme.json');
              },
              icon: Icon(
                Icons.download,
                color: Colors.white,
              ),
              label: Text(
                'Export',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ScaffoldBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPaddingAll,
      child: _EditorPreview(),
    );
  }
}

class _EditorPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _Editors(),
        ),
        HorizontalPadding(),
        Expanded(
          child: Card(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: ThemePreview(),
            ),
          ),
        )
      ],
    );
  }
}

class _Editors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: EditMode.values.length,
      child: Builder(
        builder: (context) {
          final controller = DefaultTabController.of(context)!;
          controller.addListener(() {
            if (!controller.indexIsChanging &&
                controller.index != controller.previousIndex) {
              context
                  .read<HomeCubit>()
                  .editModeChanged(EditMode.values[controller.index]);
            }
          });

          return BlocListener<HomeCubit, HomeState>(
            listenWhen: (previous, current) {
              return previous.editMode != current.editMode;
            },
            listener: (context, state) {
              controller.animateTo(EditMode.values.indexOf(state.editMode));
            },
            child: Column(
              children: [
                _EditModeTabBar(),
                VerticalPadding(),
                Expanded(
                  child: TabBarView(
                    children: [
                      BasicEditor(),
                      AdvancedEditor(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _EditModeTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 200),
      child: TabBar(
        tabs: EditMode.values.map((mode) {
          final text = EnumToString.convertToString(mode, camelCase: true);
          return Tab(
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            ),
          );
        }).toList(),
        onTap: (index) {
          context.read<HomeCubit>().editModeChanged(EditMode.values[index]);
        },
      ),
    );
  }
}
