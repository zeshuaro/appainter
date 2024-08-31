# Using the generated theme

Appainter uses the package [json_theme_plus](https://pub.dev/packages/json_theme_plus) (credits to the original package [json_theme](https://pub.dev/packages/json_theme)) to encode and decode the theme JSON file.

## Theme compatibility

From version to version, Flutter may deprecate certain properties in [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html). When this happens, the serialisation package will also update their JSON schema with the latest properties.

The Flutter version that Appainter is running will pop-up whenever you use Appainter, on both web and desktop apps. It is highly recommended to use the same Flutter version when running your app. Otherwise, there may be compatibility issues when using the theme JSON file in your app.

If you need to use the theme JSON file in a specific Flutter version, you can find and download the desktop version of Appainter that uses your Flutter version from the [releases](https://github.com/zeshuaro/appainter/releases) page.

## Steps

To use the theme JSON file in your app, follow the steps below:

1. Add `json_theme_plus` as a dependency in your `pubspec.yaml` file.

    ```yml
    dependencies:
      json_theme_plus: ^6.6.1
    ```

2. Copy the generated `json` file to your app project and place it under the `assets/` folder.
   
3. Update your `pubspec.yaml` file to include your asset.

    ```yml
    flutter:
      assets:
        - assets/appainter_theme.json
    ```

4. Update your `main` function to be async, load your theme and pass it into your App

   ```dart
   import 'package:flutter/material.dart';
   import 'package:json_theme_plus/json_theme_plus.dart';

   import 'package:flutter/services.dart'; // For rootBundle
   import 'dart:convert'; // For jsonDecode

   void main() async {
     WidgetsFlutterBinding.ensureInitialized();

     final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
     final themeJson = jsonDecode(themeStr);
     final theme = ThemeDecoder.decodeThemeData(themeJson)!;

     runApp(MyApp(theme: theme));
   }

   class MyApp extends StatelessWidget {
     final ThemeData theme;

     const MyApp({Key? key, required this.theme}) : super(key: key);

     // This widget is the root of your application.
     @override
     Widget build(BuildContext context) {
       return MaterialApp(home: HomePage(), theme: theme);
     }
   }
   ```

### (Optional) Using a custom font

If you've generated the `json` theme file with a custom font, you'll need to import a custom font file:

1. Search and download your font from [Google Fonts](https://fonts.google.com/). Appainter uses Google Fonts as the list of font options so you should be able to find your font there.
   
2. Copy the font file to your app project and place it under the `fonts/` folder.
   
3. Update your `pubspec.yaml` file to include your font. Here we use `Montserrat` as our font.

    ```yml
    flutter:
      assets:
        - assets/appainter_theme.json
      fonts:
        - family: Montserrat
          fonts:
            - asset: fonts/Montserrat-Regular.ttf
    ```

4. Your font will be loaded automatically when you use the generated theme.

For a complete example app using the generated `json` theme file and a custom font, see the app under the [example](https://github.com/zeshuaro/appainter/tree/main/example) folder.
