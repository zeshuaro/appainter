import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension Subtitle1Cubit on AdvancedThemeCubit {
  void subtitle1ColorChanged(Color color) {
    final style = _getsubtitle1TextStyle().copyWith(color: color);
    _emitWithsubtitle1TextStyle(style);
  }

  void subtitle1BackgroundColorChanged(Color color) {
    final style = _getsubtitle1TextStyle().copyWith(backgroundColor: color);
    _emitWithsubtitle1TextStyle(style);
  }

  void subtitle1FontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getsubtitle1TextStyle().copyWith(fontSize: size);
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void subtitle1FontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getsubtitle1TextStyle().copyWith(fontWeight: weight);
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void subtitle1FontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getsubtitle1TextStyle().copyWith(fontStyle: fontStyle);
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void subtitle1LetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getsubtitle1TextStyle().copyWith(letterSpacing: spacing);
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void subtitle1WordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getsubtitle1TextStyle().copyWith(wordSpacing: spacing);
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void subtitle1TextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getsubtitle1TextStyle().copyWith(textBaseline: baseline);
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void subtitle1HeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getsubtitle1TextStyle().copyWith(height: height);
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void subtitle1LeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getsubtitle1TextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void subtitle1DecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getsubtitle1TextStyle().copyWith(decoration: decoration);
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void subtitle1DecorationColorChanged(Color color) {
    final style = _getsubtitle1TextStyle().copyWith(decorationColor: color);
    _emitWithsubtitle1TextStyle(style);
  }

  void subtitle1DecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getsubtitle1TextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void subtitle1DecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getsubtitle1TextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithsubtitle1TextStyle(style);
    }
  }

  void _emitWithsubtitle1TextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(subtitle1: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getsubtitle1TextStyle() {
    return state.themeData.textTheme.subtitle1 ?? const TextStyle();
  }
}
