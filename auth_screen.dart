import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes.dart';
import '../../widgets/social_button.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60.h),
            Text(
              "Let's Get Started!",
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            Text(
              "Let's dive in into your account",
              style: TextStyle(fontSize: 16.sp, color: Colors.grey),
            ),
            SizedBox(height: 50.h),
            SocialButton(
              icon: Icons.g_mobiledata, // Google
              label: 'Continue with Google',
              onPressed: () {},
            ),
            SizedBox(height: 12.h),
            SocialButton(
              icon: Icons.apple, // Apple
              label: 'Continue with Apple',
              onPressed: () {},
            ),
            SizedBox(height: 12.h),
            SocialButton(
              icon: Icons.facebook, // Facebook
              label: 'Continue with Facebook',
              onPressed: () {},
            ),
            SizedBox(height: 12.h),
            SocialButton(
              icon: Icons.close, // X (Twitter)
              label: 'Continue with X',
              onPressed: () {},
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.signUp),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                    ),
                  ),
                ),
                SizedBox(width: 40.w),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.signIn),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              'Privacy Policy · Terms of Service',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
