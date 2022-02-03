import 'package:flutter/material.dart';
import 'package:appainter/services/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GithubButton extends StatelessWidget {
  const GithubButton({Key? key}) : super(key: key);

  static const githubUrl = 'https://github.com/zeshuaro/appainter';

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => UtilService.launchUrl(githubUrl),
      icon: const Icon(MdiIcons.github),
    );
  }
}
