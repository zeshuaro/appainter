// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension BodyText1Cubit on AdvancedThemeCubit {
  void bodyText1ColorChanged(Color color) {
    final style = _getBodyText1TextStyle().copyWith(color: color);
    _emitWithBodyText1TextStyle(style);
  }

  void bodyText1BackgroundColorChanged(Color color) {
    final style = _getBodyText1TextStyle().copyWith(backgroundColor: color);
    _emitWithBodyText1TextStyle(style);
  }

  void bodyText1FontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getBodyText1TextStyle().copyWith(fontSize: size);
      _emitWithBodyText1TextStyle(style);
    }
  }

  void bodyText1FontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getBodyText1TextStyle().copyWith(fontWeight: weight);
      _emitWithBodyText1TextStyle(style);
    }
  }

  void bodyText1FontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getBodyText1TextStyle().copyWith(fontStyle: fontStyle);
      _emitWithBodyText1TextStyle(style);
    }
  }

  void bodyText1LetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getBodyText1TextStyle().copyWith(letterSpacing: spacing);
      _emitWithBodyText1TextStyle(style);
    }
  }

  void bodyText1WordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getBodyText1TextStyle().copyWith(wordSpacing: spacing);
      _emitWithBodyText1TextStyle(style);
    }
  }

  void bodyText1TextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getBodyText1TextStyle().copyWith(textBaseline: baseline);
      _emitWithBodyText1TextStyle(style);
    }
  }

  void bodyText1HeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getBodyText1TextStyle().copyWith(height: height);
      _emitWithBodyText1TextStyle(style);
    }
  }

  void bodyText1LeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getBodyText1TextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithBodyText1TextStyle(style);
    }
  }

  void bodyText1DecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getBodyText1TextStyle().copyWith(decoration: decoration);
      _emitWithBodyText1TextStyle(style);
    }
  }

  void bodyText1DecorationColorChanged(Color color) {
    final style = _getBodyText1TextStyle().copyWith(decorationColor: color);
    _emitWithBodyText1TextStyle(style);
  }

  void bodyText1DecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getBodyText1TextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithBodyText1TextStyle(style);
    }
  }

  void bodyText1DecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getBodyText1TextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithBodyText1TextStyle(style);
    }
  }

  void _emitWithBodyText1TextStyle(TextStyle style) {
    final textTheme = state.themeData.textTheme.copyWith(bodyText1: style);
    emit(
      state.copyWith(
        themeData: state.themeData.copyWith(textTheme: textTheme),
      ),
    );
  }

  TextStyle _getBodyText1TextStyle() {
    return state.themeData.textTheme.bodyText1 ?? const TextStyle();
  }
}
