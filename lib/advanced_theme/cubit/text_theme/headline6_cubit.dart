import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension Headline6Cubit on AdvancedThemeCubit {
  void headline6ColorChanged(Color color) {
    final style = _getheadline6TextStyle().copyWith(color: color);
    _emitWithheadline6TextStyle(style);
  }

  void headline6BackgroundColorChanged(Color color) {
    final style = _getheadline6TextStyle().copyWith(backgroundColor: color);
    _emitWithheadline6TextStyle(style);
  }

  void headline6FontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getheadline6TextStyle().copyWith(fontSize: size);
      _emitWithheadline6TextStyle(style);
    }
  }

  void headline6FontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getheadline6TextStyle().copyWith(fontWeight: weight);
      _emitWithheadline6TextStyle(style);
    }
  }

  void headline6FontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getheadline6TextStyle().copyWith(fontStyle: fontStyle);
      _emitWithheadline6TextStyle(style);
    }
  }

  void headline6LetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getheadline6TextStyle().copyWith(letterSpacing: spacing);
      _emitWithheadline6TextStyle(style);
    }
  }

  void headline6WordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getheadline6TextStyle().copyWith(wordSpacing: spacing);
      _emitWithheadline6TextStyle(style);
    }
  }

  void headline6TextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getheadline6TextStyle().copyWith(textBaseline: baseline);
      _emitWithheadline6TextStyle(style);
    }
  }

  void headline6HeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getheadline6TextStyle().copyWith(height: height);
      _emitWithheadline6TextStyle(style);
    }
  }

  void headline6LeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getheadline6TextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithheadline6TextStyle(style);
    }
  }

  void headline6DecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getheadline6TextStyle().copyWith(decoration: decoration);
      _emitWithheadline6TextStyle(style);
    }
  }

  void headline6DecorationColorChanged(Color color) {
    final style = _getheadline6TextStyle().copyWith(decorationColor: color);
    _emitWithheadline6TextStyle(style);
  }

  void headline6DecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getheadline6TextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithheadline6TextStyle(style);
    }
  }

  void headline6DecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getheadline6TextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithheadline6TextStyle(style);
    }
  }

  void _emitWithheadline6TextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(headline6: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getheadline6TextStyle() {
    return state.themeData.textTheme.headline6 ?? const TextStyle();
  }
}
