import 'package:flutter/material.dart';
import 'package:mendly_1/screens/sign_in_screen.dart';
import 'package:mendly_1/screens/sign_up_screen.dart';
import 'package:mendly_1/widgets/social_button.dart';

class LetsGetStartedScreen extends StatelessWidget {
  const LetsGetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Let's Get Started!",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Let's dive in into your account",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              SocialButton(
                icon: Icons.g_mobiledata,
                label: 'Continue with Google',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SocialButton(
                icon: Icons.apple,
                label: 'Continue with Apple',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SocialButton(
                icon: Icons.facebook,
                label: 'Continue with Facebook',
                onTap: () {},
              ),
              const SizedBox(height: 12),
              SocialButton(
                icon: Icons.bolt,
                label: 'Continue with X',
                onTap: () {},
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Text('  |  '),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
