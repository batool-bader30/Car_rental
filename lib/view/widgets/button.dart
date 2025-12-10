import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final VoidCallback? ontap;

  const Button({
    super.key,
    required this.title,
    required this.ontap,
    this.height = 50,
    this.width = 330,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!.h,
      width: width!.w,
      child: Material(
        color: const Color(0xFFEBB739), // اللون ثابت
        borderRadius: BorderRadius.circular(10.r),
        child: InkWell(
          onTap: ontap,
          borderRadius: BorderRadius.circular(10.r),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
