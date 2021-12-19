// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension Headline2Cubit on AdvancedThemeCubit {
  void headline2ColorChanged(Color color) {
    final style = _getheadline2TextStyle().copyWith(color: color);
    _emitWithheadline2TextStyle(style);
  }

  void headline2BackgroundColorChanged(Color color) {
    final style = _getheadline2TextStyle().copyWith(backgroundColor: color);
    _emitWithheadline2TextStyle(style);
  }

  void headline2FontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getheadline2TextStyle().copyWith(fontSize: size);
      _emitWithheadline2TextStyle(style);
    }
  }

  void headline2FontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getheadline2TextStyle().copyWith(fontWeight: weight);
      _emitWithheadline2TextStyle(style);
    }
  }

  void headline2FontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getheadline2TextStyle().copyWith(fontStyle: fontStyle);
      _emitWithheadline2TextStyle(style);
    }
  }

  void headline2LetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getheadline2TextStyle().copyWith(letterSpacing: spacing);
      _emitWithheadline2TextStyle(style);
    }
  }

  void headline2WordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getheadline2TextStyle().copyWith(wordSpacing: spacing);
      _emitWithheadline2TextStyle(style);
    }
  }

  void headline2TextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getheadline2TextStyle().copyWith(textBaseline: baseline);
      _emitWithheadline2TextStyle(style);
    }
  }

  void headline2HeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getheadline2TextStyle().copyWith(height: height);
      _emitWithheadline2TextStyle(style);
    }
  }

  void headline2LeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getheadline2TextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithheadline2TextStyle(style);
    }
  }

  void headline2DecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getheadline2TextStyle().copyWith(decoration: decoration);
      _emitWithheadline2TextStyle(style);
    }
  }

  void headline2DecorationColorChanged(Color color) {
    final style = _getheadline2TextStyle().copyWith(decorationColor: color);
    _emitWithheadline2TextStyle(style);
  }

  void headline2DecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getheadline2TextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithheadline2TextStyle(style);
    }
  }

  void headline2DecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getheadline2TextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithheadline2TextStyle(style);
    }
  }

  void _emitWithheadline2TextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(headline2: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getheadline2TextStyle() {
    return state.themeData.textTheme.headline2 ?? const TextStyle();
  }
}
