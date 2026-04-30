import 'package:flutter/material.dart';
import 'package:mendly_1/screens/sleep_quality_screen.dart';
import 'package:mendly_1/widgets/selection_chip.dart';

class MeditationExperienceScreen extends StatefulWidget {
  const MeditationExperienceScreen({super.key});

  @override
  State<MeditationExperienceScreen> createState() =>
      _MeditationExperienceScreenState();
}

class _MeditationExperienceScreenState
    extends State<MeditationExperienceScreen> {
  String? _selectedExperience;

  final List<String> _experiences = [
    'Yes, regularly',
    'Yes, occasionally',
    'Yes, a long time ago',
    'No, I have never tried meditation',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('8 / 10'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Have you ever tried meditation before?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Have you ever practiced meditation or mindfulness techniques before?',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ..._experiences.map(
                (exp) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SelectionChip(
                    label: exp,
                    isSelected: _selectedExperience == exp,
                    onTap: () => setState(() => _selectedExperience = exp),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _selectedExperience != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SleepQualityScreen(),
                          ),
                        );
                      }
                    : null,
                child: const Text('Continue'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
