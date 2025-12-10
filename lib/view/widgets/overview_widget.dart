import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OverviewWidget extends StatelessWidget {
  final IconData icon;
  final String text;

  const OverviewWidget({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 60.h,
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.white54,
          width: 2.w,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 20.sp,
            color: Colors.white,
          ),
          SizedBox(width: 10.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
