import 'dart:convert';
import 'dart:typed_data';

import 'package:appainter/home/home.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme_plus/json_theme_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:universal_io/io.dart' as io;

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

class MockFilePicker extends Mock implements FilePicker {}

class MockPlatformFile extends Mock implements PlatformFile {}

void main() {
  late Dio dio;
  late HomeRepository repo;
  late FilePicker filePicker;
  late ThemeData themeData;
  late Uint8List themeBytes;

  const filePath = './test/home/test_files/theme.json';
  const isDarkThemeKey = 'isDarkTheme';

  setUpAll(() {
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
    SharedPreferences.setMockInitialValues({});
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

  group('test get is dark theme', () {
    for (var isDark in [true, false]) {
      test('should return $isDark', () async {
        SharedPreferences.setMockInitialValues({isDarkThemeKey: isDark});
        final actual = await repo.getIsDarkTheme();
        expect(actual, equals(isDark));
      });
    }

    test('should return null', () async {
      final actual = await repo.getIsDarkTheme();
      expect(actual, equals(null));
    });
  });

  group('test set is dark theme', () {
    for (var isDark in [true, false]) {
      test('should set value $isDark', () async {
        await repo.setIsDarkTheme(isDark);
        final actual = await repo.getIsDarkTheme();
        expect(actual, equals(isDark));
      });
    }
  });
}
