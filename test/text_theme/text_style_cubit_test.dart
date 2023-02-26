import 'package:appainter/abstract_text_style/consts.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('text style cubits type scale', () {
    expect(
      DisplayLargeTextStyleCubit().typeScale,
      equals(TypeScale.displayLarge),
    );
    expect(
      DisplayMediumTextStyleCubit().typeScale,
      equals(TypeScale.displayMedium),
    );
    expect(
      DisplaySmallTextStyleCubit().typeScale,
      equals(TypeScale.displaySmall),
    );
    expect(
      HeadlineLargeTextStyleCubit().typeScale,
      equals(TypeScale.headlineLarge),
    );
    expect(
      HeadlineMediumTextStyleCubit().typeScale,
      equals(TypeScale.headlineMedium),
    );
    expect(
      HeadlineSmallTextStyleCubit().typeScale,
      equals(TypeScale.headlineSmall),
    );
    expect(TitleLargeTextStyleCubit().typeScale, equals(TypeScale.titleLarge));
    expect(
      TitleMediumTextStyleCubit().typeScale,
      equals(TypeScale.titleMedium),
    );
    expect(TitleSmallTextStyleCubit().typeScale, equals(TypeScale.titleSmall));
    expect(LabelLargeTextStyleCubit().typeScale, equals(TypeScale.labelLarge));
    expect(
      LabelMediumTextStyleCubit().typeScale,
      equals(TypeScale.labelMedium),
    );
    expect(LabelSmallTextStyleCubit().typeScale, equals(TypeScale.labelSmall));
    expect(BodyLargeTextStyleCubit().typeScale, equals(TypeScale.bodyLarge));
    expect(BodyMediumTextStyleCubit().typeScale, equals(TypeScale.bodyMedium));
    expect(BodySmallTextStyleCubit().typeScale, equals(TypeScale.bodySmall));
  });
}
