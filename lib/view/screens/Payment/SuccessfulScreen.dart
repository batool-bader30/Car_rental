import 'package:carrental/models/booking_model.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuccessfulScreen extends StatelessWidget {
  final BookingModel bookingModel;
  const SuccessfulScreen({super.key, required this.bookingModel});

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
                  SizedBox(height: 130.h),
                  BoldText(text: "Successful!", size: 40.sp, color: Colors.white),
                  SizedBox(height: 30.h),
                  Image.asset(Assets.successicon, height: 120.h),
                  SizedBox(height: 50.h),
                  BoldText(
                    text: "${bookingModel.carName}",
                    color: Colors.white,
                  ),
                  SizedBox(height: 5.h),
                  MediumText(
                    text: " renting has been Successful!",
                    color: Colors.white,
                  ),
                  SizedBox(height: 5.h),
                  BoldText(
                    text: "Happy Riding.",
                    color: Colors.white,
                    size: 22.sp,
                  ),
                  Spacer(),
                  Button(
                    title: "Go Back To Home",
                    ontap: () {
                      NavigatorUtils.navigateToHomeScreen(context);
                    },
                  ),
                  SizedBox(height: 15.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
