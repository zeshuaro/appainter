import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockResponse extends Mock implements Response {}

void main() {
  final dio = MockDio();
  late HomeRepo repo;

  const usageFileUrl =
      'https://raw.githubusercontent.com/zeshuaro/flutter_theme/main/USAGE.md';

  setUp(() => repo = HomeRepo(dio));

  group('fetchThemeUsage', () {
    test('should return usage with data on success', () async {
      const data = 'data';
      final response = MockResponse();
      when(() => response.data).thenReturn(data);
      when(() => dio.get(usageFileUrl)).thenAnswer((invocation) {
        return Future.value(response);
      });

      final actual = await repo.fetchThemeUsage();

      expect(actual, equals(const ThemeUsage(data)));
    });

    test('should return usage with null on failure', () async {
      when(() => dio.get(usageFileUrl)).thenThrow(Exception());

      final actual = await repo.fetchThemeUsage();

      expect(actual, equals(const ThemeUsage()));
    });
  });
}
