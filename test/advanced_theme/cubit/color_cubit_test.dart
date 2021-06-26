// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';

import '../../utils.dart';
import 'advanced_theme_utils.dart';

void main() {
  late AdvancedThemeCubit cubit;
  late AdvancedThemeState state;

  setUp(() {
    cubit = AdvancedThemeCubit();
    state = AdvancedThemeState();
  });

  group('primaryColorBrightnessChanged', () {
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits primary color brightness light',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorBrightnessChanged(false),
      expect: () {
        final theme = state.themeData.copyWith(
          primaryColorBrightness: Brightness.light,
        );
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits primary color brightness dark',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorBrightnessChanged(true),
      expect: () {
        final theme = state.themeData.copyWith(
          primaryColorBrightness: Brightness.dark,
        );
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('primaryColorLightChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
        'emits primary color light',
        build: () => cubit,
        act: (cubit) => cubit.primaryColorLightChanged(color),
        expect: () {
          final theme = state.themeData.copyWith(primaryColorLight: color);
          final expected = getAdvancedThemeState(theme);

          return [expected];
        });
  });

  group('primaryColorDarkChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits primary color dark',
      build: () => cubit,
      act: (cubit) => cubit.primaryColorDarkChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(primaryColorDark: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('accentColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits accent color',
      build: () => cubit,
      act: (cubit) => cubit.accentColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(accentColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('accentColorBrightnessChanged', () {
    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits accent color brightness light',
      build: () => cubit,
      act: (cubit) => cubit.accentColorBrightnessChanged(false),
      expect: () {
        final theme = state.themeData.copyWith(
          accentColorBrightness: Brightness.light,
        );
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits accent color brightness dark',
      build: () => cubit,
      act: (cubit) => cubit.accentColorBrightnessChanged(true),
      expect: () {
        final theme = state.themeData.copyWith(
          accentColorBrightness: Brightness.dark,
        );
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('bgColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits background color',
      build: () => cubit,
      act: (cubit) => cubit.bgColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(backgroundColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('bottomAppBarColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits bottom app bar color',
      build: () => cubit,
      act: (cubit) => cubit.bottomAppBarColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(bottomAppBarColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('canvasColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits canvas color',
      build: () => cubit,
      act: (cubit) => cubit.canvasColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(canvasColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('cardColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits card color',
      build: () => cubit,
      act: (cubit) => cubit.cardColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(cardColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('dialogBgColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits dialog background color',
      build: () => cubit,
      act: (cubit) => cubit.dialogBgColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(dialogBackgroundColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('disabledColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits disabled color',
      build: () => cubit,
      act: (cubit) => cubit.disabledColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(disabledColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('dividerColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits divider color',
      build: () => cubit,
      act: (cubit) => cubit.dividerColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(dividerColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('errorColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits error color',
      build: () => cubit,
      act: (cubit) => cubit.errorColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(errorColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('focusColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits focus color',
      build: () => cubit,
      act: (cubit) => cubit.focusColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(focusColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('highlightColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits highlight color',
      build: () => cubit,
      act: (cubit) => cubit.highlightColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(highlightColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('hintColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits hint color',
      build: () => cubit,
      act: (cubit) => cubit.hintColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(hintColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('hoverColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits hover color',
      build: () => cubit,
      act: (cubit) => cubit.hoverColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(hoverColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('indicatorColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits indicator color',
      build: () => cubit,
      act: (cubit) => cubit.indicatorColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(indicatorColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('scaffoldBgColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits scaffold background color',
      build: () => cubit,
      act: (cubit) => cubit.scaffoldBgColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(scaffoldBackgroundColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('secondaryHeaderolorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits secondary header color',
      build: () => cubit,
      act: (cubit) => cubit.secondaryHeaderColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(secondaryHeaderColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('selectedRowColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits selected row color',
      build: () => cubit,
      act: (cubit) => cubit.selectedRowColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(selectedRowColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('shadowColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits shadow row color',
      build: () => cubit,
      act: (cubit) => cubit.shadowColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(shadowColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('splashColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits splash color',
      build: () => cubit,
      act: (cubit) => cubit.splashColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(splashColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('toggleableActiveColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits toggleable active color',
      build: () => cubit,
      act: (cubit) => cubit.toggleableActiveColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(toggleableActiveColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });

  group('unselectedWidgetColorChanged', () {
    final color = getRandomColor();

    blocTest<AdvancedThemeCubit, AdvancedThemeState>(
      'emits unselected widget color',
      build: () => cubit,
      act: (cubit) => cubit.unselectedWidgetColorChanged(color),
      expect: () {
        final theme = state.themeData.copyWith(unselectedWidgetColor: color);
        final expected = getAdvancedThemeState(theme);

        return [expected];
      },
    );
  });
}
