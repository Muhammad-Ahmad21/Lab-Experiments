import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes.dart';
import '../../view_models/profile_setup_view_model.dart';
import 'steps/age_step.dart';
import 'steps/causes_step.dart';
import 'steps/diet_step.dart';
import 'steps/gender_step.dart';
import 'steps/goals_step.dart';
import 'steps/happiness_step.dart';
import 'steps/meditation_step.dart';
import 'steps/name_step.dart';
import 'steps/sleep_quality_step.dart';
import 'steps/stress_frequency_step.dart';

class ProfileSetupScreen extends ConsumerWidget {
  const ProfileSetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(profileSetupViewModelProvider);
    final notifier = ref.read(profileSetupViewModelProvider.notifier);

    ref.listen<ProfileSetupState>(profileSetupViewModelProvider, (prev, next) {
      if (next.isCompleted) {
        Navigator.pushReplacementNamed(context, Routes.preparingPlan);
      }
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    final steps = <Widget>[
      NameStep(profile: state.profile, onUpdate: notifier.updateProfile),
      GenderStep(profile: state.profile, onUpdate: notifier.updateProfile),
      AgeStep(profile: state.profile, onUpdate: notifier.updateProfile),
      GoalsStep(profile: state.profile, onUpdate: notifier.updateProfile),
      CausesStep(profile: state.profile, onUpdate: notifier.updateProfile),
      StressFrequencyStep(
        profile: state.profile,
        onUpdate: notifier.updateProfile,
      ),
      DietStep(profile: state.profile, onUpdate: notifier.updateProfile),
      MeditationStep(profile: state.profile, onUpdate: notifier.updateProfile),
      SleepQualityStep(
        profile: state.profile,
        onUpdate: notifier.updateProfile,
      ),
      HappinessStep(profile: state.profile, onUpdate: notifier.updateProfile),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: state.currentStep > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: notifier.previousStep,
              )
            : const SizedBox(),
        title: Text('${state.currentStep + 1} / 10'),
      ),
      body: Column(
        children: [
          Expanded(child: steps[state.currentStep]),
          Padding(
            padding: EdgeInsets.all(24.w),
            child: Row(
              children: [
                if (state.currentStep > 0)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: notifier.previousStep,
                      child: const Text('Back'),
                    ),
                  )
                else
                  const Spacer(),
                SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: state.currentStep < 9
                        ? notifier.nextStep
                        : () => notifier.submitProfile(),
                    child: state.currentStep < 9
                        ? const Text('Continue')
                        : state.isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : const Text('Finish'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
