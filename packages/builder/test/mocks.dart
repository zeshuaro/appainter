const mockPropertiesHtml = r'''
<dl class="properties">
  <dt id="actionsIconTheme" class="property">
    <span class="name"><a href="material/AppBarTheme/actionsIconTheme.html">actionsIconTheme</a></span>
    <span class="signature">&#8594;
      <a href="widgets/IconThemeData-class.html">IconThemeData</a>?</span>
  </dt>
  <dd>
    Overrides the default value of
    <a href="material/AppBar/actionsIconTheme.html">AppBar.actionsIconTheme</a>
    in all descendant widgets.
    <a href="material/AppBarTheme/actionsIconTheme.html">[...]</a>
    <div class="features">final</div>
  </dd>

  <dt id="backgroundColor" class="property">
    <span class="name"><a href="material/AppBarTheme/backgroundColor.html">backgroundColor</a></span>
    <span class="signature">&#8594; <a href="dart-ui/Color-class.html">Color</a>?</span>
  </dt>
  <dd>
    Overrides the default value of
    <a href="material/AppBar/backgroundColor.html">AppBar.backgroundColor</a>
    in all descendant
    <a href="material/AppBar-class.html">AppBar</a> widgets.
    <a href="material/AppBarTheme/backgroundColor.html">[...]</a>
    <div class="features">final</div>
  </dd>

  <dt id="backwardsCompatibility" class="property">
    <span class="name"><a class="deprecated"
        href="material/AppBarTheme/backwardsCompatibility.html">backwardsCompatibility</a></span>
    <span class="signature">&#8594; <a href="dart-core/bool-class.html">bool</a>?</span>
  </dt>
  <dd>
    Overrides the default value of
    <a class="deprecated" href="material/AppBar/backwardsCompatibility.html">AppBar.backwardsCompatibility</a>
    property in all descendant
    <a href="material/AppBar-class.html">AppBar</a> widgets.
    <div class="features">
      @<a href="dart-core/Deprecated-class.html">Deprecated</a>(&#39;This property is obsolete and is false by
      default. &#39;
      &#39;This feature was deprecated after v2.4.0-0.0.pre.&#39;),
      final
    </div>
  </dd>

  <dt id="brightness" class="property">
    <span class="name"><a class="deprecated" href="material/AppBarTheme/brightness.html">brightness</a></span>
    <span class="signature">&#8594; <a href="dart-ui/Brightness.html">Brightness</a>?</span>
  </dt>
  <dd>
    This property is deprecated, please use
    <a href="material/AppBarTheme/systemOverlayStyle.html">systemOverlayStyle</a>
    instead. <a href="material/AppBarTheme/brightness.html">[...]</a>
    <div class="features">
      @<a href="dart-core/Deprecated-class.html">Deprecated</a>(&#39;This property is no longer used, please use
      systemOverlayStyle instead. &#39; &#39;This feature was
      deprecated after v2.4.0-0.0.pre.&#39;), final
    </div>
  </dd>

  <dt id="centerTitle" class="property">
    <span class="name"><a href="material/AppBarTheme/centerTitle.html">centerTitle</a></span>
    <span class="signature">&#8594; <a href="dart-core/bool-class.html">bool</a>?</span>
  </dt>
  <dd>
    Overrides the default value for
    <a href="material/AppBar/centerTitle.html">AppBar.centerTitle</a>.
    property in all descendant widgets.
    <div class="features">final</div>
  </dd>

  <dt id="color" class="property">
    <span class="name"><a class="deprecated" href="material/AppBarTheme/color.html">color</a></span>
    <span class="signature">&#8594; <a href="dart-ui/Color-class.html">Color</a>?</span>
  </dt>
  <dd>
    This property is deprecated, please use
    <a href="material/AppBarTheme/backgroundColor.html">backgroundColor</a>
    instead. <a href="material/AppBarTheme/color.html">[...]</a>
    <div class="features">
      @<a href="dart-core/Deprecated-class.html">Deprecated</a>(&#39;This property is no longer used, please use
      backgroundColor instead. &#39; &#39;This feature was deprecated
      after v2.4.0-0.0.pre.&#39;), read-only
    </div>
  </dd>

  <dt id="elevation" class="property">
    <span class="name"><a href="material/AppBarTheme/elevation.html">elevation</a></span>
    <span class="signature">&#8594; <a href="dart-core/double-class.html">double</a>?</span>
  </dt>
  <dd>
    Overrides the default value of
    <a href="material/AppBar/elevation.html">AppBar.elevation</a> in
    all descendant
    <a href="material/AppBar-class.html">AppBar</a> widgets.
    <div class="features">final</div>
  </dd>

  <dt id="foregroundColor" class="property">
    <span class="name"><a href="material/AppBarTheme/foregroundColor.html">foregroundColor</a></span>
    <span class="signature">&#8594; <a href="dart-ui/Color-class.html">Color</a>?</span>
  </dt>
  <dd>
    Overrides the default value of
    <a href="material/AppBar/foregroundColor.html">AppBar.foregroundColor</a>
    in all descendant widgets.
    <a href="material/AppBarTheme/foregroundColor.html">[...]</a>
    <div class="features">final</div>
  </dd>

  <dt id="systemOverlayStyle" class="property">
    <span class="name"><a href="material/AppBarTheme/systemOverlayStyle.html">systemOverlayStyle</a></span>
    <span class="signature">→ <a href="services/SystemUiOverlayStyle-class.html">SystemUiOverlayStyle</a>?</span>
  </dt>
  <dd>
    Overrides the default value of <a href="material/AppBar/systemOverlayStyle.html">AppBar.systemOverlayStyle</a>
    property in all descendant <a href="material/AppBar-class.html">AppBar</a> widgets.
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

const mockInputExtra = r'''
library builder_test;
import 'package:appainter_annotations/annotations.dart';

