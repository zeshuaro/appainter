import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_theme/json_theme.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart' as io;

class HomeRepository {
  final Dio _dio;
  final FilePicker _filePicker;

  HomeRepository({Dio? dio, FilePicker? filePicker})
      : _dio = dio ?? Dio(),
        _filePicker = filePicker ?? FilePicker.platform;

  static const _usageFileUrl =
      'https://raw.githubusercontent.com/zeshuaro/flutter_theme/main/USAGE.md';
  static const _exportFileName = 'flutter_theme.json';

  Future<ThemeUsage> fetchThemeUsage() async {
    try {
      final response = await _dio.get(_usageFileUrl);
      return ThemeUsage(response.data);
    } catch (e) {
      return const ThemeUsage();
    }
  }

  Future<ThemeData?> importTheme() async {
    ThemeData? theme;
    final result = await _filePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
    );

    if (result != null) {
      final platformFile = result.files.single;
      late final String themeStr;

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

  Future<void> exportTheme(ThemeData theme) async {
    final themeJson = ThemeEncoder.encodeThemeData(theme);
    final themeStr = prettyJson(themeJson);
    final themeBytes = Uint8List.fromList(themeStr.codeUnits);

    if (kIsWeb) {
      _exportThemeOnWeb(themeBytes);
    } else {
      _exportThemeOnDesktop(themeBytes);
    }
  }

  void _exportThemeOnWeb(Uint8List bytes) {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = _exportFileName;

    html.document.body?.children.add(anchor);
    anchor.click();
    html.document.body?.children.remove(anchor);
    html.Url.revokeObjectUrl(url);
  }

  Future<void> _exportThemeOnDesktop(Uint8List bytes) async {
    final path = await _filePicker.saveFile(
      dialogTitle: 'Please select an output file:',
      fileName: _exportFileName,
    );

    if (path != null) {
      final file = io.File(path);
      await file.writeAsBytes(bytes);
    }
  }
}
