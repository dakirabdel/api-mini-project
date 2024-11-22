import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projectect1/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  String? _error;
  String? _token;
  dynamic _response;

  bool get isLoading => _isLoading;
  String? get error => _error;
  dynamic get response => _response;
  bool get isAuthenticated => _token != null;

  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    final result = await _authService.login(email, password);
    if (result.containsKey("error")) {
        try{
          _error=result["error"];
        }catch(e){
          Map<String, dynamic> jsonObject = result["error"];

          _error = jsonObject.entries.map((entry) {
            return '- ${entry.value.join(', ')}'; // Join multiple error messages for the same key
          }).join('\n'); // Separate errors by new lines
        }

      _isLoading = false;
      notifyListeners();
    } else {
      _token = result["token"];
    }

    _isLoading = false;
    _response = result;
    notifyListeners();

  }

  Future<void> register(String name, String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _authService.register(name, email, password);

    if (result.containsKey("error")) {
      try{
        _error=result["error"];
      }catch(e){
        Map<String, dynamic> jsonObject = result["error"];

        _error = jsonObject.entries.map((entry) {
          return '- ${entry.value.join(', ')}'; // Join multiple error messages for the same key
        }).join('\n'); // Separate errors by new lines
      }
      _isLoading = false;
      notifyListeners();
    } else {
      _token = result["token"];// Save token or user info upon successful registration
      _isLoading = false;
      notifyListeners();


    }

    _isLoading = false;
    _response = result;
    notifyListeners();
  }

  void logout() {
    _token = null;
    notifyListeners();
  }
}
