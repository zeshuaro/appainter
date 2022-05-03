![logo](images/logo.png)

A material theme editor and generator for Flutter to configure and preview the overall visual theme of your material app.

[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/zeshuaro/appainter?color=orange&label=version)](https://github.com/zeshuaro/appainter/releases)
[![Website](https://img.shields.io/website?url=https%3A%2F%2Fzeshuaro.github.io%2Fappainter%2F)](https://zeshuaro.github.io/appainter/)
[![GitHub license](https://img.shields.io/github/license/zeshuaro/appainter)](https://github.com/zeshuaro/appainter/blob/main/LICENSE)
[![GitHub Actions](https://github.com/zeshuaro/appainter/actions/workflows/github-actions.yml/badge.svg)](https://github.com/zeshuaro/appainter/actions/workflows/github-actions.yml)
[![codecov](https://codecov.io/gh/zeshuaro/appainter/branch/main/graph/badge.svg?token=4YM0WZFH3I)](https://codecov.io/gh/zeshuaro/appainter)
[![style: flutter_lints](https://img.shields.io/badge/style-flutter__lints-4BC0F5.svg)](https://pub.dev/packages/flutter_lints)

![Appainter Screenshot](images/screenshot.png)

## Usage

Appainter is developed and built with [Flutter](https://flutter.dev/), and is available for both Web and Desktop.

**Disclaimer: I've only tested the app on Web and MacOS as I don't have a Windows or Linux machine. The app may not work on those platforms.**

For Web, you can access it through [here](https://zeshuaro.github.io/appainter/). 

For Mac, Windows and Linux, you can be download it from [here](https://github.com/zeshuaro/appainter/releases).

### Using the Generated Theme

See [USAGE.md](USAGE.md) for instructions on how to use the generated theme.

## Development

Fork and clone the repository, then install the dependencies:

    flutter pub get

Run the following to launch the code generation:

    flutter pub run build_runner build --delete-conflicting-outputs

Start the app:

    flutter run