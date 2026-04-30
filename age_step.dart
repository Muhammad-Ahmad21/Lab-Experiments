import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/user_profile.dart';

class AgeStep extends StatelessWidget {
  final UserProfile profile;
  final ValueChanged<UserProfile> onUpdate;
  const AgeStep({super.key, required this.profile, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'How old are you?',
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            'Your age helps us tailor our recommendations to you.',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
          SizedBox(height: 30.h),
          SizedBox(
            height: 200.h,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 50,
              diameterRatio: 1.5,
              onSelectedItemChanged: (index) {
                onUpdate(
                  UserProfile(
                    name: profile.name,
                    gender: profile.gender,
                    age: 25 + index, // starting from 25
                    goals: profile.goals,
                    causes: profile.causes,
                    stressFrequency: profile.stressFrequency,
                    dietQuality: profile.dietQuality,
                    meditationExperience: profile.meditationExperience,
                    sleepQuality: profile.sleepQuality,
                    happinessLevel: profile.happinessLevel,
                  ),
                );
              },
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 7, // 25–31
                builder: (context, index) => Center(
                  child: Text(
                    '${25 + index} years',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
