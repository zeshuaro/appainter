import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../pump_app.dart';

void main() {
  late AdvancedThemeCubit cubit;

  setUpAll(() {
    registerFallbackValue(FakeAdvancedThemeState());
  });

  setUp(() {
    cubit = MockAdvancedThemeCubit();
    when(() => cubit.state).thenReturn(AdvancedThemeState());
  });

  testWidgets('should display TextThemeEditor', (tester) async {
    await tester.pumpApp(const TextThemeEditor(), advancedThemeCubit: cubit);
    expect(find.byType(TextThemeEditor), findsOneWidget);
  });
}
