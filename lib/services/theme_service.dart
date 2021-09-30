import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart' as io;

class ThemeService {
  const ThemeService();

  static const exportFileName = 'flutter_theme.json';

  Future<ThemeData?> import() async {
    ThemeData? theme;
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      final platformFile = result.files.single;
      late final themeStr;

      if (platformFile.bytes != null) {
        themeStr = String.fromCharCodes(platformFile.bytes!);
      } else {
        final file = io.File(platformFile.path!);
        themeStr = await file.readAsString();
      }

      final themeJson = jsonDecode(themeStr);
      theme = ThemeDecoder.decodeThemeData(themeJson);
    }

    return theme;
  }

  Future<void> export(ThemeData theme) async {
    final themeJson = ThemeEncoder.encodeThemeData(theme);
    final themeStr = prettyJson(themeJson);
    final themeBytes = Uint8List.fromList(themeStr.codeUnits);

    if (kIsWeb) {
      _exportWeb(themeBytes);
    } else {
      _exportDesktop(themeBytes);
    }
  }

  void _exportWeb(Uint8List bytes) {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = exportFileName;

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }

  Future<void> _exportDesktop(Uint8List bytes) async {
    final path = await FilePicker.platform.saveFile(
      dialogTitle: 'Please select an output file:',
      fileName: exportFileName,
    );

    if (path != null) {
      final file = io.File(path);
      await file.writeAsBytes(bytes);
    }
  }
}
