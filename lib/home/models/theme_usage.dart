import 'package:equatable/equatable.dart';

class ThemeUsage extends Equatable {
  final String? markdownData;

  const ThemeUsage([this.markdownData]);

  static const markdownUrl =
      'https://github.com/zeshuaro/appainter/blob/main/USAGE.md';

  @override
  List<Object?> get props => [markdownData];
}
