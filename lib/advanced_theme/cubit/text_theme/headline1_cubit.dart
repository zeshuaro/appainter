// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/models/models.dart';

extension Headline1Cubit on AdvancedThemeCubit {
  void headline1ColorChanged(Color color) {
    final style = _getHeadline1TextStyle().copyWith(color: color);
    _emitWithHeadline1TextStyle(style);
  }

  void headline1BackgroundColorChanged(Color color) {
    final style = _getHeadline1TextStyle().copyWith(backgroundColor: color);
    _emitWithHeadline1TextStyle(style);
  }

  void headline1FontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getHeadline1TextStyle().copyWith(fontSize: size);
      _emitWithHeadline1TextStyle(style);
    }
  }

  void headline1FontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getHeadline1TextStyle().copyWith(fontWeight: weight);
      _emitWithHeadline1TextStyle(style);
    }
  }

  void headline1FontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getHeadline1TextStyle().copyWith(fontStyle: fontStyle);
      _emitWithHeadline1TextStyle(style);
    }
  }

  void headline1LetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getHeadline1TextStyle().copyWith(letterSpacing: spacing);
      _emitWithHeadline1TextStyle(style);
    }
  }

  void headline1WordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getHeadline1TextStyle().copyWith(wordSpacing: spacing);
      _emitWithHeadline1TextStyle(style);
    }
  }

  void headline1TextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getHeadline1TextStyle().copyWith(textBaseline: baseline);
      _emitWithHeadline1TextStyle(style);
    }
  }

  void headline1HeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getHeadline1TextStyle().copyWith(height: height);
      _emitWithHeadline1TextStyle(style);
    }
  }

  void headline1LeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getHeadline1TextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithHeadline1TextStyle(style);
    }
  }

  void headline1DecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getHeadline1TextStyle().copyWith(decoration: decoration);
      _emitWithHeadline1TextStyle(style);
    }
  }

  void headline1DecorationColorChanged(Color color) {
    final style = _getHeadline1TextStyle().copyWith(decorationColor: color);
    _emitWithHeadline1TextStyle(style);
  }

  void headline1DecorationStyleChanged(String value) {
    if (value == kNone) {
      final style = _getHeadline1TextStyle().copyWithNull(
        decorationStyle: true,
      );
      _emitWithHeadline1TextStyle(style);
    } else {
      final decorationStyle = EnumToString.fromString(
        TextDecorationStyle.values,
        value,
      );
      if (decorationStyle != null) {
        final style = _getHeadline1TextStyle().copyWith(
          decorationStyle: decorationStyle,
        );
        _emitWithHeadline1TextStyle(style);
      }
    }
  }

  void headline1DecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getHeadline1TextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithHeadline1TextStyle(style);
    }
  }

  void _emitWithHeadline1TextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(headline1: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getHeadline1TextStyle() {
    return state.themeData.textTheme.headline1 ?? const TextStyle();
  }
}
