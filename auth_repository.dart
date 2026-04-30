import 'dart:async';

import 'api_client.dart';

class AuthRepository {
  final ApiClient _apiClient = ApiClient();

  // ============================
  // SIGN UP
  // ============================
  Future<Map<String, dynamic>> signUp({
    required String email,
    required String password,
  }) async {
    // 🔽 REPLACE WITH REAL API CALL 🔽
    // final response = await _apiClient.dio.post('auth/register', data: {
    //   'email': email,
    //   'password': password,
    // });
    // return response.data;

    // 🔼 MOCK IMPLEMENTATION (for UI testing) 🔼
    await Future.delayed(const Duration(seconds: 2));
    if (email.isEmpty || !email.contains('@') || password.length < 6) {
      throw Exception('Invalid email or password too short');
    }
    return {
      'user': {'email': email, 'name': ''},
    };
  }

  // ============================
  // SIGN IN
  // ============================
  Future<Map<String, dynamic>> signIn({
    required String email,
    required String password,
  }) async {
    // 🔽 REPLACE WITH REAL API CALL 🔽
    // final response = await _apiClient.dio.post('auth/login', data: {
    //   'email': email,
    //   'password': password,
    // });
    // return response.data;

    await Future.delayed(const Duration(seconds: 2));
    if (email.isEmpty || !email.contains('@') || password.length < 6) {
      throw Exception('Invalid credentials');
    }
    return {
      'user': {'email': email, 'name': 'Andrew'},
    };
  }

  // ============================
  // FORGOT PASSWORD
  // ============================
  Future<void> forgotPassword(String email) async {
    // 🔽 REPLACE 🔽
    // await _apiClient.dio.post('auth/forgot-password', data: {'email': email});

    await Future.delayed(const Duration(seconds: 2));
    if (email.isEmpty || !email.contains('@')) {
      throw Exception('Please enter a valid email address');
    }
  }
}
