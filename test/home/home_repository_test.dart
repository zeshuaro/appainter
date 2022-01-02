import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/home/home.dart';
import 'package:json_theme/json_theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:universal_io/io.dart' as io;

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

class MockFilePicker extends Mock implements FilePicker {}

class MockPlatformFile extends Mock implements PlatformFile {}

void main() {
  late Dio dio;
  late HomeRepository repo;
  late String filePath;
  late FilePicker filePicker;
  late ThemeData themeData;
  late Uint8List themeBytes;

  setUpAll(() {
    filePath = './test/home/test_files/theme.json';
    final file = io.File(filePath);
    final themeStr = file.readAsStringSync();
    final themeJson = jsonDecode(themeStr);

    themeData = ThemeDecoder.decodeThemeData(themeJson)!;
    themeBytes = file.readAsBytesSync();
  });

  setUp(() {
    dio = MockDio();
    filePicker = MockFilePicker();
    repo = HomeRepository(dio: dio, filePicker: filePicker);
  });

  group('test fetch theme usage', () {
    test('should return usage with data on success', () async {
      const data = 'data';
      final response = MockResponse();
      when(() => response.data).thenReturn(data);
      when(() => dio.get(any())).thenAnswer((invocation) {
        return Future.value(response);
      });

      final actual = await repo.fetchThemeUsage();

      expect(actual, equals(const ThemeUsage(data)));
    });

    test('should return usage with null on failure', () async {
      when(() => dio.get(any())).thenThrow(Exception());

      final actual = await repo.fetchThemeUsage();

      expect(actual, equals(const ThemeUsage()));
    });
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

      final actual = await repo.importTheme();

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

      final actual = await repo.importTheme();

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

      final actual = await repo.importTheme();

      expect(actual, equals(null));
    });
  });
}
