import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension Headline4Cubit on AdvancedThemeCubit {
  void headline4ColorChanged(Color color) {
    final style = _getheadline4TextStyle().copyWith(color: color);
    _emitWithheadline4TextStyle(style);
  }

  void headline4BackgroundColorChanged(Color color) {
    final style = _getheadline4TextStyle().copyWith(backgroundColor: color);
    _emitWithheadline4TextStyle(style);
  }

  void headline4FontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getheadline4TextStyle().copyWith(fontSize: size);
      _emitWithheadline4TextStyle(style);
    }
  }

  void headline4FontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getheadline4TextStyle().copyWith(fontWeight: weight);
      _emitWithheadline4TextStyle(style);
    }
  }

  void headline4FontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getheadline4TextStyle().copyWith(fontStyle: fontStyle);
      _emitWithheadline4TextStyle(style);
    }
  }

  void headline4LetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getheadline4TextStyle().copyWith(letterSpacing: spacing);
      _emitWithheadline4TextStyle(style);
    }
  }

  void headline4WordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getheadline4TextStyle().copyWith(wordSpacing: spacing);
      _emitWithheadline4TextStyle(style);
    }
  }

  void headline4TextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getheadline4TextStyle().copyWith(textBaseline: baseline);
      _emitWithheadline4TextStyle(style);
    }
  }

  void headline4HeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getheadline4TextStyle().copyWith(height: height);
      _emitWithheadline4TextStyle(style);
    }
  }

  void headline4LeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getheadline4TextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithheadline4TextStyle(style);
    }
  }

  void headline4DecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getheadline4TextStyle().copyWith(decoration: decoration);
      _emitWithheadline4TextStyle(style);
    }
  }

  void headline4DecorationColorChanged(Color color) {
    final style = _getheadline4TextStyle().copyWith(decorationColor: color);
    _emitWithheadline4TextStyle(style);
  }

  void headline4DecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getheadline4TextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithheadline4TextStyle(style);
    }
  }

  void headline4DecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getheadline4TextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithheadline4TextStyle(style);
    }
  }

  void _emitWithheadline4TextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(headline4: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getheadline4TextStyle() {
    return state.themeData.textTheme.headline4 ?? TextStyle();
  }
}
