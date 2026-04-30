import 'package:flutter/material.dart';
import 'package:mendly_1/screens/eating_habits_screen.dart';
import 'package:mendly_1/widgets/selection_chip.dart';

class StressFrequencyScreen extends StatefulWidget {
  const StressFrequencyScreen({super.key});

  @override
  State<StressFrequencyScreen> createState() => _StressFrequencyScreenState();
}

class _StressFrequencyScreenState extends State<StressFrequencyScreen> {
  String? _selectedFrequency;

  final List<String> _frequencies = [
    'Almost Daily',
    'Frequently',
    'Occasionally',
    'Rarely',
    'Never',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('6 / 10'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How often did you feel stressed or anxious in the last 12 months?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'In the past year, how often have you experienced feelings of stress or anxiety?',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ..._frequencies.map(
                (freq) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SelectionChip(
                    label: freq,
                    isSelected: _selectedFrequency == freq,
                    onTap: () => setState(() => _selectedFrequency = freq),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _selectedFrequency != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EatingHabitsScreen(),
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
