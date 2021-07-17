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

See [USAGE.md](USAGE.md) for instructions on how to use the generated theme.

## Development

Fork and clone the repository, then install the dependencies:

    flutter pub get

Run the following to launch the code generation:

    flutter pub run build_runner build --delete-conflicting-outputs

Start the app:

    flutter run