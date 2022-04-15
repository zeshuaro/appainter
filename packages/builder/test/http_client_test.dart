import 'package:appainter_builder/src/http_client.dart';
import 'package:test/test.dart';

void main() {
  late HttpClient client;

  setUp(() => client = const HttpClient());

  test('gets request', () async {
    final res = await client.get('https://pub.dev/');
    expect(res.statusCode, equals(200));
  });
}
