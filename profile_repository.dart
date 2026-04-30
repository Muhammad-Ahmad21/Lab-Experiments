import 'dart:async';

import '../models/user_profile.dart';
import 'api_client.dart';

class ProfileRepository {
  final ApiClient _apiClient = ApiClient();

  Future<void> saveProfile(UserProfile profile) async {
    // 🔽 REAL API CALL 🔽
    // await _apiClient.dio.post('user/profile', data: profile.toJson());

    // MOCK
    await Future.delayed(const Duration(seconds: 2));
    // Simulate success
  }
}
