import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';
import 'package:pretty_json/pretty_json.dart';

class ThemeService {
  const ThemeService();

  static const exportFileName = 'flutter_theme.json';

  Future<ThemeData?> import() async {
    ThemeData? theme;
    try {
      final file = await FilePickerCross.importFromStorage(
        type: FileTypeCross.custom,
        fileExtension: 'json',
      );
      final themeBytes = file.toUint8List();
      final themeStr = String.fromCharCodes(themeBytes);
      final themeJson = jsonDecode(themeStr);
      theme = ThemeDecoder.decodeThemeData(themeJson);
    } on FileSelectionCanceledError {}

    return theme;
  }

  Future<void> export(ThemeData theme) async {
    final themeJson = ThemeEncoder.encodeThemeData(theme);
    final themeStr = prettyJson(themeJson);
    final themeBytes = Uint8List.fromList(themeStr.codeUnits);

    final file = FilePickerCross(themeBytes);
    await file.exportToStorage(fileName: exportFileName);
  }
}
