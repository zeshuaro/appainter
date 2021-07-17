# Using the Generated Theme

Flutter Theme allows you to export your generated theme as a `json` file using [json_theme](https://pub.dev/packages/json_theme). To use this theme in your app, follow the steps below:

1. Add `json_theme` as a dependency in your `pubspec.yaml` file.

    ```yml
    dependencies:
      json_theme: ^2.1.0+2
    ```

2. Copy the generated `json` file to your app project and place it under the `assets/` folder.
   
3. Update your `pubspec.yaml` file to include your asset.

    ```yml
    flutter:
      assets:
        - assets/flutter_theme.json
    ```

4. Update your `main` function to load your theme. 

    ```dart
    void main() async {
      WidgetsFlutterBinding.ensureInitialized();
      final themeStr = await rootBundle.loadString('assets/flutter_theme.json');
      final themeJson = jsonDecode(themeStr);
      final theme = ThemeDecoder.decodeThemeData(themeJson)!;
    }
    ```

5. You can then pass in `theme` to your `MaterialApp` widget to use it.

    ```dart
    MaterialApp(
      theme: theme,
      title: 'Flutter Theme',
      home: HomePage(),
    );
    ```

For a complete example app using the generated `json` theme file, see the app under the `example/` folder.
