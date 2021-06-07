import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/cubits/cubits.dart';
import 'package:flutter_theme/src/editors/advanced_editor/color_editor.dart';
import 'package:mocktail/mocktail.dart';

import 'widget_test_helper.dart';

class MockAdvancedThemeCubit extends MockCubit<AdvancedThemeState>
    implements AdvancedThemeCubit {}

class FakeAdvancedThemeState extends Fake implements AdvancedThemeState {}

void main() {
  late AdvancedThemeCubit cubit;

  setUp(() {
    registerFallbackValue<AdvancedThemeState>(FakeAdvancedThemeState());

    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  testWidgets('renders editor', (tester) async {
    await tester.pumpApp(ColorEditor(), advancedThemeCubit: cubit);
    expect(find.byType(ColorEditor), findsOneWidget);
  });
}
