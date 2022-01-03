import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/home/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResetThemeButton extends StatelessWidget {
  const ResetThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('resetThemeButton'),
      onPressed: () => _onPressed(context),
      icon: const FaIcon(
        FontAwesomeIcons.redo,
        size: 20,
      ),
    );
  }

  void _onPressed(BuildContext context) {
    if (context.read<HomeCubit>().state.editMode == EditMode.basic) {
      context.read<BasicThemeCubit>().themeReset();
    } else {
      context.read<AdvancedThemeCubit>().themeReset();
    }
  }
}
