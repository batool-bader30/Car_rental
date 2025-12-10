import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(Assets.successfulScreen, fit: BoxFit.cover),
          ),
          Positioned(
            left: 10.w,
            top: 30.h,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: IconWidget(icon: Icons.arrow_back),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(22.w),
              child: Column(
                children: [
                  SizedBox(height: 160.h),
                  BoldText(text: "Contact Us", size: 40.sp, color: Colors.white),
                  SizedBox(height: 70.h),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        Text(
                          "Phone: +1 234 567 890",
                          style: TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Fax: +1 234 567 891",
                          style: TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Email: support@carrental.com",
                          style: TextStyle(color: Colors.white, fontSize: 20.sp),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
