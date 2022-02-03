import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class RandomThemeButton extends StatelessWidget {
  const RandomThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('randomThemeButton'),
      onPressed: () => _onPressed(context),
      icon: const Icon(MdiIcons.shuffle),
    );
  }

  void _onPressed(BuildContext context) {
    if (context.read<HomeCubit>().state.editMode == EditMode.basic) {
      context.read<BasicThemeCubit>().themeRandomized();
    } else {
      context.read<AdvancedThemeCubit>().themeRandomized();
    }
  }
}
