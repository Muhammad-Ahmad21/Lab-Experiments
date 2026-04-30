import 'package:flutter/material.dart';
import 'package:mendly_1/screens/meditation_experience_screen.dart';
import 'package:mendly_1/widgets/selection_chip.dart';

class EatingHabitsScreen extends StatefulWidget {
  const EatingHabitsScreen({super.key});

  @override
  State<EatingHabitsScreen> createState() => _EatingHabitsScreenState();
}

class _EatingHabitsScreenState extends State<EatingHabitsScreen> {
  String? _selectedHabit;

  final List<String> _habits = [
    'Always',
    'Most of the time',
    'Sometimes',
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
        title: const Text('7 / 10'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Do you eat healthily?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'How would you describe your eating habits? Your diet can impact your mental well-being.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              ..._habits.map(
                (habit) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SelectionChip(
                    label: habit,
                    isSelected: _selectedHabit == habit,
                    onTap: () => setState(() => _selectedHabit = habit),
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _selectedHabit != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MeditationExperienceScreen(),
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
