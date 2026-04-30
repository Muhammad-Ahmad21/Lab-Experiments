import 'package:flutter/material.dart';
import 'package:mendly_1/screens/age_screen.dart';
import 'package:mendly_1/widgets/gender_option.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('2 / 10'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'What is your gender?',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Help us understand you better by selecting your gender.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 32),
              GenderOption(
                title: 'Male',
                icon: Icons.male,
                isSelected: _selectedGender == 'Male',
                onTap: () => setState(() => _selectedGender = 'Male'),
              ),
              const SizedBox(height: 12),
              GenderOption(
                title: 'Female',
                icon: Icons.female,
                isSelected: _selectedGender == 'Female',
                onTap: () => setState(() => _selectedGender = 'Female'),
              ),
              const SizedBox(height: 12),
              GenderOption(
                title: 'Prefer not to say',
                icon: Icons.person_outline,
                isSelected: _selectedGender == 'Prefer not to say',
                onTap: () =>
                    setState(() => _selectedGender = 'Prefer not to say'),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: _selectedGender != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AgeScreen(),
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
