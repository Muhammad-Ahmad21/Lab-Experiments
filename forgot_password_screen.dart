import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_models/auth_view_model.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  late final TextEditingController _emailCtrl;

  @override
  void initState() {
    super.initState();
    _emailCtrl = TextEditingController(text: 'andrew.ainsley@yourdomain.com');
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);
    ref.listen<AuthState>(authViewModelProvider, (prev, next) {
      if (next.isSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('OTP sent to your email!')),
        );
        Navigator.pop(context);
        ref.read(authViewModelProvider.notifier).resetSuccess();
      }
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Forgot Your Password?')),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 30.h),
            Text(
              "Enter the email address associated with your Mendly account. We'll send you a one-time password (OTP) to reset your password.",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
            SizedBox(height: 30.h),
            TextField(
              controller: _emailCtrl,
              decoration: const InputDecoration(
                hintText: 'Your Registered Email',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: authState.isLoading
                  ? null
                  : () => ref
                        .read(authViewModelProvider.notifier)
                        .forgotPassword(_emailCtrl.text.trim()),
              child: authState.isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text('Send OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
