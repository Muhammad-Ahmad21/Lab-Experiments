import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/user_profile.dart';

class NameStep extends StatelessWidget {
  final UserProfile profile;
  final ValueChanged<UserProfile> onUpdate;

  const NameStep({super.key, required this.profile, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController(text: profile.name);

    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'What should we call you?',
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            'First things first, what should we call you?',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
          SizedBox(height: 40.h),
          TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Andrew'),
            onChanged: (val) => onUpdate(
              UserProfile(
                name: val,
                gender: profile.gender,
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
        ],
      ),
    );
  }
}
