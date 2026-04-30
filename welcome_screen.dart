import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/wellness_bg.png',
            ), // optional background
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Text(
              'Dive and Explore Your Path to Wellness',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'Explore meditation exercises, breathing techniques, articles, courses, journals, and mindfulness resources to find your center.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp, color: Colors.white70),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, Routes.auth),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.teal,
              ),
              child: const Text('Get Started'),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
