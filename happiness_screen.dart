import 'package:flutter/material.dart';
import 'package:mendly_1/screens/preparing_plan_screen.dart';
import 'package:mendly_1/widgets/selection_chip.dart';

class HappinessScreen extends StatefulWidget {
  const HappinessScreen({super.key});

  @override
  State<HappinessScreen> createState() => _HappinessScreenState();
}

class _HappinessScreenState extends State<HappinessScreen> {
  String? _selectedHappiness;

  final List<String> _happinessLevels = [
    'Very Unhappy',
    'Unhappy',
    'Neutral',
    'Happy',
    'Very Happy',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('10 / 10'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How would you rate your level of happiness overall?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Understanding your happiness helps us provide personalized support.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ..._happinessLevels.map(
                (level) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SelectionChip(
                    label: level,
                    isSelected: _selectedHappiness == level,
                    onTap: () => setState(() => _selectedHappiness = level),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _selectedHappiness != null
                    ? () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PreparingPlanScreen(),
                          ),
                        );
                      }
                    : null,
                child: const Text('Finish'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
