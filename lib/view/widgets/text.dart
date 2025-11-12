import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BoldText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;

  const BoldText({super.key, this.color, required this.text, this.size=22});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size!.sp,
        fontWeight: FontWeight.bold,
        color: color ?? Colors.black,
      ),
    );
  }
}

class MediumText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  
  

  const MediumText({
    super.key,
    this.color,
    required this.text,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }
}


class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? size;
  final TextAlign? align;
  const SmallText({
    super.key,
    this.color,
    required this.text,
    this.fontWeight,
    this.size,
    this.align = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
        fontSize: size ?? 16.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
        color: color ?? Color(0xff6B7280),
      ),
    );
  }
}
