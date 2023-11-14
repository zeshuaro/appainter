import 'package:appainter/common/common.dart';
import 'package:appainter/services/services.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class GithubButton extends StatelessWidget {
  const GithubButton({super.key});

  static const githubUrl = 'https://github.com/zeshuaro/appainter';

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(MdiIcons.github),
      splashRadius: kSplashRadius,
      onPressed: () => UtilService.launchUrl(githubUrl),
    );
  }
}
