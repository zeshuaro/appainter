![logo](images/logo.png)

[![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/zeshuaro/appainter?color=orange&label=version)](https://github.com/zeshuaro/appainter/releases)
[![Website](https://img.shields.io/website?url=https%3A%2F%2Fzeshuaro.github.io%2Fappainter%2F)](https://zeshuaro.github.io/appainter/)
[![GitHub license](https://img.shields.io/github/license/zeshuaro/appainter)](https://github.com/zeshuaro/appainter/blob/main/LICENSE)
[![GitHub Actions](https://github.com/zeshuaro/appainter/actions/workflows/github-actions.yml/badge.svg?branch=main&event=push)](https://github.com/zeshuaro/appainter/actions/workflows/github-actions.yml?query=event%3Apush+branch%3Amain)
[![codecov](https://codecov.io/gh/zeshuaro/appainter/branch/main/graph/badge.svg?token=4YM0WZFH3I)](https://codecov.io/gh/zeshuaro/appainter)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/558114f6d82045e1a319d0c9a3ef72a0)](https://app.codacy.com/gh/zeshuaro/appainter/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade)
[![style: flutter_lints](https://img.shields.io/badge/style-flutter__lints-4BC0F5.svg)](https://pub.dev/packages/flutter_lints)

[![Github-sponsors](https://img.shields.io/badge/sponsor-30363D?style=for-the-badge&logo=GitHub-Sponsors&logoColor=#EA4AAA)](https://github.com/sponsors/zeshuaro)
[![BuyMeACoffee](https://img.shields.io/badge/Buy%20Me%20a%20Coffee-ffdd00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/zeshuaro)
[![Ko-Fi](https://img.shields.io/badge/Ko--fi-F16061?style=for-the-badge&logo=ko-fi&logoColor=white)](https://ko-fi.com/zeshuaro)
[![LiberaPay](https://img.shields.io/badge/Liberapay-F6C915?style=for-the-badge&logo=liberapay&logoColor=black)](https://liberapay.com/zeshuaro/)
[![Patreon](https://img.shields.io/badge/Patreon-F96854?style=for-the-badge&logo=patreon&logoColor=white)](https://patreon.com/zeshuaro)
[![PayPal](https://img.shields.io/badge/PayPal-00457C?style=for-the-badge&logo=paypal&logoColor=white)](https://paypal.me/JoshuaTang)

A material theme editor and generator for Flutter to configure and preview the overall visual theme of your material app.

![Appainter Screenshot](images/screenshot.png)

## Usage

Appainter is developed and built with [Flutter](https://flutter.dev/), and is available for both Web and Desktop.

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