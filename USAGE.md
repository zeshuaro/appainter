# Using the Generated Theme

Appainter uses the package [json_theme](https://pub.dev/packages/json_theme) to encode and decode the theme JSON file.

## Theme Compatibility

From version to version, Flutter may deprecate certain properties in [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html). When this happens, `json_theme` will also update their JSON schema with the latest properties. 

The Flutter version that Appainter is running will pop-up whenever you use Appainter, on both web and desktop apps. It is highly recommended to use the same Flutter version when running your app. Otherwise, there may be compatibility issues when using the theme JSON file in your app.

If you need to use the theme JSON file in a specific Flutter version, you can find and download the desktop version of Appainter that uses your Flutter version from the [releases](https://github.com/zeshuaro/appainter/releases) page.

## Steps

To use the theme JSON file in your app, follow the steps below:

1. Add `json_theme` as a dependency in your `pubspec.yaml` file.

    ```yml
    dependencies:
      json_theme: ^3.1.2+1
    ```

2. Copy the generated `json` file to your app project and place it under the `assets/` folder.
   
3. Update your `pubspec.yaml` file to include your asset.

    ```yml
    flutter:
      assets:
        - assets/appainter_theme.json
    ```

4. Update your `main` function to load your theme. 

    ```dart
    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
      final themeJson = jsonDecode(themeStr);
      final theme = ThemeDecoder.decodeThemeData(themeJson)!;
    }
    ```

5. You can then pass in `theme` to your `MaterialApp` widget to use it.

    ```dart
    MaterialApp(
      theme: theme,
      title: 'Appainter',
      home: HomePage(),
    );
    ```

For a complete example app using the generated `json` theme file, see the app under the [example](https://github.com/zeshuaro/appainter/tree/main/example) folder.
