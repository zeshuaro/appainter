import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_theme/advanced_theme/advanced_theme.dart';
import 'package:json_theme/json_theme.dart';
import 'package:pretty_json/pretty_json.dart';

Color getRandomColor() => Color(Random().nextInt(0xffffffff));

void verifyMaterialProperty(
  MaterialStateProperty propA,
  MaterialStateProperty propB,
) {
  expect(checkMaterialProperty(propA, propB), equals(true));
}

bool checkMaterialProperty(
  MaterialStateProperty propA,
  MaterialStateProperty propB,
) {
  for (var state in MaterialState.values) {
    final states = {state};
    if (propA.resolve(states) != propB.resolve(states)) {
      return false;
    }
  }
  return true;
}

Future<void> debugAdvancedThemeCubit(
  AdvancedThemeCubit cubit,
  ThemeData theme,
) async {
  var file = File("debug_theme_test.json");
  file.writeAsStringSync(
    prettyJson(
      ThemeEncoder.encodeThemeData(
        AdvancedThemeState(themeData: theme).themeData,
      ),
    ),
  );

  file = File("debug_theme_cubit.json");
  file.writeAsStringSync(
    prettyJson(ThemeEncoder.encodeThemeData(cubit.state.themeData)),
  );
}
