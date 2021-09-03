import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension Headline5Cubit on AdvancedThemeCubit {
  void headline5ColorChanged(Color color) {
    final style = _getheadline5TextStyle().copyWith(color: color);
    _emitWithheadline5TextStyle(style);
  }

  void headline5BackgroundColorChanged(Color color) {
    final style = _getheadline5TextStyle().copyWith(backgroundColor: color);
    _emitWithheadline5TextStyle(style);
  }

  void headline5FontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getheadline5TextStyle().copyWith(fontSize: size);
      _emitWithheadline5TextStyle(style);
    }
  }

  void headline5FontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getheadline5TextStyle().copyWith(fontWeight: weight);
      _emitWithheadline5TextStyle(style);
    }
  }

  void headline5FontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getheadline5TextStyle().copyWith(fontStyle: fontStyle);
      _emitWithheadline5TextStyle(style);
    }
  }

  void headline5LetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getheadline5TextStyle().copyWith(letterSpacing: spacing);
      _emitWithheadline5TextStyle(style);
    }
  }

  void headline5WordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getheadline5TextStyle().copyWith(wordSpacing: spacing);
      _emitWithheadline5TextStyle(style);
    }
  }

  void headline5TextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getheadline5TextStyle().copyWith(textBaseline: baseline);
      _emitWithheadline5TextStyle(style);
    }
  }

  void headline5HeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getheadline5TextStyle().copyWith(height: height);
      _emitWithheadline5TextStyle(style);
    }
  }

  void headline5LeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getheadline5TextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithheadline5TextStyle(style);
    }
  }

  void headline5DecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getheadline5TextStyle().copyWith(decoration: decoration);
      _emitWithheadline5TextStyle(style);
    }
  }

  void headline5DecorationColorChanged(Color color) {
    final style = _getheadline5TextStyle().copyWith(decorationColor: color);
    _emitWithheadline5TextStyle(style);
  }

  void headline5DecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getheadline5TextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithheadline5TextStyle(style);
    }
  }

  void headline5DecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getheadline5TextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithheadline5TextStyle(style);
    }
  }

  void _emitWithheadline5TextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(headline5: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getheadline5TextStyle() {
    return state.themeData.textTheme.headline5 ?? TextStyle();
  }
}
