import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkManager {
  // const baseUrl = "https://10.5.66.23:9443/gedave/api/spservicos/v1";
  // const baseUrl = "https://treinagedave.defesaagropecuaria.sp.gov.br/gedave/api/spservicos/v1";
  // const baseUrl = "https://gedave-proxyhml.agricultura.sp.gov.br/gedave/api/spservicos/v1";

  final String baseUrl = "https://treinagedave.defesaagropecuaria.sp.gov.br/gedave/api/spservicos/v1";
  final Map<String, String> defaultHeaders;

  //NetworkManager({required this.baseUrl, required this.defaultHeaders});
  NetworkManager({required this.defaultHeaders});

  // GET request
  Future<dynamic> get(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.get(
      url,
      headers: headers ?? defaultHeaders,
    );

    return _processResponse(response);
  }

  // POST request
  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(
      url,
      headers: headers ?? defaultHeaders,
      body: jsonEncode(body),
    );

    return _processResponse(response);
  }

  // PUT request
  Future<dynamic> put(String endpoint, {Map<String, dynamic>? body, Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.put(
      url,
      headers: headers ?? defaultHeaders,
      body: jsonEncode(body),
    );

    return _processResponse(response);
  }

  // Helper method to process the response
  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw Exception('Bad Request: ${response.body}');
      case 401:
        throw Exception('Unauthorized: ${response.body}');
      case 403:
        throw Exception('Forbidden: ${response.body}');
      case 404:
        throw Exception('Not Found: ${response.body}');
      case 500:
        throw Exception('Internal Server Error: ${response.body}');
      default:
        throw Exception('Error: ${response.statusCode} ${response.body}');
    }
  }
}
