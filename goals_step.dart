import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/user_profile.dart';

class GoalsStep extends StatefulWidget {
  final UserProfile profile;
  final ValueChanged<UserProfile> onUpdate;
  const GoalsStep({super.key, required this.profile, required this.onUpdate});

  @override
  State<GoalsStep> createState() => _GoalsStepState();
}

class _GoalsStepState extends State<GoalsStep> {
  late List<String> selected;
  final allGoals = [
    'Manage Anxiety',
    'Reduce Stress',
    'Improve Mood',
    'Improve Sleep',
    'Enhance Relationships',
    'Boost Confidence',
  ];

  @override
  void initState() {
    super.initState();
    selected = List.from(widget.profile.goals);
  }

  void _toggle(String goal) {
    setState(() {
      if (selected.contains(goal)) {
        selected.remove(goal);
      } else {
        selected.add(goal);
      }
      widget.onUpdate(
        UserProfile(
          name: widget.profile.name,
          gender: widget.profile.gender,
          age: widget.profile.age,
          goals: selected,
          causes: widget.profile.causes,
          stressFrequency: widget.profile.stressFrequency,
          dietQuality: widget.profile.dietQuality,
          meditationExperience: widget.profile.meditationExperience,
          sleepQuality: widget.profile.sleepQuality,
          happinessLevel: widget.profile.happinessLevel,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'What is your main goals?',
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            'Select the option that best represents what you\'re hoping to achieve.',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
          SizedBox(height: 30.h),
          ...allGoals.map(
            (goal) => CheckboxListTile(
              title: Text(goal),
              value: selected.contains(goal),
              onChanged: (_) => _toggle(goal),
            ),
          ),
        ],
      ),
    );
  }
}
