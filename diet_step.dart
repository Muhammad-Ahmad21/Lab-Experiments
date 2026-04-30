import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/user_profile.dart';

class DietStep extends StatelessWidget {
  final UserProfile profile;
  final ValueChanged<UserProfile> onUpdate;
  const DietStep({super.key, required this.profile, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    final options = [
      'Always',
      'Most of the time',
      'Sometimes',
      'Rarely',
      'Never',
    ];
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'How often did you feel stressed or anxious in the last 12 months?',
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            'In the past year, how often have you experienced feelings of stress or anxiety?',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
          SizedBox(height: 30.h),
          ...options.map(
            (opt) => RadioListTile<String>(
              title: Text(opt),
              value: opt,
              groupValue: profile.dietQuality,
              onChanged: (val) => onUpdate(
                UserProfile(
                  name: profile.name,
                  gender: profile.gender,
                  age: profile.age,
                  goals: profile.goals,
                  causes: profile.causes,
                  stressFrequency: profile.stressFrequency,
                  dietQuality: val!,
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
