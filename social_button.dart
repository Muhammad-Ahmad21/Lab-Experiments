import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialButton extends StatelessWidget {
  final IconData icon; // 👈 IconData
  final String label;
  final VoidCallback onPressed;
  final Color? iconColor;

  const SocialButton({
    super.key,
    required this.icon, // 👈 required icon
    required this.label,
    required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 50.h),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 24.sp,
            color: iconColor ?? Colors.black87,
          ), // 👈 Icon widget
          SizedBox(width: 12.w),
          Flexible(
            child: Text(
              label,
              style: TextStyle(fontSize: 16.sp, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}
