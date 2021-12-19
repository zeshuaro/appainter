import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/theme_repository/theme_repository.dart';
import 'package:json_theme/json_theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universal_io/io.dart' as io;

class MockFilePicker extends Mock implements FilePicker {}

class MockPlatformFile extends Mock implements PlatformFile {}

void main() {
  late String filePath;
  late FilePicker filePicker;
  late ThemeRepository repo;
  late ThemeData themeData;
  late Uint8List themeBytes;

  setUpAll(() {
    filePath = './test/theme_repository/test_files/theme.json';
    final file = io.File(filePath);
    final themeStr = file.readAsStringSync();
    final themeJson = jsonDecode(themeStr);

    themeData = ThemeDecoder.decodeThemeData(themeJson)!;
    themeBytes = file.readAsBytesSync();
  });

  setUp(() {
    filePicker = MockFilePicker();
    repo = ThemeRepository(filePicker: filePicker);
  });

  group('test import', () {
    test('should return theme data on web with valid json theme', () async {
      final file = MockPlatformFile();
      when(() => file.bytes).thenReturn(themeBytes);

      when(() {
        return filePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['json'],
        );
      }).thenAnswer((invocation) {
        return Future.value(FilePickerResult([file]));
      });

      final actual = await repo.import();

      expect(actual, equals(themeData));
    });

    test('should return theme data on desktop with valid json theme', () async {
      final file = MockPlatformFile();
      when(() => file.path).thenReturn(filePath);

      when(() {
        return filePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['json'],
        );
      }).thenAnswer((invocation) {
        return Future.value(FilePickerResult([file]));
      });

      final actual = await repo.import();

      expect(actual, equals(themeData));
    });

    test('should return null theme data on canceled operation', () async {
      when(() {
        return filePicker.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['json'],
        );
      }).thenAnswer((invocation) {
        return Future.value(null);
      });

      final actual = await repo.import();

      expect(actual, equals(null));
    });
  });
}
