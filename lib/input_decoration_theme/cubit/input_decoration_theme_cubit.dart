import 'package:appainter/color_theme/color_theme.dart';
import 'package:appainter/input_decoration_theme/input_decoration_theme.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter_annotations/annotations.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'input_decoration_theme_cubit.g.dart';
part 'input_decoration_theme_state.dart';

@ThemeDocs(extraPropertyTypes: {'FloatingLabelBehavior'})
class InputDecorationThemeCubit extends Cubit<InputDecorationThemeState> {
  final ColorThemeCubit colorThemeCubit;

  InputDecorationThemeCubit({required this.colorThemeCubit})
      : super(const InputDecorationThemeState());

  final _inputBorderEnum = InputBorderEnum();
  static const _defaultBorder = UnderlineInputBorder();

  void themeChanged(InputDecorationTheme theme) {
    emit(state.copyWith(theme: theme));
  }

  void floatingLabelBehaviorChanged(String? value) {
    final behavior = UtilService.stringToEnum(
      FloatingLabelBehavior.values,
      value,
    );
    if (behavior != null) {
      final theme = state.theme.copyWith(floatingLabelBehavior: behavior);
      emit(state.copyWith(theme: theme));
    }
  }

  void fillColorChanged(Color color) {
    final theme = state.theme.copyWith(fillColor: color);
    emit(state.copyWith(theme: theme));
  }

  void hoverColorChanged(Color color) {
    final theme = state.theme.copyWith(hoverColor: color);
    emit(state.copyWith(theme: theme));
  }

  void alignLabelWithHintChanged(bool value) {
    final theme = state.theme.copyWith(alignLabelWithHint: value);
    emit(state.copyWith(theme: theme));
  }

  void filledChanged(bool value) {
    final theme = state.theme.copyWith(filled: value);
    emit(state.copyWith(theme: theme));
  }

  void isCollapsedChanged(bool value) {
    final theme = state.theme.copyWith(isCollapsed: value);
    emit(state.copyWith(theme: theme));
  }

  void isDenseChanged(bool value) {
    final theme = state.theme.copyWith(isDense: value);
    emit(state.copyWith(theme: theme));
  }

  void errorMaxLinesChanged(String value) {
    final maxLines = int.tryParse(value);
    if (maxLines != null) {
      final theme = state.theme.copyWith(errorMaxLines: maxLines);
      emit(state.copyWith(theme: theme));
    }
  }

  void helperMaxLinesChanged(String value) {
    final maxLines = int.tryParse(value);
    if (maxLines != null) {
      final theme = state.theme.copyWith(helperMaxLines: maxLines);
      emit(state.copyWith(theme: theme));
    }
  }

  void borderChanged(String? value) {
    final border = _inputBorderEnum.fromString(value);
    if (border != null) {
      final theme = state.theme.copyWith(border: border).copyWithNull(
            enabledBorder: true,
            disabledBorder: true,
            errorBorder: true,
          );
      emit(state.copyWith(theme: theme));
    }
  }

  void borderRadiusChanged(String value) {
    final radius = double.tryParse(value);
    final border = state.theme.border;
    if (radius != null && border is OutlineInputBorder) {
      final newBorder = border.copyWith(
        borderRadius: BorderRadius.circular(radius),
      );
      final theme = state.theme.copyWith(border: newBorder);
      emit(state.copyWith(theme: theme));
    }
  }

  void enabledBorderSideColorChanged(Color color) {
    final border = _getBorderWithNewColor(color, _enabledBorder);
    final theme = state.theme.copyWith(enabledBorder: border);
    emit(state.copyWith(theme: theme));
  }

  void enabledBorderSideWidthChanged(String value) {
    final border = _getBorderWithNewWidth(value, _enabledBorder);
    if (border != null) {
      final theme = state.theme.copyWith(enabledBorder: border);
      emit(state.copyWith(theme: theme));
    }
  }

  void disabledBorderSideColorChanged(Color color) {
    final border = _getBorderWithNewColor(color, _disabledBorder);
    final theme = state.theme.copyWith(disabledBorder: border);
    emit(state.copyWith(theme: theme));
  }

  void disabledBorderSideWidthChanged(String value) {
    final border = _getBorderWithNewWidth(value, _disabledBorder);
    if (border != null) {
      final theme = state.theme.copyWith(disabledBorder: border);
      emit(state.copyWith(theme: theme));
    }
  }

  void errorBorderSideColorChanged(Color color) {
    final border = _getBorderWithNewColor(color, _errorBorder);
    final theme = state.theme.copyWith(errorBorder: border);
    emit(state.copyWith(theme: theme));
  }

  void errorBorderSideWidthChanged(String value) {
    final border = _getBorderWithNewWidth(value, _errorBorder);
    if (border != null) {
      final theme = state.theme.copyWith(errorBorder: border);
      emit(state.copyWith(theme: theme));
    }
  }

  InputBorder get _enabledBorder {
    return state.theme.enabledBorder ?? state.theme.border ?? _defaultBorder;
  }

  InputBorder get _disabledBorder {
    return state.theme.disabledBorder ??
        state.theme.border?.copyWith(
          borderSide: BorderSide(color: colorThemeCubit.state.disabledColor),
        ) ??
        _defaultBorder;
  }

  InputBorder get _errorBorder {
    return state.theme.errorBorder ??
        state.theme.border?.copyWith(
          borderSide: BorderSide(
            color: colorThemeCubit.state.colorScheme.error,
          ),
        ) ??
        _defaultBorder;
  }

  InputBorder _getBorderWithNewColor(Color color, InputBorder border) {
    final borderSide = border.borderSide.copyWith(color: color);
    return border.copyWith(borderSide: borderSide);
  }

  InputBorder? _getBorderWithNewWidth(String value, InputBorder border) {
    final width = double.tryParse(value);
    if (width != null) {
      final borderSide = border.borderSide.copyWith(width: width);
      return border.copyWith(borderSide: borderSide);
    }
    return null;
  }
}
