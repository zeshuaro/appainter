import 'package:dio/dio.dart';
import 'package:flutter_theme/home/home.dart';

class HomeRepo {
  final Dio _dio;

  HomeRepo([Dio? dio]) : _dio = dio ?? Dio();

  static const _usageFileUrl =
      'https://raw.githubusercontent.com/zeshuaro/flutter_theme/main/USAGE.md';

  Future<ThemeUsage> fetchThemeUsage() async {
    try {
      final response = await _dio.get(_usageFileUrl);
      return ThemeUsage(response.data);
    } catch (e) {
      return const ThemeUsage();
    }
  }
}
