import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension Headline3Cubit on AdvancedThemeCubit {
  void headline3ColorChanged(Color color) {
    final style = _getheadline3TextStyle().copyWith(color: color);
    _emitWithheadline3TextStyle(style);
  }

  void headline3BackgroundColorChanged(Color color) {
    final style = _getheadline3TextStyle().copyWith(backgroundColor: color);
    _emitWithheadline3TextStyle(style);
  }

  void headline3FontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getheadline3TextStyle().copyWith(fontSize: size);
      _emitWithheadline3TextStyle(style);
    }
  }

  void headline3FontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getheadline3TextStyle().copyWith(fontWeight: weight);
      _emitWithheadline3TextStyle(style);
    }
  }

  void headline3FontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getheadline3TextStyle().copyWith(fontStyle: fontStyle);
      _emitWithheadline3TextStyle(style);
    }
  }

  void headline3LetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getheadline3TextStyle().copyWith(letterSpacing: spacing);
      _emitWithheadline3TextStyle(style);
    }
  }

  void headline3WordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getheadline3TextStyle().copyWith(wordSpacing: spacing);
      _emitWithheadline3TextStyle(style);
    }
  }

  void headline3TextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getheadline3TextStyle().copyWith(textBaseline: baseline);
      _emitWithheadline3TextStyle(style);
    }
  }

  void headline3HeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getheadline3TextStyle().copyWith(height: height);
      _emitWithheadline3TextStyle(style);
    }
  }

  void headline3LeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getheadline3TextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithheadline3TextStyle(style);
    }
  }

  void headline3DecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getheadline3TextStyle().copyWith(decoration: decoration);
      _emitWithheadline3TextStyle(style);
    }
  }

  void headline3DecorationColorChanged(Color color) {
    final style = _getheadline3TextStyle().copyWith(decorationColor: color);
    _emitWithheadline3TextStyle(style);
  }

  void headline3DecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getheadline3TextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithheadline3TextStyle(style);
    }
  }

  void headline3DecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getheadline3TextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithheadline3TextStyle(style);
    }
  }

  void _emitWithheadline3TextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(headline3: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getheadline3TextStyle() {
    return state.themeData.textTheme.headline3 ?? TextStyle();
  }
}
