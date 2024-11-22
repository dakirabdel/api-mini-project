import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  final String baseUrl = "https://www.gamintg.com/api";

  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/login");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body); // Assuming API returns token or user data
      } else {
        return {"error": json.decode(response.body)["message"]};
      }
    } catch (e) {
      return {"error": "Failed to connect to server"};
    }
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    final url = Uri.parse("$baseUrl/register");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "name": name,
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body); // Assuming successful registration response
      } else {
        return {"error": json.decode(response.body)["message"]};
      }
    } catch (e) {
      return {"error": "Failed to connect to server"};
    }
  }
}
