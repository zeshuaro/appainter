import 'package:appainter/common/common.dart';
import 'package:appainter/home/home.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class UsageButton extends StatelessWidget {
  const UsageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(MdiIcons.helpCircleOutline),
      splashRadius: kSplashRadius,
      onPressed: () => _onPressed(context),
    );
  }

  void _onPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const _UsageDialog(),
    );
  }
}

class _UsageDialog extends StatelessWidget {
  const _UsageDialog();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final size = MediaQuery.of(context).size;
        return AlertDialog(
          title: const Text('Usage'),
          content: SizedBox(
            width: size.width * 0.6,
            height: size.height * 0.6,
            child: state.themeUsage != null
                ? _UsageContent(usage: state.themeUsage!)
                : const Center(child: CircularProgressIndicator()),
          ),
          actions: [
            TextButton(
              key: const Key('usageButton_closeButton'),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class _UsageContent extends StatelessWidget {
  final ThemeUsage usage;

  const _UsageContent({required this.usage});

  @override
  Widget build(BuildContext context) {
    return usage.markdownData != null
        ? Markdown(
            selectable: true,
            data: usage.markdownData!,
            onTapLink: (String text, String? href, String title) {
              if (href != null) UtilService.launchUrl(href);
            },
          )
        : const _UsageFallback(
            key: Key('usageButton_usageFallback'),
          );
  }
}

class _UsageFallback extends StatelessWidget {
  const _UsageFallback({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          MdiIcons.alert,
          color: Colors.yellow,
          size: 48,
        ),
        const VerticalPadding(),
        RichText(
          text: TextSpan(
            text: 'Failed to fetch usage details. Please visit ',
            style: DefaultTextStyle.of(context).style,
            children: [
              TextSpan(
                text: 'this',
                recognizer: TapGestureRecognizer()
                  ..onTap = () => UtilService.launchUrl(ThemeUsage.markdownUrl),
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
              const TextSpan(text: ' page instead.'),
            ],
          ),
        ),
      ],
    );
  }
}
