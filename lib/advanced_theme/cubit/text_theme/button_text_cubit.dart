import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension ButtonTextCubit on AdvancedThemeCubit {
  void buttonTextColorChanged(Color color) {
    final style = _getButtonTextTextStyle().copyWith(color: color);
    _emitWithButtonTextTextStyle(style);
  }

  void buttonTextBackgroundColorChanged(Color color) {
    final style = _getButtonTextTextStyle().copyWith(backgroundColor: color);
    _emitWithButtonTextTextStyle(style);
  }

  void buttonTextFontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getButtonTextTextStyle().copyWith(fontSize: size);
      _emitWithButtonTextTextStyle(style);
    }
  }

  void buttonTextFontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getButtonTextTextStyle().copyWith(fontWeight: weight);
      _emitWithButtonTextTextStyle(style);
    }
  }

  void buttonTextFontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getButtonTextTextStyle().copyWith(fontStyle: fontStyle);
      _emitWithButtonTextTextStyle(style);
    }
  }

  void buttonTextLetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getButtonTextTextStyle().copyWith(letterSpacing: spacing);
      _emitWithButtonTextTextStyle(style);
    }
  }

  void buttonTextWordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getButtonTextTextStyle().copyWith(wordSpacing: spacing);
      _emitWithButtonTextTextStyle(style);
    }
  }

  void buttonTextTextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getButtonTextTextStyle().copyWith(textBaseline: baseline);
      _emitWithButtonTextTextStyle(style);
    }
  }

  void buttonTextHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getButtonTextTextStyle().copyWith(height: height);
      _emitWithButtonTextTextStyle(style);
    }
  }

  void buttonTextLeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getButtonTextTextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithButtonTextTextStyle(style);
    }
  }

  void buttonTextDecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getButtonTextTextStyle().copyWith(decoration: decoration);
      _emitWithButtonTextTextStyle(style);
    }
  }

  void buttonTextDecorationColorChanged(Color color) {
    final style = _getButtonTextTextStyle().copyWith(decorationColor: color);
    _emitWithButtonTextTextStyle(style);
  }

  void buttonTextDecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getButtonTextTextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithButtonTextTextStyle(style);
    }
  }

  void buttonTextDecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getButtonTextTextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithButtonTextTextStyle(style);
    }
  }

  void _emitWithButtonTextTextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(button: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getButtonTextTextStyle() {
    return state.themeData.textTheme.button ?? const TextStyle();
  }
}
