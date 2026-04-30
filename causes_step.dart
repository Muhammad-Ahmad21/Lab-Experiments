import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/user_profile.dart';

class CausesStep extends StatefulWidget {
  final UserProfile profile;
  final ValueChanged<UserProfile> onUpdate;
  const CausesStep({super.key, required this.profile, required this.onUpdate});

  @override
  State<CausesStep> createState() => _CausesStepState();
}

class _CausesStepState extends State<CausesStep> {
  late List<String> selected;
  final allCauses = [
    'Work/school',
    'Relationships',
    'Finances',
    'Health Concerns',
    'Life Changes',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    selected = List.from(widget.profile.causes);
  }

  void _toggle(String cause) {
    setState(() {
      if (selected.contains(cause))
        selected.remove(cause);
      else
        selected.add(cause);
      widget.onUpdate(
        UserProfile(
          name: widget.profile.name,
          gender: widget.profile.gender,
          age: widget.profile.age,
          goals: widget.profile.goals,
          causes: selected,
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
            'What causes your mental health issues?',
            style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.h),
          Text(
            'What factors contribute to your mental health issues?',
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
          SizedBox(height: 30.h),
          ...allCauses.map(
            (c) => CheckboxListTile(
              title: Text(c),
              value: selected.contains(c),
              onChanged: (_) => _toggle(c),
            ),
          ),
        ],
      ),
    );
  }
}
