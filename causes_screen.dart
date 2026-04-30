import 'package:flutter/material.dart';
import 'package:mendly_1/screens/stress_frequency_screen.dart';
import 'package:mendly_1/widgets/selection_chip.dart';

class CausesScreen extends StatefulWidget {
  const CausesScreen({super.key});

  @override
  State<CausesScreen> createState() => _CausesScreenState();
}

class _CausesScreenState extends State<CausesScreen> {
  final Set<String> _selectedCauses = {};

  final List<String> _causes = [
    'Work/school',
    'Relationships',
    'Finances',
    'Health Concerns',
    'Life Changes',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('5 / 10'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What causes your mental health issues?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'What factors contribute to your mental health issues? (select all that apply).',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  itemCount: _causes.length,
                  itemBuilder: (context, index) {
                    final cause = _causes[index];
                    final isSelected = _selectedCauses.contains(cause);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: SelectionChip(
                        label: cause,
                        isSelected: isSelected,
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              _selectedCauses.remove(cause);
                            } else {
                              _selectedCauses.add(cause);
                            }
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _selectedCauses.isNotEmpty
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StressFrequencyScreen(),
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
