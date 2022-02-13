import 'package:appainter/text_theme/text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeRepository {
  List<FontData> searchFonts(String query) {
    return GoogleFonts.asMap()
        .entries
        .where(
          (entry) => entry.key.toLowerCase().contains(query.toLowerCase()),
        )
        .map((entry) => FontData(entry.key, entry.value()))
        .take(kMaxFontSearchResults)
        .toList();
  }
}
