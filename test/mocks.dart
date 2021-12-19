import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:flutter_theme/basic_theme/basic_theme.dart';
import 'package:flutter_theme/home/home.dart';
import 'package:flutter_theme/services/services.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeCubit extends MockCubit<HomeState> implements HomeCubit {}

class MockBasicThemeCubit extends MockCubit<BasicThemeState>
    implements BasicThemeCubit {}

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class MockThemeService extends Mock implements ThemeService {}

class FakeHomeState extends Fake implements HomeState {}

class FakeBasicThemeState extends Fake implements BasicThemeState {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

mixin DiagnosticableToStringMixin on Object {
  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

class FakeThemeData extends Fake
    with DiagnosticableToStringMixin
    implements ThemeData {}
