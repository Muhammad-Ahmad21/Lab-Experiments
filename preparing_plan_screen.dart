import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../routes.dart';

class PreparingPlanScreen extends StatefulWidget {
  const PreparingPlanScreen({super.key});

  @override
  State<PreparingPlanScreen> createState() => _PreparingPlanScreenState();
}

class _PreparingPlanScreenState extends State<PreparingPlanScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.network(
              'https://assets2.lottiefiles.com/packages/lf20_puciaact.json', // free loading animation
              width: 200.w,
              height: 200.w,
            ),
            SizedBox(height: 30.h),
            Text(
              'Preparing personalized plan for you...\nPlease wait...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.sp, color: Colors.grey),
            ),
            SizedBox(height: 10.h),
            Text(
              'This will just take a moment. Get ready for an amazing well-being experience.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
