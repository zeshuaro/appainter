import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:appainter/utils/utils.dart';

part 'text_button_theme_cubit.g.dart';
part 'text_button_theme_state.dart';

class TextButtonThemeCubit extends Cubit<TextButtonThemeState> {
  TextButtonThemeCubit() : super(const TextButtonThemeState());

  final _buttonUtils = const ButtonUtils();

  void themeChanged(TextButtonThemeData theme) {
    emit(state.copyWith(theme: theme));
  }

  void backgroundColorChanged(Color color) {
    final style = _getButtonStyle().copyWith(
      backgroundColor: MaterialStateProperty.all(color),
    );
    _emitWithButtonStyle(style);
  }

  void foregroundDefaultColorChanged(Color color) {
    final style = _getButtonStyle();
    final fgColor = _buttonUtils.getBasicColor(
      style.foregroundColor!,
      defaultColor: color,
    );

    _emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void foregroundDisabledColorChanged(Color color) {
    final style = _getButtonStyle();
    final fgColor = _buttonUtils.getBasicColor(
      style.foregroundColor!,
      disabledColor: color,
    );

    _emitWithButtonStyle(style.copyWith(foregroundColor: fgColor));
  }

  void overlayHoveredColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = _buttonUtils.getOverlayColor(
      style.overlayColor!,
      hoveredColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void overlayFocusedColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = _buttonUtils.getOverlayColor(
      style.overlayColor!,
      focusedColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void overlayPressedColorChanged(Color color) {
    final style = _getButtonStyle();
    final overlayColor = _buttonUtils.getOverlayColor(
      style.overlayColor!,
      pressedColor: color,
    );

    _emitWithButtonStyle(style.copyWith(overlayColor: overlayColor));
  }

  void shadowColorChanged(Color color) {
    final style = _getButtonStyle().copyWith(
      shadowColor: MaterialStateProperty.all(color),
    );
    _emitWithButtonStyle(style);
  }

  void elevationChanged(String value) {
    final elevation = double.tryParse(value);
    if (elevation != null) {
      final elevationProp = MaterialStateProperty.all(elevation);
      final style = _getButtonStyle().copyWith(
        elevation: elevationProp,
      );

      _emitWithButtonStyle(style);
    }
  }

  void _emitWithButtonStyle(ButtonStyle style) {
    emit(state.copyWith(theme: TextButtonThemeData(style: style)));
  }

  ButtonStyle _getButtonStyle() {
    final themeData = ThemeData();
    final colorScheme = themeData.colorScheme;

    return state.theme.style ??
        TextButton.styleFrom(
          primary: colorScheme.primary,
          onSurface: colorScheme.onSurface,
          backgroundColor: Colors.transparent,
          shadowColor: themeData.shadowColor,
          elevation: 0,
          minimumSize: const Size(64, 36),
        );
  }
}
