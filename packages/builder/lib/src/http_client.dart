import 'package:http/http.dart' as http;

class HttpClient {
  const HttpClient();

  Future<http.Response> get(String url) async {
    final parsedUrl = Uri.parse(url);
    return http.get(parsedUrl);
  }
}
