import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_models/home_view_model.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mood = ref.watch(homeViewModelProvider).todayMood;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How do you feel today?',
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => ref
                        .read(homeViewModelProvider.notifier)
                        .setMood('Not Good'),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      decoration: BoxDecoration(
                        color: mood == 'Not Good'
                            ? Colors.red.shade50
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: mood == 'Not Good'
                              ? Colors.red
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.sentiment_dissatisfied,
                            size: 50.sp,
                            color: Colors.red,
                          ),
                          SizedBox(height: 10.h),
                          Text('Not Good', style: TextStyle(fontSize: 18.sp)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () => ref
                        .read(homeViewModelProvider.notifier)
                        .setMood('Good'),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 30.h),
                      decoration: BoxDecoration(
                        color: mood == 'Good'
                            ? Colors.green.shade50
                            : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: mood == 'Good'
                              ? Colors.green
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.sentiment_satisfied,
                            size: 50.sp,
                            color: Colors.green,
                          ),
                          SizedBox(height: 10.h),
                          Text('Good', style: TextStyle(fontSize: 18.sp)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            if (mood != null)
              Text(
                mood == 'Good' ? 'I Feel Good!' : 'I Feel Not Good!',
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
            SizedBox(height: 40.h),
            Text(
              'Gain Insights and Track Progress Overtime',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10.h),
            Text(
              'Gain valuable insights into your well-being with mood tracking, growth area reports, and life balance graphs overtime.',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
            // Placeholder charts/insights area
            const Spacer(),
            // You can later add graphs here
          ],
        ),
      ),
    );
  }
}
