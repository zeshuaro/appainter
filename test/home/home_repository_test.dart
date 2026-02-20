import 'dart:convert';
import 'dart:typed_data';

import 'package:appainter/home/home.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:json_theme/json_theme.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

class MockFilePicker extends Mock implements FilePicker {}

class MockPlatformFile extends Mock implements PlatformFile {}

class MockThemeDecoder extends Mock implements ThemeDecoder {}

class MockThemeEncoder extends Mock implements ThemeEncoder {}

void main() {
  late Dio dio;
  late FilePicker filePicker;
  late ThemeDecoder themeDecoder;
  late ThemeEncoder themeEncoder;
  late HomeRepository repo;

  final themeData = ThemeData();
  final themeJson = {'key': 'value'};
  final themeStr = jsonEncode(themeJson);
  final themeBytes = Uint8List.fromList(themeStr.codeUnits);

  const filePath = './test/home/test_files/theme.json';
  const isDarkThemeKey = 'isDarkTheme';

  setUp(() {
    dio = MockDio();
    filePicker = MockFilePicker();
    themeDecoder = MockThemeDecoder();
    themeEncoder = MockThemeEncoder();

    repo = HomeRepository(
      dio: dio,
      filePicker: filePicker,
      themeDecoder: themeDecoder,
      themeEncoder: themeEncoder,
    );
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

      when(
        () => themeDecoder.decodeThemeData(themeJson, validate: false),
      ).thenReturn(themeData);

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

      when(
        () => themeDecoder.decodeThemeData(any(), validate: false),
      ).thenReturn(themeData);

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
