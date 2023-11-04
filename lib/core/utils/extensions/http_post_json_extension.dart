import 'dart:convert';

import 'package:http/http.dart' as http;

extension HttpPostJsonExtension on String {
  Future<http.Response> postJson(Map<String, dynamic> body) {
    return http.post(
      Uri.parse(this),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
  }
}
