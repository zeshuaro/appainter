import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class FakeHomeState extends Fake implements HomeState {}

class MockBasicThemeCubit extends MockCubit<BasicThemeState>
    implements BasicThemeCubit {}

class FakeBasicThemeState extends Fake implements BasicThemeState {}

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    HomeCubit? homeCubit,
    BasicThemeCubit? basicThemeCubit,
    AdvancedThemeCubit? advancedThemeCubit,
  }) async {
    registerFallbackValue<HomeState>(FakeHomeState());
    registerFallbackValue<BasicThemeState>(FakeBasicThemeState());
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());

    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider.value(value: homeCubit ?? MockHomeCubit()),
          BlocProvider.value(value: basicThemeCubit ?? MockBasicThemeCubit()),
          BlocProvider.value(
            value: advancedThemeCubit ?? MockAdvancedThemeCubit(),
          ),
        ],
        child: MaterialApp(
          home: widget,
        ),
      ),
    );
  }
}
