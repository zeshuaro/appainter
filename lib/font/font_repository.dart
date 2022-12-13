import 'package:appainter/text_theme/text_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class FontRepository {
  List<FontData> searchFonts(String query) {
    return GoogleFonts.asMap()
        .entries
        .where(
          (entry) => entry.key.toLowerCase().contains(query.toLowerCase()),
        )
        .take(kMaxFontSearchResults)
        .map((entry) => FontData(entry.key, entry.value()))
        .toList();
  }
}
