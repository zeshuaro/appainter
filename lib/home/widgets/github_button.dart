import 'package:flutter/material.dart';
import 'package:appainter/services/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GithubButton extends StatelessWidget {
  const GithubButton({Key? key}) : super(key: key);

  static const githubUrl = 'https://github.com/zeshuaro/appainter';

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () => UtilService.launchUrl(githubUrl),
      icon: const FaIcon(
        FontAwesomeIcons.github,
        color: Colors.white,
        size: 20,
      ),
      label: const Text(
        'GitHub',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
