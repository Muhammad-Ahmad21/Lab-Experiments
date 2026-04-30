class UserProfile {
  final String name;
  final String gender;
  final int age;
  final List<String> goals;
  final List<String> causes;
  final String stressFrequency;
  final String dietQuality;
  final String meditationExperience;
  final String sleepQuality;
  final String happinessLevel;

  UserProfile({
    required this.name,
    required this.gender,
    required this.age,
    required this.goals,
    required this.causes,
    required this.stressFrequency,
    required this.dietQuality,
    required this.meditationExperience,
    required this.sleepQuality,
    required this.happinessLevel,
  });

  // helper to create empty profile
  factory UserProfile.empty() => UserProfile(
    name: '',
    gender: '',
    age: 25,
    goals: [],
    causes: [],
    stressFrequency: '',
    dietQuality: '',
    meditationExperience: '',
    sleepQuality: '',
    happinessLevel: '',
  );
}
