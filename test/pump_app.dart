import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:mocktail/mocktail.dart';

import 'mocks.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    HomeRepository? homeRepo,
    HomeCubit? homeCubit,
    BasicThemeCubit? basicThemeCubit,
    AdvancedThemeCubit? advancedThemeCubit,
  }) async {
    registerFallbackValue(FakeHomeState());
    registerFallbackValue(FakeBasicThemeState());
    registerFallbackValue(FakeAdvancedThemeState());

    final mockHomeCubit = MockHomeCubit();
    final mockBasicThemeCubit = MockBasicThemeCubit();
    final mockAdvancedThemeCubit = MockAdvancedThemeCubit();

    when(() => mockHomeCubit.state).thenReturn(const HomeState());
    when(() => mockBasicThemeCubit.state).thenReturn(BasicThemeState());
    when(() => mockAdvancedThemeCubit.state).thenReturn(AdvancedThemeState());

    return pumpWidget(
      RepositoryProvider(
        create: (context) => homeRepo ?? MockHomeRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: homeCubit ?? mockHomeCubit),
            BlocProvider.value(value: basicThemeCubit ?? mockBasicThemeCubit),
            BlocProvider.value(
              value: advancedThemeCubit ?? mockAdvancedThemeCubit,
            ),
          ],
          child: MaterialApp(
            home: widget,
          ),
        ),
      ),
    );
  }
}
