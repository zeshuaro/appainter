import 'package:appainter/text_theme/text_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FontData extends Equatable {
  final String family;
  final TextStyle style;

  const FontData(this.family, this.style);

  factory FontData.defaultFontData() {
    final style = GoogleFonts.getFont(kDefaultFontFamily);
    return FontData(kDefaultFontFamily, style);
  }

  @override
  List<Object> get props => [family, style];
}
