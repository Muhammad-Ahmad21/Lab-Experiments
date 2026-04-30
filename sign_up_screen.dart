import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes.dart';
import '../../view_models/auth_view_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    ref.listen<AuthState>(authViewModelProvider, (prev, next) {
      if (next.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Account created! Please sign in.')),
        );
        Navigator.pushReplacementNamed(context, Routes.signIn);
        ref.read(authViewModelProvider.notifier).resetSuccess();
      }
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Join Mindify Today')),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.h),
            TextField(
              controller: _emailCtrl,
              decoration: const InputDecoration(hintText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: _passCtrl,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Checkbox(
                  value: _agreed,
                  onChanged: (v) => setState(() => _agreed = v ?? false),
                ),
                const Expanded(
                  child: Text('I agree to Mindify Terms & Conditions.'),
                ),
              ],
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: authState.isLoading
                  ? null
                  : () {
                      if (_emailCtrl.text.isEmpty ||
                          _passCtrl.text.isEmpty ||
                          !_agreed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Fill all fields and accept terms'),
                          ),
                        );
                        return;
                      }
                      ref
                          .read(authViewModelProvider.notifier)
                          .signUp(
                            _emailCtrl.text.trim(),
                            _passCtrl.text.trim(),
                          );
                    },
              child: authState.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Sign up'),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () =>
                      Navigator.pushReplacementNamed(context, Routes.signIn),
                  child: const Text('Sign in'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Center(child: Text('or continue with')),
            SizedBox(height: 16.h),
            // social buttons if needed, but optional
          ],
        ),
      ),
    );
  }
}
