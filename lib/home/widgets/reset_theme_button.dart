import 'package:appainter/advanced_theme/advanced_theme.dart';
import 'package:appainter/basic_theme/basic_theme.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ResetThemeButton extends StatelessWidget {
  const ResetThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('resetThemeButton'),
      onPressed: () => _onPressed(context),
      icon: Icon(MdiIcons.restore),
      splashRadius: kSplashRadius,
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
