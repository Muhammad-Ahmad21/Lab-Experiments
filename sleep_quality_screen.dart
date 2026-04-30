import 'package:flutter/material.dart';
import 'package:mendly_1/screens/happiness_screen.dart';
import 'package:mendly_1/widgets/selection_chip.dart';

class SleepQualityScreen extends StatefulWidget {
  const SleepQualityScreen({super.key});

  @override
  State<SleepQualityScreen> createState() => _SleepQualityScreenState();
}

class _SleepQualityScreenState extends State<SleepQualityScreen> {
  String? _selectedQuality;

  final List<String> _qualities = [
    'Very Poor',
    'Poor',
    'Average',
    'Good',
    'Excellent',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('9 / 10'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How would you rate your level of sleep quality overall?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Understanding your sleep quality helps us provide personalized support.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ..._qualities.map(
                (quality) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SelectionChip(
                    label: quality,
                    isSelected: _selectedQuality == quality,
                    onTap: () => setState(() => _selectedQuality = quality),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _selectedQuality != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HappinessScreen(),
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
