import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user_profile.dart';
import '../services/profile_repository.dart';

// State class
class ProfileSetupState {
  final int currentStep; // 0 to 9
  final UserProfile profile;
  final bool isSubmitting;
  final String? errorMessage;
  final bool isCompleted;

  ProfileSetupState({
    this.currentStep = 0,
    required this.profile,
    this.isSubmitting = false,
    this.errorMessage,
    this.isCompleted = false,
  });

  ProfileSetupState copyWith({
    int? currentStep,
    UserProfile? profile,
    bool? isSubmitting,
    String? errorMessage,
    bool? isCompleted,
  }) {
    return ProfileSetupState(
      currentStep: currentStep ?? this.currentStep,
      profile: profile ?? this.profile,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class ProfileSetupNotifier extends StateNotifier<ProfileSetupState> {
  final ProfileRepository _repo;

  ProfileSetupNotifier(this._repo)
    : super(ProfileSetupState(profile: UserProfile.empty()));

  void nextStep() {
    if (state.currentStep < 9) {
      state = state.copyWith(currentStep: state.currentStep + 1);
    }
  }

  void previousStep() {
    if (state.currentStep > 0) {
      state = state.copyWith(currentStep: state.currentStep - 1);
    }
  }

  void updateProfile(UserProfile updated) {
    state = state.copyWith(profile: updated);
  }

  Future<void> submitProfile() async {
    state = state.copyWith(isSubmitting: true, errorMessage: null);
    try {
      await _repo.saveProfile(state.profile);
      state = state.copyWith(isSubmitting: false, isCompleted: true);
    } catch (e) {
      state = state.copyWith(isSubmitting: false, errorMessage: e.toString());
    }
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) => ProfileRepository(),
);

final profileSetupViewModelProvider =
    StateNotifierProvider<ProfileSetupNotifier, ProfileSetupState>((ref) {
      final repo = ref.watch(profileRepositoryProvider);
      return ProfileSetupNotifier(repo);
    });
