import 'dart:convert';

import 'package:appainter/home/home.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_theme_plus/json_theme_plus.dart';
import 'package:pretty_json/pretty_json.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_io/io.dart' as io;

class HomeRepository {
  final Dio _dio;
  final FilePicker _filePicker;

  HomeRepository({Dio? dio, FilePicker? filePicker})
      : _dio = dio ?? Dio(),
        _filePicker = filePicker ?? FilePicker.platform;

  static const _usageFileUrl =
      'https://raw.githubusercontent.com/zeshuaro/appainter/main/USAGE.md';
  static const _exportFileName = 'appainter_theme.json';
  static const _isDarkThemeKey = 'isDarkTheme';

  Future<ThemeUsage> fetchThemeUsage() async {
    try {
      final response = await _dio.get(_usageFileUrl);
      return ThemeUsage(response.data);
    } catch (e, st) {
      Sentry.captureException(e, stackTrace: st);
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
      theme = ThemeDecoder.decodeThemeData(themeJson, validate: false);
    }

    return theme;
  }

  Future<bool> exportTheme(ThemeData theme) async {
    final themeJson = ThemeEncoder.encodeThemeData(theme);
    final themeStr = prettyJson(themeJson);
    final themeBytes = Uint8List.fromList(themeStr.codeUnits);

    if (kIsWeb) {
      _exportThemeOnWeb(themeBytes);
      return true;
    } else {
      return await _exportThemeOnDesktop(themeBytes);
    }
  }

  Future<bool?> getIsDarkTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isDarkThemeKey);
  }

  Future<void> setIsDarkTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDarkThemeKey, isDark);
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

  Future<bool> _exportThemeOnDesktop(Uint8List bytes) async {
    final path = await _filePicker.saveFile(
      dialogTitle: 'Please select an output file:',
      fileName: _exportFileName,
    );

    if (path != null) {
      final file = io.File(path);
      await file.writeAsBytes(bytes);
      return true;
    }

    return false;
  }
}
