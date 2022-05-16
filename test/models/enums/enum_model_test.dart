import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/models/enums/enum_model.dart';

enum KnownEnum { a, b }

enum UnknownEnum { a, b }

void main() {
  const values = {"a": KnownEnum.a, "b": KnownEnum.b};
  late EnumModel enumModel;

  setUp(() => enumModel = EnumModel(values));

  test('get names should return map keys', () {
    expect(enumModel.names, equals(values.keys));
  });

  test('get values should return map values', () {
    expect(enumModel.values, equals(values.values));
  });

  group('test from string', () {
    test('should return enum associated to string', () {
      expect(enumModel.fromString("a"), equals(KnownEnum.a));
    });

    test('should return null for unknown string', () {
      expect(enumModel.fromString("c"), equals(null));
    });
  });

  test('should return string associated to enum', () {
    expect(enumModel.convertToString(KnownEnum.a), equals("a"));
  });
}
