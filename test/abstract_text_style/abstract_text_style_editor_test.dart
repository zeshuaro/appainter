import 'dart:math';

import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/models/models.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../utils.dart';
import '../utils/widget_tester_utils.dart';
import 'mocks.dart';

void main() {
  const expandText = 'Test';

  late TestTextStyleCubit cubit;
  late TextStyle style;
  late Color color;
  late double doubleNum;
  late String doubleStr;

  setUp(() {
    cubit = MockTextStyleCubit();
    style = Typography.englishLike2018
        .merge(Typography.blackMountainView)
        .titleSmall!;
    color = getRandomColor();
    doubleNum = Random().nextDouble();
    doubleStr = doubleNum.toString();
  });

  Future<void> pumpApp(WidgetTester tester, [TextStyleState? state]) async {
    when(() => cubit.state).thenReturn(state ?? TextStyleState(style: style));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: cubit,
          child: Scaffold(
            body: MyExpansionPanelList(
              item: const TestIconThemeEditor(),
            ),
          ),
        ),
      ),
    );
    await tester.expandWidget(expandText);
  }

  group('color picker', () {
    const key = 'colorPicker';

    testWidgets('render color', (tester) async {
      final state = TextStyleState(style: style.copyWith(color: color));
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(style.color!.opacity);

      await pumpApp(tester);
      await tester.verifyColorPicker(key, opaqueColor, cubit.colorChanged);
    });
  });

  group('background color picker', () {
    const key = 'backgroundColorPicker';

    testWidgets('render color', (tester) async {
      final state = TextStyleState(
        style: style.copyWith(backgroundColor: color),
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0);

      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        cubit.backgroundColorChanged,
      );
    });
  });

  group('font size text field', () {
    const key = 'fontSizeTextField';

    testWidgets('render font size', (tester) async {
      final state = TextStyleState(style: style.copyWith(fontSize: doubleNum));
      await pumpApp(tester, state);
      await tester.expectTextField(key, doubleStr);
    });

    testWidgets('change font size', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(key, doubleStr, cubit.fontSizeChanged);
    });
  });

  group('font weight dropdown', () {
    const key = 'fontWeightDropdown';
    final fontWeight = MyFontWeight();

    for (var weight in fontWeight.values) {
      final weightStr = fontWeight.convertToString(weight)!;

      testWidgets('render $weight', (tester) async {
        final state = TextStyleState(style: style.copyWith(fontWeight: weight));
        await pumpApp(tester, state);
        await tester.expectDropdown(key, weightStr);
      });

      testWidgets('change $weight', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(key, weightStr, cubit.fontWeightChanged);
      });
    }
  });

  group('font style dropdown', () {
    const key = 'fontStyleDropdown';

    for (var fontStyle in FontStyle.values) {
      final fontStyleStr = UtilService.enumToString(fontStyle);

      testWidgets('render $fontStyle', (tester) async {
        final state = TextStyleState(
          style: style.copyWith(fontStyle: fontStyle),
        );
        await pumpApp(tester, state);
        await tester.expectDropdown(key, fontStyleStr);
      });

      testWidgets('change $fontStyle', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(key, fontStyleStr, cubit.fontStyleChanged);
      });
    }
  });

  group('letter spacing text field', () {
    const key = 'letterSpacingTextField';

    for (var multiplier in [1, -1]) {
      testWidgets(
        'render letter spacing with multiplier $multiplier',
        (tester) async {
          final value = doubleNum * multiplier;
          final state = TextStyleState(
            style: style.copyWith(letterSpacing: value),
          );

          await pumpApp(tester, state);

          await tester.expectTextField(key, value.toString());
        },
      );

      testWidgets(
        'change letter spacing with multiplier $multiplier',
        (tester) async {
          final value = doubleNum * multiplier;

          await pumpApp(tester);
          await tester.verifyTextField(
            key,
            value.toString(),
            cubit.letterSpacingChanged,
          );
        },
      );
    }
  });

  group('word spacing text field', () {
    const key = 'wordSpacingTextField';

    for (var multiplier in [1, -1]) {
      testWidgets(
        'render word spacing with multiplier $multiplier',
        (tester) async {
          final value = doubleNum * multiplier;
          final state = TextStyleState(
            style: style.copyWith(wordSpacing: value),
          );

          await pumpApp(tester, state);

          await tester.expectTextField(key, value.toString());
        },
      );

      testWidgets(
        'change word spacing with multiplier $multiplier',
        (tester) async {
          final value = doubleNum * multiplier;

          await pumpApp(tester);
          await tester.verifyTextField(
            key,
            value.toString(),
            cubit.wordSpacingChanged,
          );
        },
      );
    }
  });

  group('text baseline dropdown', () {
    const key = 'textBaselineDropdown';

    for (var baseline in TextBaseline.values) {
      final baselineStr = UtilService.enumToString(baseline);

      testWidgets('render $baseline', (tester) async {
        final state = TextStyleState(
          style: style.copyWith(textBaseline: baseline),
        );
        await pumpApp(tester, state);
        await tester.expectDropdown(key, baselineStr);
      });

      testWidgets('change $baseline', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          baselineStr,
          cubit.textBaselineChanged,
        );
      });
    }
  });

  group('height text field', () {
    const key = 'heightTextField';

    testWidgets('render height', (tester) async {
      final state = TextStyleState(style: style.copyWith(height: doubleNum));
      await pumpApp(tester, state);
      await tester.expectTextField(key, doubleStr);
    });

    testWidgets('change height', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(key, doubleStr, cubit.heightChanged);
    });
  });

  group('leading distribution dropdown', () {
    const key = 'leadingDistributionDropdown';

    for (var dist in TextLeadingDistribution.values) {
      final distStr = UtilService.enumToString(dist);

      testWidgets('render $dist', (tester) async {
        final state = TextStyleState(
          style: style.copyWith(leadingDistribution: dist),
        );
        await pumpApp(tester, state);
        await tester.expectDropdown(key, distStr);
      });

      testWidgets('change $dist', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          distStr,
          cubit.leadingDistributionChanged,
        );
      });
    }
  });

  group('decoration dropdown', () {
    const key = 'decorationDropdown';
    final decoration = MyTextDecoration();

    for (var decor in decoration.values) {
      final decorStr = decoration.convertToString(decor)!;

      testWidgets('render $decor', (tester) async {
        final state = TextStyleState(style: style.copyWith(decoration: decor));
        await pumpApp(tester, state);
        await tester.expectDropdown(key, decorStr);
      });

      testWidgets('change $decor', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(key, decorStr, cubit.decorationChanged);
      });
    }
  });

  group('decoration color picker', () {
    const key = 'decorationColorPicker';

    testWidgets('render color', (tester) async {
      final state = TextStyleState(
        style: style.copyWith(decorationColor: color),
      );
      await pumpApp(tester, state);
      await tester.expectColorIndicator(key, color);
    });

    testWidgets('change color', (tester) async {
      final opaqueColor = color.withOpacity(0);

      await pumpApp(tester);
      await tester.verifyColorPicker(
        key,
        opaqueColor,
        cubit.decorationColorChanged,
      );
    });
  });

  group('decoration style dropdown', () {
    const key = 'decorationStyleDropdown';

    testWidgets('render none', (tester) async {
      final state = TextStyleState(
        style: style.copyWithNull(decorationStyle: true),
      );
      await pumpApp(tester, state);
      await tester.expectDropdown(key, kNone);
    });

    testWidgets('change to none', (tester) async {
      await pumpApp(tester);
      await tester.verifyDropdown(key, kNone, cubit.decorationStyleChanged);
    });

    for (var decoStyle in TextDecorationStyle.values) {
      final decoStyleStr = UtilService.enumToString(decoStyle);

      testWidgets('render $decoStyle', (tester) async {
        final state = TextStyleState(
          style: style.copyWith(decorationStyle: decoStyle),
        );
        await pumpApp(tester, state);
        await tester.expectDropdown(key, decoStyleStr);
      });

      testWidgets('change $decoStyle', (tester) async {
        await pumpApp(tester);
        await tester.verifyDropdown(
          key,
          decoStyleStr,
          cubit.decorationStyleChanged,
        );
      });
    }
  });

  group('decoration thickness field', () {
    const key = 'decorationThicknessTextField';

    testWidgets('render decoration thickness', (tester) async {
      final state = TextStyleState(
        style: style.copyWith(decorationThickness: doubleNum),
      );
      await pumpApp(tester, state);
      await tester.expectTextField(key, doubleStr);
    });

    testWidgets('change decoration thickness', (tester) async {
      await pumpApp(tester);
      await tester.verifyTextField(
        key,
        doubleStr,
        cubit.decorationThicknessChanged,
      );
    });
  });
}
