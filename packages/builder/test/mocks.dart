const mockPropertiesHtml = r'''
<dl class="properties">
  <dt id="accentColor" class="property">
    <span class="name"><a class="deprecated" href="material/ThemeData/accentColor.html">accentColor</a></span>
    <span class="signature">→ <a href="dart-ui/Color-class.html">Color</a></span>
  </dt>
  <dd>
    Obsolete property that was originally used as the foreground color for
    widgets (knobs, text, overscroll edge effect, etc).
    <a href="material/ThemeData/accentColor.html">[...]</a>
    <div class="features">
      @<a href="dart-core/Deprecated-class.html">Deprecated</a>('Use
      colorScheme.secondary instead. ' 'For more information, consult the
      migration guide at '
      'https://flutter.dev/docs/release/breaking-changes/theme-data-accent-properties#migration-guide.
      ' 'This feature was deprecated after v2.3.0-0.1.pre.'), final
    </div>
  </dd>

  <dt id="appBarTheme" class="property">
    <span class="name"><a href="material/ThemeData/appBarTheme.html">appBarTheme</a></span>
    <span class="signature">→ <a href="material/AppBarTheme-class.html">AppBarTheme</a></span>
  </dt>
  <dd>
    A theme for customizing the color, elevation, brightness, iconTheme and
    textTheme of <a href="material/AppBar-class.html">AppBar</a>s.
    <div class="features">final</div>
  </dd>

  <dt id="primaryColor" class="property">
    <span class="name"><a href="material/ThemeData/primaryColor.html">primaryColor</a></span>
    <span class="signature">→ <a href="dart-ui/Color-class.html">Color</a></span>
  </dt>
  <dd>
    The background color for major parts of the app (toolbars, tab bars, etc)
    <a href="material/ThemeData/primaryColor.html">[...]</a>
    <div class="features">final</div>
  </dd>

  <dt id="primaryColorDark" class="property">
    <span class="name"><a href="material/ThemeData/primaryColorDark.html">primaryColorDark</a></span>
    <span class="signature">→ <a href="dart-ui/Color-class.html">Color</a></span>
  </dt>
  <dd>
    A darker version of the
    <a href="material/ThemeData/primaryColor.html">primaryColor</a>.
    <div class="features">final</div>
  </dd>

  <dt id="primaryColorLight" class="property">
    <span class="name"><a href="material/ThemeData/primaryColorLight.html">primaryColorLight</a></span>
    <span class="signature">→ <a href="dart-ui/Color-class.html">Color</a></span>
  </dt>
  <dd>
    A lighter version of the
    <a href="material/ThemeData/primaryColor.html">primaryColor</a>.
    <div class="features">final</div>
  </dd>
</dl>
''';

const mockInput = r'''
library builder_test;
import 'package:appainter_annotations/annotations.dart';

part 'test.g.dart';

@ThemeDocs()
class Test {}
''';

const mockColorThemeInput = r'''
library builder_test;
import 'package:appainter_annotations/annotations.dart';

part 'test.g.dart';

@ThemeDocs()
class ColorTheme {}
''';

const mockAnnotations = r'''
library appainter_annotations;
export 'src/theme_docs.dart';
''';

const mockThemeDocs = r'''
class ThemeDocs {
  const ThemeDocs();
}
''';

const expectedOutput = r'''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of builder_test;

// **************************************************************************
// ThemeDocsGenerator
// **************************************************************************

class TestDocs {
  static const primaryColor =
      'The background color for major parts of the app (toolbars, tab bars, etc)';
  static const primaryColorDark = 'A darker version of the primaryColor.';
  static const primaryColorLight = 'A lighter version of the primaryColor.';
}
''';
