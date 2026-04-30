class UserData {
  final String? name;
  final String? email;
  final String? gender;
  final int? age;
  final List<String>? goals;
  final List<String>? causes;
  final String? stressFrequency;
  final String? eatingHabits;
  final String? meditationExperience;
  final String? sleepQuality;
  final String? happinessLevel;

  UserData({
    this.name,
    this.email,
    this.gender,
    this.age,
    this.goals,
    this.causes,
    this.stressFrequency,
    this.eatingHabits,
    this.meditationExperience,
    this.sleepQuality,
    this.happinessLevel,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'gender': gender,
      'age': age,
      'goals': goals,
      'causes': causes,
      'stressFrequency': stressFrequency,
      'eatingHabits': eatingHabits,
      'meditationExperience': meditationExperience,
      'sleepQuality': sleepQuality,
      'happinessLevel': happinessLevel,
    };
  }

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      name: json['name'],
      email: json['email'],
      gender: json['gender'],
      age: json['age'],
      goals: List<String>.from(json['goals'] ?? []),
      causes: List<String>.from(json['causes'] ?? []),
      stressFrequency: json['stressFrequency'],
      eatingHabits: json['eatingHabits'],
      meditationExperience: json['meditationExperience'],
      sleepQuality: json['sleepQuality'],
      happinessLevel: json['happinessLevel'],
    );
  }

  UserData copyWith({
    String? name,
    String? email,
    String? gender,
    int? age,
    List<String>? goals,
    List<String>? causes,
    String? stressFrequency,
    String? eatingHabits,
    String? meditationExperience,
    String? sleepQuality,
    String? happinessLevel,
  }) {
    return UserData(
      name: name ?? this.name,
      email: email ?? this.email,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      goals: goals ?? this.goals,
      causes: causes ?? this.causes,
      stressFrequency: stressFrequency ?? this.stressFrequency,
      eatingHabits: eatingHabits ?? this.eatingHabits,
      meditationExperience: meditationExperience ?? this.meditationExperience,
      sleepQuality: sleepQuality ?? this.sleepQuality,
      happinessLevel: happinessLevel ?? this.happinessLevel,
    );
  }
}
