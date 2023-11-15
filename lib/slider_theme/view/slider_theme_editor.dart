import 'package:appainter/color_theme/cubit/color_theme_cubit.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/slider_theme/slider_theme.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderThemeEditor extends ExpansionPanelItem {
  const SliderThemeEditor({super.key});

  @override
  String get header => 'Slider';

  @override
  Widget build(BuildContext context) {
    return SideBySideList(
      padding: kPaddingAll,
      children: [
        _ActiveTrackColorPicker(),
        _InactiveTrackColorPicker(),
        _DisabledActiveTrackColorPicker(),
        _DisabledInactiveTrackColorPicker(),
        _ActiveTickMarkColorPicker(),
        _InactiveTickMarkColorPicker(),
        _DisabledActiveTickMarkColorPicker(),
        _DisabledInactiveTickMarkColorPicker(),
        _ThumbColorPicker(),
        _DisabledThumbColorPicker(),
        _OverlappingShapeStrokeColorPicker(),
        _OverlayColorPicker(),
        _ValueIndicatorColorPicker(),
        _TrackHeightTextField(),
      ],
    );
  }
}

class _TrackHeightTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderThemeCubit, SliderThemeState>(
      key: const Key('sliderThemeEditor_trackHeightTextField'),
      buildWhen: (previous, current) {
        return previous.theme.trackHeight != current.theme.trackHeight;
      },
      builder: (context, state) {
        return MyTextFormField(
          labelText: 'Track height',
          tooltip: SliderThemeDocs.trackHeight,
          initialValue:
              (state.theme.trackHeight ?? kSliderTrackHeight).toString(),
          onChanged: context.read<SliderThemeCubit>().trackHeightChanged,
        );
      },
    );
  }
}

class _ActiveTrackColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activeTrackColor =
        context.watch<SliderThemeCubit>().state.theme.activeTrackColor;
    final primaryColor = context.watch<ColorThemeCubit>().state.primaryColor;

    return ColorListTile(
      key: const Key('sliderThemeEditor_activeTrackColorPicker'),
      title: 'Active track color',
      tooltip: SliderThemeDocs.activeTrackColor,
      color: activeTrackColor ?? primaryColor,
      onColorChanged: context.read<SliderThemeCubit>().activeTrackColorChanged,
    );
  }
}

class _InactiveTrackColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inactiveTrackColor =
        context.watch<SliderThemeCubit>().state.theme.inactiveTrackColor;
    final primaryColor = context.watch<ColorThemeCubit>().state.primaryColor;

    return ColorListTile(
      key: const Key('sliderThemeEditor_inactiveTrackColorPicker'),
      title: 'Inactive track color',
      tooltip: SliderThemeDocs.inactiveTrackColor,
      color: inactiveTrackColor ?? primaryColor.withOpacity(0.24),
      onColorChanged:
          context.read<SliderThemeCubit>().inactiveTrackColorChanged,
    );
  }
}

class _DisabledActiveTrackColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final disabledActiveTrackColor =
        context.watch<SliderThemeCubit>().state.theme.disabledActiveTrackColor;
    final primaryColorDark =
        context.watch<ColorThemeCubit>().state.primaryColorDark;

    return ColorListTile(
      key: const Key('sliderThemeEditor_disabledActiveTrackColorPicker'),
      title: 'Disabled active track color',
      tooltip: SliderThemeDocs.disabledActiveTrackColor,
      color: disabledActiveTrackColor ?? primaryColorDark.withOpacity(0.32),
      onColorChanged:
          context.read<SliderThemeCubit>().disabledActiveTrackColorChanged,
    );
  }
}

class _DisabledInactiveTrackColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final disabledInactiveTrackColor = context
        .watch<SliderThemeCubit>()
        .state
        .theme
        .disabledInactiveTrackColor;
    final primaryColorDark =
        context.watch<ColorThemeCubit>().state.primaryColorDark;

    return ColorListTile(
      key: const Key('sliderThemeEditor_disabledInactiveTrackColorPicker'),
      title: 'Disabled inactive Track color',
      tooltip: SliderThemeDocs.disabledInactiveTrackColor,
      color: disabledInactiveTrackColor ?? primaryColorDark.withOpacity(0.12),
      onColorChanged:
          context.read<SliderThemeCubit>().disabledInactiveTrackColorChanged,
    );
  }
}

class _ActiveTickMarkColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final activeTickMarkColor =
        context.watch<SliderThemeCubit>().state.theme.activeTickMarkColor;
    final primaryColorLight =
        context.watch<ColorThemeCubit>().state.primaryColorLight;

    return ColorListTile(
      key: const Key('sliderThemeEditor_activeTickMarkColorPicker'),
      title: 'Active tick mark color',
      tooltip: SliderThemeDocs.activeTickMarkColor,
      color: activeTickMarkColor ?? primaryColorLight.withOpacity(0.54),
      onColorChanged:
          context.read<SliderThemeCubit>().activeTickMarkColorChanged,
    );
  }
}

