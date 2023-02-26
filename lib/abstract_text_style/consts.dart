import 'package:flutter/material.dart';

enum TypeScale {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  labelLarge,
  labelMedium,
  labelSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
}

const _englishTextTheme = Typography.englishLike2018;
final _blackTextTheme = _englishTextTheme.merge(
  Typography.blackMountainView,
);
final _whiteTextTheme = _englishTextTheme.merge(
  Typography.whiteMountainView,
);

final kBlackTextStyles = {
  TypeScale.displayLarge: _blackTextTheme.displayLarge,
  TypeScale.displayMedium: _blackTextTheme.displayMedium,
  TypeScale.displaySmall: _blackTextTheme.displaySmall,
  TypeScale.headlineLarge: _blackTextTheme.headlineLarge,
  TypeScale.headlineMedium: _blackTextTheme.headlineMedium,
  TypeScale.headlineSmall: _blackTextTheme.headlineSmall,
  TypeScale.titleLarge: _blackTextTheme.titleLarge,
  TypeScale.titleMedium: _blackTextTheme.titleMedium,
  TypeScale.titleSmall: _blackTextTheme.titleSmall,
  TypeScale.labelLarge: _blackTextTheme.labelLarge,
  TypeScale.labelMedium: _blackTextTheme.labelMedium,
  TypeScale.labelSmall: _blackTextTheme.labelSmall,
  TypeScale.bodyLarge: _blackTextTheme.bodyLarge,
  TypeScale.bodyMedium: _blackTextTheme.bodyMedium,
  TypeScale.bodySmall: _blackTextTheme.bodySmall,
};

final kWhiteTextStyles = {
  TypeScale.displayLarge: _whiteTextTheme.displayLarge,
  TypeScale.displayMedium: _whiteTextTheme.displayMedium,
  TypeScale.displaySmall: _whiteTextTheme.displaySmall,
  TypeScale.headlineLarge: _whiteTextTheme.headlineLarge,
  TypeScale.headlineMedium: _whiteTextTheme.headlineMedium,
  TypeScale.headlineSmall: _whiteTextTheme.headlineSmall,
  TypeScale.titleLarge: _whiteTextTheme.titleLarge,
  TypeScale.titleMedium: _whiteTextTheme.titleMedium,
  TypeScale.titleSmall: _whiteTextTheme.titleSmall,
  TypeScale.labelLarge: _whiteTextTheme.labelLarge,
  TypeScale.labelMedium: _whiteTextTheme.labelMedium,
  TypeScale.labelSmall: _whiteTextTheme.labelSmall,
  TypeScale.bodyLarge: _whiteTextTheme.bodyLarge,
  TypeScale.bodyMedium: _whiteTextTheme.bodyMedium,
  TypeScale.bodySmall: _whiteTextTheme.bodySmall,
};
