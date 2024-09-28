import 'dart:html'; // For web localStorage
import 'package:flutter/material.dart';
import 'package:foodiez_flutter/data/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  String? _token;

  // Getter for token
  String? get token => _token;

  // Check if the user is authenticated by checking if a token is stored
  bool get isAuthenticated {
    return _token != null || _authService.getToken() != null;
  }

  // Login the user and save the token
  Future<bool> login(String username, String password) async {
    _token = await _authService.login(username, password);

    if (_token != null) {
      notifyListeners(); // Notify that the user is logged in
      return true; // Login success
    }
    return false; // Login failed
  }

  // Register the user and save the token
  Future<String?> register(String username, String password) async {
    final errorMessage = await _authService.register(username, password);

    if (errorMessage == null) {
      _token = _authService.getToken();
      notifyListeners(); // Notify listeners if registration was successful
    }

    return errorMessage; // Return the error message or null if successful
  }

  // Logout the user and remove the token
  void logout() {
    _token = null;
    _authService.logout();
    notifyListeners();
  }
}
