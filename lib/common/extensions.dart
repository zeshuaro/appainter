import 'package:flutter/material.dart';

extension TextStyleExtension on TextStyle {
  TextStyle copyWithNull({
    bool background = false,
    bool backgroundColor = false,
    bool color = false,
    bool debugLabel = false,
    bool decoration = false,
    bool decorationColor = false,
    bool decorationStyle = false,
    bool decorationThickness = false,
    bool fontFamily = false,
    bool fontFamilyFallback = false,
    bool fontFeatures = false,
    bool fontSize = false,
    bool fontStyle = false,
    bool fontWeight = false,
    bool foreground = false,
    bool height = false,
    bool leadingDistribution = false,
    bool letterSpacing = false,
    bool locale = false,
    bool shadows = false,
    bool textBaseline = false,
    bool wordSpacing = false,
  }) {
    return TextStyle(
      background: background == true ? null : this.background,
      backgroundColor: backgroundColor == true ? null : this.backgroundColor,
      color: color == true ? null : this.color,
      debugLabel: debugLabel == true ? null : this.debugLabel,
      decoration: decoration == true ? null : this.decoration,
      decorationColor: decorationColor == true ? null : this.decorationColor,
      decorationStyle: decorationStyle == true ? null : this.decorationStyle,
      decorationThickness:
          decorationThickness == true ? null : this.decorationThickness,
      fontFamily: fontFamily == true ? null : this.fontFamily,
      fontFamilyFallback:
          fontFamilyFallback == true ? null : this.fontFamilyFallback,
      fontFeatures: fontFeatures == true ? null : this.fontFeatures,
      fontSize: fontSize == true ? null : this.fontSize,
      fontStyle: fontStyle == true ? null : this.fontStyle,
      fontWeight: fontWeight == true ? null : this.fontWeight,
      foreground: foreground == true ? null : this.foreground,
      height: height == true ? null : this.height,
      inherit: inherit,
      leadingDistribution:
          leadingDistribution == true ? null : this.leadingDistribution,
      letterSpacing: letterSpacing == true ? null : this.letterSpacing,
      locale: locale == true ? null : this.locale,
      shadows: shadows == true ? null : this.shadows,
      textBaseline: textBaseline == true ? null : this.textBaseline,
      wordSpacing: wordSpacing == true ? null : this.wordSpacing,
    );
  }
}
