import 'dart:html'; // For web localStorage
import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio();
  final _baseUrl = "http://localhost:8001"; // Adjust your backend URL here

  // Login method that returns the JWT token or null
  Future<String?> login(String username, String password) async {
    try {
      final response = await _dio.post("$_baseUrl/login", data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Assuming the token is in response.data['token']
        final token = response.data['token'];
        
        // Save the token in local storage (for web)
        window.localStorage['jwt_token'] = token;

        return token; // Return the token
      } else {
        return null; // Login failed, return null
      }
    } catch (e) {
      print("Login error: $e");
      return null; // In case of an error, return null
    }
  }

  // Register method that returns an error message if registration fails, otherwise null
  Future<String?> register(String username, String password) async {
    try {
      final response = await _dio.post("$_baseUrl/register", data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode == 201) {
        final token = response.data['token'];
        
        // Save the token in local storage (for web)
        window.localStorage['jwt_token'] = token;

        return null; // Registration successful, no error message
      }
    } on DioException catch (e) {
      // Handle the DioError and check if it's a 400 status
      if (e.response != null) {
        // DioError contains response, check status code and handle the error
        if (e.response!.statusCode == 400) {
          // Return the error message from the backend
          return e.response!.data['message'] ?? 'Registration failed';
        } else {
          return 'An error occurred: ${e.response!.statusMessage}';
        }
      } else {
        // Handle other types of Dio errors (e.g., no internet connection)
        return 'A network error occurred. Please try again later.';
      }
    } catch (e) {
      print("Registration error: $e");
      return 'An unexpected error occurred.';
    }

    return 'Registration failed. Please try again.'; // Fallback error message
  }


  // Retrieve token from localStorage
  String? getToken() {
    return window.localStorage['jwt_token'];
  }

  // Logout method to remove the token
  void logout() {
    window.localStorage.remove('jwt_token');
  }
}
