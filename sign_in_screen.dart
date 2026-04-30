import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes.dart';
import '../../view_models/auth_view_model.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _remember = false;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    ref.listen<AuthState>(authViewModelProvider, (prev, next) {
      if (next.isSuccess) {
        Navigator.pushReplacementNamed(context, Routes.profileSetup);
        ref.read(authViewModelProvider.notifier).resetSuccess();
      }
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Welcome Back!')),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30.h),
            Text(
              'Sign in to Continue Your Wellness Journey',
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
            SizedBox(height: 30.h),
            TextField(
              controller: _emailCtrl,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            SizedBox(height: 16.h),
            TextField(
              controller: _passCtrl,
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Checkbox(
                  value: _remember,
                  onChanged: (v) => setState(() => _remember = v ?? false),
                ),
                const Text('Remember me'),
                const Spacer(),
                TextButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, Routes.forgotPassword),
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: authState.isLoading
                  ? null
                  : () {
                      if (_emailCtrl.text.isEmpty || _passCtrl.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all fields'),
                          ),
                        );
                        return;
                      }
                      ref
                          .read(authViewModelProvider.notifier)
                          .signIn(
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
                  : const Text('Sign in'),
            ),
            SizedBox(height: 20.h),
            const Center(child: Text('or continue with')),
            // social buttons (optional)
          ],
        ),
      ),
    );
  }
}
