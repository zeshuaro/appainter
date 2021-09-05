import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/models/models.dart';

extension bodyText2Cubit on AdvancedThemeCubit {
  void bodyText2ColorChanged(Color color) {
    final style = _getBodyText2TextStyle().copyWith(color: color);
    _emitWithBodyText2TextStyle(style);
  }

  void bodyText2BackgroundColorChanged(Color color) {
    final style = _getBodyText2TextStyle().copyWith(backgroundColor: color);
    _emitWithBodyText2TextStyle(style);
  }

  void bodyText2FontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = _getBodyText2TextStyle().copyWith(fontSize: size);
      _emitWithBodyText2TextStyle(style);
    }
  }

  void bodyText2FontWeightChanged(String value) {
    final weight = MyFontWeight().enumFromString(value);
    if (weight != null) {
      final style = _getBodyText2TextStyle().copyWith(fontWeight: weight);
      _emitWithBodyText2TextStyle(style);
    }
  }

  void bodyText2FontStyleChanged(String value) {
    final fontStyle = EnumToString.fromString(FontStyle.values, value);
    if (fontStyle != null) {
      final style = _getBodyText2TextStyle().copyWith(fontStyle: fontStyle);
      _emitWithBodyText2TextStyle(style);
    }
  }

  void bodyText2LetterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getBodyText2TextStyle().copyWith(letterSpacing: spacing);
      _emitWithBodyText2TextStyle(style);
    }
  }

  void bodyText2WordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = _getBodyText2TextStyle().copyWith(wordSpacing: spacing);
      _emitWithBodyText2TextStyle(style);
    }
  }

  void bodyText2TextBaselineChanged(String value) {
    final baseline = EnumToString.fromString(TextBaseline.values, value);
    if (baseline != null) {
      final style = _getBodyText2TextStyle().copyWith(textBaseline: baseline);
      _emitWithBodyText2TextStyle(style);
    }
  }

  void bodyText2HeightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = _getBodyText2TextStyle().copyWith(height: height);
      _emitWithBodyText2TextStyle(style);
    }
  }

  void bodyText2LeadingDistributionChanged(String value) {
    final dist = EnumToString.fromString(TextLeadingDistribution.values, value);
    if (dist != null) {
      final style = _getBodyText2TextStyle().copyWith(
        leadingDistribution: dist,
      );
      _emitWithBodyText2TextStyle(style);
    }
  }

  void bodyText2DecorationChanged(String value) {
    final decoration = MyTextDecoration().enumFromString(value);
    if (decoration != null) {
      final style = _getBodyText2TextStyle().copyWith(decoration: decoration);
      _emitWithBodyText2TextStyle(style);
    }
  }

  void bodyText2DecorationColorChanged(Color color) {
    final style = _getBodyText2TextStyle().copyWith(decorationColor: color);
    _emitWithBodyText2TextStyle(style);
  }

  void bodyText2DecorationStyleChanged(String value) {
    final decorationStyle = EnumToString.fromString(
      TextDecorationStyle.values,
      value,
    );
    if (decorationStyle != null) {
      final style = _getBodyText2TextStyle().copyWith(
        decorationStyle: decorationStyle,
      );
      _emitWithBodyText2TextStyle(style);
    }
  }

  void bodyText2DecorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = _getBodyText2TextStyle().copyWith(
        decorationThickness: thickness,
      );
      _emitWithBodyText2TextStyle(style);
    }
  }

  void _emitWithBodyText2TextStyle(TextStyle style) {
    final theme = state.themeData.textTheme.copyWith(bodyText2: style);
    emit(
      state.copyWith(themeData: state.themeData.copyWith(textTheme: theme)),
    );
  }

  TextStyle _getBodyText2TextStyle() {
    return state.themeData.textTheme.bodyText2 ?? TextStyle();
  }
}