class _InactiveTickMarkColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final inactiveTickMarkColor =
        context.watch<SliderThemeCubit>().state.theme.inactiveTickMarkColor;
    final primaryColor = context.watch<ColorThemeCubit>().state.primaryColor;

    return ColorListTile(
      key: const Key('sliderThemeEditor_inactiveTickMarkColorPicker'),
      title: 'Inactive tick mark color',
      tooltip: SliderThemeDocs.inactiveTickMarkColor,
      color: inactiveTickMarkColor ?? primaryColor.withOpacity(0.54),
      onColorChanged:
          context.read<SliderThemeCubit>().inactiveTickMarkColorChanged,
    );
  }
}

class _DisabledActiveTickMarkColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final disabledActiveTickMarkColor = context
        .watch<SliderThemeCubit>()
        .state
        .theme
        .disabledActiveTickMarkColor;
    final primaryColorLight =
        context.watch<ColorThemeCubit>().state.primaryColorLight;

    return ColorListTile(
      key: const Key('sliderThemeEditor_disabledActiveTickMarkColorPicker'),
      title: 'Disabled active tick mark color',
      tooltip: SliderThemeDocs.disabledActiveTickMarkColor,
      color: disabledActiveTickMarkColor ?? primaryColorLight.withOpacity(0.12),
      onColorChanged:
          context.read<SliderThemeCubit>().disabledActiveTickMarkColorChanged,
    );
  }
}

class _DisabledInactiveTickMarkColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final disabledInactiveTickMarkColor = context
        .watch<SliderThemeCubit>()
        .state
        .theme
        .disabledInactiveTickMarkColor;
    final primaryColorDark =
        context.watch<ColorThemeCubit>().state.primaryColorDark;

    return ColorListTile(
      key: const Key('sliderThemeEditor_disabledInactiveTickMarkColorPicker'),
      title: 'Disabled inactive tick mark color',
      tooltip: SliderThemeDocs.disabledInactiveTickMarkColor,
      color:
          disabledInactiveTickMarkColor ?? primaryColorDark.withOpacity(0.12),
      onColorChanged:
          context.read<SliderThemeCubit>().disabledInactiveTickMarkColorChanged,
    );
  }
}

class _ThumbColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final thumbColor = context.watch<SliderThemeCubit>().state.theme.thumbColor;
    final primaryColor = context.watch<ColorThemeCubit>().state.primaryColor;

    return ColorListTile(
      key: const Key('sliderThemeEditor_thumbColorPicker'),
      title: 'Thumb color',
      tooltip: SliderThemeDocs.thumbColor,
      color: thumbColor ?? primaryColor,
      onColorChanged: context.read<SliderThemeCubit>().thumbColorChanged,
    );
  }
}

class _DisabledThumbColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final disabledThumbColor =
        context.watch<SliderThemeCubit>().state.theme.disabledThumbColor;
    final primaryColorDark =
        context.watch<ColorThemeCubit>().state.primaryColorDark;

    return ColorListTile(
      key: const Key('sliderThemeEditor_disabledThumbColorPicker'),
      title: 'Disabled thumb color',
      tooltip: SliderThemeDocs.disabledThumbColor,
      color: disabledThumbColor ?? primaryColorDark.withOpacity(0.32),
      onColorChanged:
          context.read<SliderThemeCubit>().disabledThumbColorChanged,
    );
  }
}

class _OverlappingShapeStrokeColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderThemeCubit, SliderThemeState>(
      key: const Key('sliderThemeEditor_overlappingShapeStrokeColorPicker'),
      buildWhen: (previous, current) {
        return previous.theme.overlappingShapeStrokeColor !=
            current.theme.overlappingShapeStrokeColor;
      },
      builder: (context, state) {
        return ColorListTile(
          title: 'Overlapping shape stroke color',
          tooltip: SliderThemeDocs.overlappingShapeStrokeColor,
          color: state.theme.overlappingShapeStrokeColor ?? Colors.white,
          onColorChanged: context
              .read<SliderThemeCubit>()
              .overlappingShapeStrokeColorChanged,
        );
      },
    );
  }
}

class _OverlayColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final overlayColor =
        context.watch<SliderThemeCubit>().state.theme.overlayColor;
    final primaryColor = context.watch<ColorThemeCubit>().state.primaryColor;

    return ColorListTile(
      key: const Key('sliderThemeEditor_overlayColorPicker'),
      title: 'Overlay color',
      tooltip: SliderThemeDocs.overlayColor,
      color: overlayColor ?? primaryColor.withOpacity(0.12),
      onColorChanged: context.read<SliderThemeCubit>().overlayColorChanged,
    );
  }
}

class _ValueIndicatorColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final valueIndicatorColor =
        context.watch<SliderThemeCubit>().state.theme.valueIndicatorColor;
    final primaryColor = context.watch<ColorThemeCubit>().state.primaryColor;

    return ColorListTile(
      key: const Key('sliderThemeEditor_valueIndicatorColorPicker'),
      title: 'Value indicator color',
      tooltip: SliderThemeDocs.valueIndicatorColor,
      color: valueIndicatorColor ?? primaryColor,
      onColorChanged:
          context.read<SliderThemeCubit>().valueIndicatorColorChanged,
    );
  }
}
