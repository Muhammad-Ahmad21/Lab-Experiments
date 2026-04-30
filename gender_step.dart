import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/user_profile.dart';

class GenderStep extends StatelessWidget {
  final UserProfile profile;
  final ValueChanged<UserProfile> onUpdate;

  const GenderStep({super.key, required this.profile, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    final options = ['Male', 'Female', 'Prefer not to say'];

    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'What is your gender?',
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            'Help us understand you better by selecting your gender.',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
          SizedBox(height: 40.h),
          ...options.map(
            (gender) => RadioListTile<String>(
              title: Text(gender),
              value: gender,
              groupValue: profile.gender,
              onChanged: (val) => onUpdate(
                UserProfile(
                  name: profile.name,
                  gender: val!,
                  age: profile.age,
                  goals: profile.goals,
                  causes: profile.causes,
                  stressFrequency: profile.stressFrequency,
                  dietQuality: profile.dietQuality,
                  meditationExperience: profile.meditationExperience,
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
