# Flutter Theme

**⚠️ WARNING: This app is still under development so please expect bugs and missing features in the app. ⚠️**

Inspired by [Panache](https://github.com/rxlabz/panache), a Flutter material theme editor for you to configure the overall visual theme of your material app.

[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/zeshuaro/flutter_theme?color=orange&label=version)](https://github.com/zeshuaro/flutter_theme/releases)
[![Website](https://img.shields.io/website?url=https%3A%2F%2Fzeshuaro.github.io%2Fflutter_theme%2F)](https://zeshuaro.github.io/flutter_theme/)
[![GitHub license](https://img.shields.io/github/license/zeshuaro/flutter_theme)](https://github.com/zeshuaro/flutter_theme/blob/main/LICENSE)
[![GitHub Actions](https://github.com/zeshuaro/flutter_theme/actions/workflows/test_deploy_release.yml/badge.svg)](https://github.com/zeshuaro/flutter_theme/actions/workflows/test_deploy_release.yml)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

![Flutter Theme Screenshot](images/screenshot.png)

## Usage

Flutter Theme is developed and built with [Flutter](https://flutter.dev/), and is available for both Web and Desktop.

**Disclaimer: I've only tested the app on Web and MacOS as I don't have a Windows or Linux machine. The app may not work on those platforms.**

For Web, you can access it through [here](https://zeshuaro.github.io/flutter_theme/). 

For Mac, Windows and Linux, you can be download it from [here](https://github.com/zeshuaro/flutter_theme/releases).

### Using the Generated Theme

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
