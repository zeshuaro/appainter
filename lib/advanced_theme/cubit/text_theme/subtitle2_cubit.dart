// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension Subtitle2Cubit on AdvancedThemeCubit {
  void subtitle2ColorChanged(Color color) {
    final style = _getsubtitle2TextStyle().copyWith(color: color);
    _emitWithsubtitle2TextStyle(style);
  }

  void subtitle2BackgroundColorChanged(Color color) {
    final style = _getsubtitle2TextStyle().copyWith(backgroundColor: color);
    _emitWithsubtitle2TextStyle(style);
  }

  void subtitle2FontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getsubtitle2TextStyle().copyWith(fontSize: size);
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void subtitle2FontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getsubtitle2TextStyle().copyWith(fontWeight: weight);
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void subtitle2FontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getsubtitle2TextStyle().copyWith(fontStyle: fontStyle);
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void subtitle2LetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getsubtitle2TextStyle().copyWith(letterSpacing: spacing);
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void subtitle2WordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getsubtitle2TextStyle().copyWith(wordSpacing: spacing);
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void subtitle2TextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getsubtitle2TextStyle().copyWith(textBaseline: baseline);
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void subtitle2HeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getsubtitle2TextStyle().copyWith(height: height);
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void subtitle2LeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getsubtitle2TextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void subtitle2DecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getsubtitle2TextStyle().copyWith(decoration: decoration);
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void subtitle2DecorationColorChanged(Color color) {
    final style = _getsubtitle2TextStyle().copyWith(decorationColor: color);
    _emitWithsubtitle2TextStyle(style);
  }

  void subtitle2DecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getsubtitle2TextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void subtitle2DecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getsubtitle2TextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithsubtitle2TextStyle(style);
    }
  }

  void _emitWithsubtitle2TextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(subtitle2: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getsubtitle2TextStyle() {
    return state.themeData.textTheme.subtitle2 ?? const TextStyle();
  }
}
