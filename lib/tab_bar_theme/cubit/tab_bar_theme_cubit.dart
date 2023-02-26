import 'dart:async';

import 'package:appainter/abstract_text_style/abstract_text_style.dart';
import 'package:appainter/services/services.dart';
import 'package:appainter_annotations/annotations.dart';
import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'tab_bar_theme_cubit.g.dart';
part 'tab_bar_theme_state.dart';

const _labelTypeScale = TypeScale.titleSmall;

@ThemeDocs(extraPropertyTypes: {'TabBarIndicatorSize'})
class TabBarThemeCubit extends Cubit<TabBarThemeState> {
  TabBarThemeCubit({
    required this.labelTextStyleCubit,
    required this.unselectedLabelTextStyleCubit,
  }) : super(const TabBarThemeState()) {
    labelTextStyleCubitSubscription = labelTextStyleCubit.stream.listen(
      (otherState) {
        final theme = state.theme.copyWith(labelStyle: otherState.style);
        emit(state.copyWith(theme: theme));
      },
    );
    unselectedLabelTextStyleCubitSubscription =
        unselectedLabelTextStyleCubit.stream.listen(
      (otherState) {
        final theme = state.theme.copyWith(
          unselectedLabelStyle: otherState.style,
        );
        emit(state.copyWith(theme: theme));
      },
    );
  }

  final TabBarLabelTextStyleCubit labelTextStyleCubit;
  final TabBarUnselectedLabelTextStyleCubit unselectedLabelTextStyleCubit;

  late final StreamSubscription labelTextStyleCubitSubscription;
  late final StreamSubscription unselectedLabelTextStyleCubitSubscription;

  static final defaultLabelTextStyle = kWhiteTextStyles[_labelTypeScale]!;

  @override
  Future<void> close() {
    labelTextStyleCubitSubscription.cancel();
    unselectedLabelTextStyleCubitSubscription.cancel();
    return super.close();
  }

  void themeChanged(TabBarTheme theme) {
    labelTextStyleCubit.styleChanged(theme.labelStyle ?? defaultLabelTextStyle);
    unselectedLabelTextStyleCubit.styleChanged(
      theme.unselectedLabelStyle ?? defaultLabelTextStyle,
    );
    emit(state.copyWith(theme: theme));
  }

  void labelColorChanged(Color color) {
    final theme = state.theme.copyWith(labelColor: color);
    emit(state.copyWith(theme: theme));
  }

  void unselectedLabelColorChanged(Color color) {
    final theme = state.theme.copyWith(unselectedLabelColor: color);
    emit(state.copyWith(theme: theme));
  }

  void indicatorSizeChanged(String? value) {
    final size = UtilService.stringToEnum(TabBarIndicatorSize.values, value);
    if (size != null) {
      final theme = state.theme.copyWith(indicatorSize: size);
      emit(state.copyWith(theme: theme));
    }
  }
}

class TabBarLabelTextStyleCubit extends AbstractTextStyleCubit {
  TabBarLabelTextStyleCubit()
      : super(typeScale: _labelTypeScale, isBaseStyleBlack: false);
}

class TabBarUnselectedLabelTextStyleCubit extends AbstractTextStyleCubit {
  TabBarUnselectedLabelTextStyleCubit()
      : super(typeScale: _labelTypeScale, isBaseStyleBlack: false);
}
