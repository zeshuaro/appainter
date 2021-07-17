import 'package:equatable/equatable.dart';

class ThemeUsage extends Equatable {
  final String? markdownData;

  ThemeUsage([this.markdownData]);

  static const markdownUrl =
      'https://github.com/zeshuaro/flutter_theme/blob/main/USAGE.md';

  @override
  List<Object?> get props => [markdownData];
}