part 'test.g.dart';

@ThemeDocs(extraPropertyTypes: {'SystemUiOverlayStyle'})
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
  final Set<String>? extraPropertyTypes;

  const ThemeDocs({this.extraPropertyTypes});
}

''';

const expectedOutput = '''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// ThemeDocsGenerator
// **************************************************************************

class TestDocs {
  static const actionsIconTheme =
      """Overrides the default value of AppBar.actionsIconTheme in all
descendant widgets.""";
  static const backgroundColor =
      """Overrides the default value of AppBar.backgroundColor in all
descendant AppBar widgets.""";
  static const backwardsCompatibility =
      """Overrides the default value of AppBar.backwardsCompatibility property
in all descendant AppBar widgets.""";
  static const centerTitle =
      """Overrides the default value for AppBar.centerTitle. property in all
descendant widgets.""";
  static const color =
      """This property is deprecated, please use backgroundColor instead.""";
  static const elevation =
      """Overrides the default value of AppBar.elevation in all descendant
AppBar widgets.""";
  static const foregroundColor =
      """Overrides the default value of AppBar.foregroundColor in all
descendant widgets.""";
}
''';

const expectedOutputExtra = '''
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test.dart';

// **************************************************************************
// ThemeDocsGenerator
// **************************************************************************

class TestDocs {
  static const actionsIconTheme =
      """Overrides the default value of AppBar.actionsIconTheme in all
descendant widgets.""";
  static const backgroundColor =
      """Overrides the default value of AppBar.backgroundColor in all
descendant AppBar widgets.""";
  static const backwardsCompatibility =
      """Overrides the default value of AppBar.backwardsCompatibility property
in all descendant AppBar widgets.""";
  static const centerTitle =
      """Overrides the default value for AppBar.centerTitle. property in all
descendant widgets.""";
  static const color =
      """This property is deprecated, please use backgroundColor instead.""";
  static const elevation =
      """Overrides the default value of AppBar.elevation in all descendant
AppBar widgets.""";
  static const foregroundColor =
      """Overrides the default value of AppBar.foregroundColor in all
descendant widgets.""";
  static const systemOverlayStyle =
      """Overrides the default value of AppBar.systemOverlayStyle property in
all descendant AppBar widgets.""";
}
''';
