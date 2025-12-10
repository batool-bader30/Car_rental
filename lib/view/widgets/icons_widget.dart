import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;

  const IconWidget({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 40.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color.fromARGB(255, 211, 210, 210).withOpacity(0.4),
          width: 1.2.w,
        ),
        color: Colors.white.withOpacity(0.4),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 20.sp,
        ),
      ),
    );
  }
}
