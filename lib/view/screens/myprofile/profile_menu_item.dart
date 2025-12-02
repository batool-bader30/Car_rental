import 'package:carrental/utils/constant/app_color.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsMenuItem extends StatelessWidget {
  const SettingsMenuItem({
    super.key,
    required this.text,
    required this.image,
    required this.onTap,
  });
  final String text;
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        width: screenWidth,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Row(
                children: [
                  Image.asset(
                    image,
                    width: 35.w,
                  ),
                  SizedBox(width: 16.w),
                  SmallText(
                    text: text,
                    size: 18.sp,
                  ),
                  Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: const Color.fromARGB(137, 49, 49, 49),
                    size: 18.sp,
                  ),
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
