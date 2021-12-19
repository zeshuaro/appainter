// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension OverlineTextCubit on AdvancedThemeCubit {
  void overlineTextColorChanged(Color color) {
    final style = _getOverlineTextTextStyle().copyWith(color: color);
    _emitWithOverlineTextTextStyle(style);
  }

  void overlineTextBackgroundColorChanged(Color color) {
    final style = _getOverlineTextTextStyle().copyWith(backgroundColor: color);
    _emitWithOverlineTextTextStyle(style);
  }

  void overlineTextFontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getOverlineTextTextStyle().copyWith(fontSize: size);
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void overlineTextFontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getOverlineTextTextStyle().copyWith(fontWeight: weight);
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void overlineTextFontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getOverlineTextTextStyle().copyWith(fontStyle: fontStyle);
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void overlineTextLetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style =
          _getOverlineTextTextStyle().copyWith(letterSpacing: spacing);
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void overlineTextWordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getOverlineTextTextStyle().copyWith(wordSpacing: spacing);
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void overlineTextTextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style =
          _getOverlineTextTextStyle().copyWith(textBaseline: baseline);
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void overlineTextHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getOverlineTextTextStyle().copyWith(height: height);
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void overlineTextLeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getOverlineTextTextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void overlineTextDecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style =
          _getOverlineTextTextStyle().copyWith(decoration: decoration);
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void overlineTextDecorationColorChanged(Color color) {
    final style = _getOverlineTextTextStyle().copyWith(decorationColor: color);
    _emitWithOverlineTextTextStyle(style);
  }

  void overlineTextDecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getOverlineTextTextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void overlineTextDecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getOverlineTextTextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithOverlineTextTextStyle(style);
    }
  }

  void _emitWithOverlineTextTextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(overline: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getOverlineTextTextStyle() {
    return state.themeData.textTheme.overline ?? const TextStyle();
  }
}
