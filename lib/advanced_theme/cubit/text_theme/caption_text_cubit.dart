// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension CaptionTextCubit on AdvancedThemeCubit {
  void captionTextColorChanged(Color color) {
    final style = _getCaptionTextTextStyle().copyWith(color: color);
    _emitWithCaptionTextTextStyle(style);
  }

  void captionTextBackgroundColorChanged(Color color) {
    final style = _getCaptionTextTextStyle().copyWith(backgroundColor: color);
    _emitWithCaptionTextTextStyle(style);
  }

  void captionTextFontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getCaptionTextTextStyle().copyWith(fontSize: size);
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void captionTextFontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getCaptionTextTextStyle().copyWith(fontWeight: weight);
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void captionTextFontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getCaptionTextTextStyle().copyWith(fontStyle: fontStyle);
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void captionTextLetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getCaptionTextTextStyle().copyWith(letterSpacing: spacing);
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void captionTextWordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getCaptionTextTextStyle().copyWith(wordSpacing: spacing);
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void captionTextTextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getCaptionTextTextStyle().copyWith(textBaseline: baseline);
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void captionTextHeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getCaptionTextTextStyle().copyWith(height: height);
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void captionTextLeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getCaptionTextTextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void captionTextDecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getCaptionTextTextStyle().copyWith(decoration: decoration);
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void captionTextDecorationColorChanged(Color color) {
    final style = _getCaptionTextTextStyle().copyWith(decorationColor: color);
    _emitWithCaptionTextTextStyle(style);
  }

  void captionTextDecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getCaptionTextTextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void captionTextDecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getCaptionTextTextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithCaptionTextTextStyle(style);
    }
  }

  void _emitWithCaptionTextTextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(caption: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getCaptionTextTextStyle() {
    return state.themeData.textTheme.caption ?? const TextStyle();
  }
}
