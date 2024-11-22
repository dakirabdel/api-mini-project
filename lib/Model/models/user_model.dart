import 'package:flutter/material.dart';

class User extends ChangeNotifier {
  String _name = 'name';
  String _email = 'email';
  String _token = 'token';

  // Getters
  String get name => _name;
  String get email => _email;
  String get token => _token;

  // Setters
  void setName(String newName) {
    _name = newName;
    notifyListeners();
  }

  void setEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void setToken(String newToken) {
    _token = newToken;
    notifyListeners();
  }

  // Method to update all fields at once
  void updateUser(String newName, String newEmail, String newToken) {
    _name = newName;
    _email = newEmail;
    _token = newToken;
    notifyListeners();
  }

  // Method to clear user data
  void clearUser() {
    _name = '';
    _email = '';
    _token = '';
    notifyListeners();
  }
}
