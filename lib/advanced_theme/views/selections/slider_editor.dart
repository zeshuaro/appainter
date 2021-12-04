import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/common/common.dart';
import 'package:flutter_theme/widgets/widgets.dart';

class SliderEditor extends ExpansionPanelItem {
  const SliderEditor({Key? key}) : super(key: key);

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
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.trackHeight !=
            current.themeData.sliderTheme.trackHeight;
      },
      builder: (context, state) {
        return MyTextFormField(
          key: const Key('sliderEditor_trackHeightTextField'),
          labelText: 'Track Height',
          initialValue: state.themeData.sliderTheme.trackHeight?.toString() ??
              kSliderTrackHeight.toString(),
          onChanged: (value) {
            context.read<AdvancedThemeCubit>().sliderTrackHeightChanged(value);
          },
        );
      },
    );
  }
}

class _ActiveTrackColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.activeTrackColor !=
            current.themeData.sliderTheme.activeTrackColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_activeTrackColorPicker'),
          title: 'Active Track Color',
          color: state.themeData.sliderTheme.activeTrackColor ??
              state.themeData.colorScheme.primary,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderActiveTrackColorChanged(color);
          },
        );
      },
    );
  }
}

class _InactiveTrackColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.inactiveTrackColor !=
            current.themeData.sliderTheme.inactiveTrackColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_inactiveTrackColorPicker'),
          title: 'Inactive Track Color',
          color: state.themeData.sliderTheme.inactiveTrackColor ??
              state.themeData.colorScheme.primary.withOpacity(0.24),
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderInactiveTrackColorChanged(color);
          },
        );
      },
    );
  }
}

class _DisabledActiveTrackColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.disabledActiveTrackColor !=
            current.themeData.sliderTheme.disabledActiveTrackColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_disabledActiveTrackColorPicker'),
          title: 'Disabled Active Track Color',
          color: state.themeData.sliderTheme.disabledActiveTrackColor ??
              state.themeData.colorScheme.onSurface.withOpacity(0.32),
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderDisabledActiveTrackColorChanged(color);
          },
        );
      },
    );
  }
}

class _DisabledInactiveTrackColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.disabledInactiveTrackColor !=
            current.themeData.sliderTheme.disabledInactiveTrackColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_disabledInactiveTrackColorPicker'),
          title: 'Disabled Inactive Track Color',
          color: state.themeData.sliderTheme.disabledInactiveTrackColor ??
              state.themeData.colorScheme.onSurface.withOpacity(0.12),
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderDisabledInactiveTrackColorChanged(color);
          },
        );
      },
    );
  }
}

class _ActiveTickMarkColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.activeTickMarkColor !=
            current.themeData.sliderTheme.activeTickMarkColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_activeTickMarkColorPicker'),
          title: 'Active Tick Mark Color',
          color: state.themeData.sliderTheme.activeTickMarkColor ??
              state.themeData.colorScheme.onPrimary.withOpacity(0.54),
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderActiveTickMarkColorChanged(color);
          },
        );
      },
    );
  }
}

class _InactiveTickMarkColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.inactiveTickMarkColor !=
            current.themeData.sliderTheme.inactiveTickMarkColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_inactiveTickMarkColorPicker'),
          title: 'Inactive Tick Mark Color',
          color: state.themeData.sliderTheme.inactiveTickMarkColor ??
              state.themeData.colorScheme.primary.withOpacity(0.54),
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderInactiveTickMarkColorChanged(color);
          },
        );
      },
    );
  }
}

class _DisabledActiveTickMarkColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.disabledActiveTickMarkColor !=
            current.themeData.sliderTheme.disabledActiveTickMarkColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_disabledActiveTickMarkColorPicker'),
          title: 'Disabled Active Tick Mark Color',
          color: state.themeData.sliderTheme.disabledActiveTickMarkColor ??
              state.themeData.colorScheme.onPrimary.withOpacity(0.12),
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderDisabledActiveTickMarkColorChanged(color);
          },
        );
      },
    );
  }
}

class _DisabledInactiveTickMarkColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.disabledInactiveTickMarkColor !=
            current.themeData.sliderTheme.disabledInactiveTickMarkColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_disabledInactiveTickMarkColorPicker'),
          title: 'Disabled Inactive Tick Mark Color',
          color: state.themeData.sliderTheme.disabledInactiveTickMarkColor ??
              state.themeData.colorScheme.onSurface.withOpacity(0.12),
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderDisabledInactiveTickMarkColorChanged(color);
          },
        );
      },
    );
  }
}

class _ThumbColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.thumbColor !=
            current.themeData.sliderTheme.thumbColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_thumbColorPicker'),
          title: 'Thumb Color',
          color: state.themeData.sliderTheme.thumbColor ??
              state.themeData.colorScheme.primary,
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().sliderThumbColorChanged(color);
          },
        );
      },
    );
  }
}

class _DisabledThumbColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.disabledThumbColor !=
            current.themeData.sliderTheme.disabledThumbColor;
      },
      builder: (context, state) {
        final colorScheme = state.themeData.colorScheme;
        return ColorListTile(
          key: const Key('sliderEditor_disabledThumbColorPicker'),
          title: 'Disabled Thumb Color',
          color: state.themeData.sliderTheme.disabledThumbColor ??
              Color.alphaBlend(
                colorScheme.onSurface.withOpacity(.38),
                colorScheme.surface,
              ),
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderDisabledThumbColorChanged(color);
          },
        );
      },
    );
  }
}

class _OverlappingShapeStrokeColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.overlappingShapeStrokeColor !=
            current.themeData.sliderTheme.overlappingShapeStrokeColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_overlappingShapeStrokeColorPicker'),
          title: 'Overlapping Shape Stroke Color',
          color: state.themeData.sliderTheme.overlappingShapeStrokeColor ??
              Colors.white,
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderOverlappingShapeStrokeColorChanged(color);
          },
        );
      },
    );
  }
}

class _OverlayColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.overlayColor !=
            current.themeData.sliderTheme.overlayColor;
      },
      builder: (context, state) {
        return ColorListTile(
          key: const Key('sliderEditor_overlayColorPicker'),
          title: 'Overlay Color',
          color: state.themeData.sliderTheme.overlayColor ??
              state.themeData.colorScheme.primary.withOpacity(0.12),
          onColorChanged: (color) {
            context.read<AdvancedThemeCubit>().sliderOverlayColorChanged(color);
          },
        );
      },
    );
  }
}

class _ValueIndicatorColorPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvancedThemeCubit, AdvancedThemeState>(
      buildWhen: (previous, current) {
        return previous.themeData.sliderTheme.valueIndicatorColor !=
            current.themeData.sliderTheme.valueIndicatorColor;
      },
      builder: (context, state) {
        final colorScheme = state.themeData.colorScheme;
        return ColorListTile(
          key: const Key('sliderEditor_valueIndicatorColorPicker'),
          title: 'Value Indicator Color',
          color: state.themeData.sliderTheme.valueIndicatorColor ??
              Color.alphaBlend(
                colorScheme.onSurface.withOpacity(0.60),
                colorScheme.surface.withOpacity(0.90),
              ),
          onColorChanged: (color) {
            context
                .read<AdvancedThemeCubit>()
                .sliderValueIndicatorColorChanged(color);
          },
        );
      },
    );
  }
}
