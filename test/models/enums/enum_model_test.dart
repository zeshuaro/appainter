import 'package:flutter_test/flutter_test.dart';
import 'package:appainter/models/enums/enum_model.dart';

enum KnownEnum { a, b }
enum UnknownEnum { a, b }

void main() {
  final values = {"a": KnownEnum.a, "b": KnownEnum.b};

  test('get names should return map keys', () {
    final enumModel = EnumModel(values);

    expect(enumModel.names, equals(values.keys));
  });

  test('get values should return map values', () {
    final enumModel = EnumModel(values);

    expect(enumModel.values, equals(values.values));
  });

  group('enumFromString', () {
    test('should return enum associated to string', () {
      final enumModel = EnumModel(values);

      expect(enumModel.enumFromString("a"), equals(KnownEnum.a));
    });

    test('should return null for unknown string', () {
      final enumModel = EnumModel(values);

      expect(enumModel.enumFromString("c"), equals(null));
    });
  });

  group('stringFromEnum', () {
    test('should return string associated to enum', () {
      final enumModel = EnumModel(values);

      expect(enumModel.stringFromEnum(KnownEnum.a), equals("a"));
    });

    test('should return null for unknown string', () {
      final enumModel = EnumModel(values);

      expect(enumModel.stringFromEnum(UnknownEnum.a), equals(null));
    });
  });
}
