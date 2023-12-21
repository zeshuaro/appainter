import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/common/common.dart';
import 'package:appainter/models/models.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter/text_theme/text_theme.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'abstract_text_style_cubit.g.dart';
part 'text_style_state.dart';

abstract class AbstractTextStyleCubit extends Cubit<TextStyleState> {
  AbstractTextStyleCubit({
    required this.typeScale,
    this.isBaseStyleBlack = true,
  }) : super(
          TextStyleState(
            style: isBaseStyleBlack
                ? kBlackTextStyles[typeScale]!
                : kWhiteTextStyles[typeScale]!,
          ),
        );

  final TypeScale typeScale;
  final bool isBaseStyleBlack;

  void styleBrightnessChanged(bool isDark) {
    final style =
        isDark ? kWhiteTextStyles[typeScale]! : kBlackTextStyles[typeScale]!;
    emit(state.copyWith(style: style));
  }

  void styleChanged(TextStyle? style) => emit(state.copyWith(style: style));

  void colorChanged(Color color) {
    final style = state.style.copyWith(color: color);
    emit(state.copyWith(style: style));
  }

  void backgroundColorChanged(Color color) {
    final style = state.style.copyWith(backgroundColor: color);
    emit(state.copyWith(style: style));
  }

  void fontSizeChanged(String value) {
    final size = double.tryParse(value);
    if (size != null) {
      final style = state.style.copyWith(fontSize: size);
      emit(state.copyWith(style: style));
    }
  }

  void fontWeightChanged(String? value) {
    final weight = MyFontWeight().fromString(value);
    if (weight != null) {
      final style = state.style.copyWith(fontWeight: weight);
      emit(state.copyWith(style: style));
    }
  }

  void fontStyleChanged(String? value) {
    final fontStyle = UtilService.stringToEnum(FontStyle.values, value);
    if (fontStyle != null) {
      final style = state.style.copyWith(fontStyle: fontStyle);
      emit(state.copyWith(style: style));
    }
  }

  void letterSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = state.style.copyWith(letterSpacing: spacing);
      emit(state.copyWith(style: style));
    }
  }

  void wordSpacingChanged(String value) {
    final spacing = double.tryParse(value);
    if (spacing != null) {
      final style = state.style.copyWith(wordSpacing: spacing);
      emit(state.copyWith(style: style));
    }
  }

  void textBaselineChanged(String? value) {
    final baseline = UtilService.stringToEnum(TextBaseline.values, value);
    if (baseline != null) {
      final style = state.style.copyWith(textBaseline: baseline);
      emit(state.copyWith(style: style));
    }
  }

  void heightChanged(String value) {
    final height = double.tryParse(value);
    if (height != null) {
      final style = state.style.copyWith(height: height);
      emit(state.copyWith(style: style));
    }
  }

  void leadingDistributionChanged(String? value) {
    final dist = UtilService.stringToEnum(
      TextLeadingDistribution.values,
      value,
    );
    if (dist != null) {
      final style = state.style.copyWith(leadingDistribution: dist);
      emit(state.copyWith(style: style));
    }
  }

  void decorationChanged(String? value) {
    final decoration = MyTextDecoration().fromString(value);
    if (decoration != null) {
      final style = state.style.copyWith(decoration: decoration);
      emit(state.copyWith(style: style));
    }
  }

  void decorationColorChanged(Color color) {
    final style = state.style.copyWith(decorationColor: color);
    emit(state.copyWith(style: style));
  }

  void decorationStyleChanged(String? value) {
    if (value == kNone) {
      final style = state.style.copyWithNull(decorationStyle: true);
      emit(state.copyWith(style: style));
    } else {
      final decorationStyle = UtilService.stringToEnum(
        TextDecorationStyle.values,
        value,
      );
      if (decorationStyle != null) {
        final style = state.style.copyWith(decorationStyle: decorationStyle);
        emit(state.copyWith(style: style));
      }
    }
  }

  void decorationThicknessChanged(String value) {
    final thickness = double.tryParse(value);
    if (thickness != null) {
      final style = state.style.copyWith(decorationThickness: thickness);
      emit(state.copyWith(style: style));
    }
  }

  void fontFamilyChanged(FontData data) {
    final style = state.style.merge(data.style);
    emit(state.copyWith(style: style));
  }
}
