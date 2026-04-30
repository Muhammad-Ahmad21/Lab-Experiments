import 'package:flutter/material.dart';

import '../../../models/user_profile.dart';

class MeditationStep extends StatelessWidget {
  final UserProfile profile;
  final ValueChanged<UserProfile> onUpdate;
  const MeditationStep({
    super.key,
    required this.profile,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      'Yes, regularly',
      'Yes, occasionally',
      'Yes, a long time ago',
      'No, I have never tried meditation',
    ];
    return Padding(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'How often did you feel stressed or anxious in the last 12 months?',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            'In the past year, how often have you experienced feelings of stress or anxiety?',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 30),
          ...options.map(
            (opt) => RadioListTile<String>(
              title: Text(opt),
              value: opt,
              groupValue: profile.meditationExperience,
              onChanged: (val) => onUpdate(
                UserProfile(
                  name: profile.name,
                  gender: profile.gender,
                  age: profile.age,
                  goals: profile.goals,
                  causes: profile.causes,
                  stressFrequency: profile.stressFrequency,
                  dietQuality: profile.dietQuality,
                  meditationExperience: val!,
                  sleepQuality: profile.sleepQuality,
                  happinessLevel: profile.happinessLevel,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
