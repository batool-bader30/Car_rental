import 'dart:math';
import 'package:carrental/models/booking_model.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PayLaterSuccessfulScreen extends StatelessWidget {
  final BookingModel bookingModel;
  const PayLaterSuccessfulScreen({super.key, required this.bookingModel});

  String generateInvoiceNumber() {
    final random = Random();
    int number = random.nextInt(900000) + 100000;
    return "INV-$number";
  }

  @override
  Widget build(BuildContext context) {
    final invoiceNumber = generateInvoiceNumber();

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
                  BoldText(
                    text: "Booking Confirmed!",
                    size: 30.sp,
                    color: Colors.white,
                  ),
                  SizedBox(height: 30.h),
                  Image.asset(Assets.successicon, height: 120.h),
                  SizedBox(height: 50.h),
                  BoldText(
                    text: bookingModel.carName,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5.h),
                  SmallText(
                    text: "Your booking has been successfully completed.",
                    color: Colors.white,
                    size: 16,
                  ),
                  SizedBox(height: 10.h),
                  MediumText(
                    text: "Payment: Pay Later",
                    color: Colors.white,
                  ),
                  SizedBox(height: 10.h),
                  BoldText(
                    text: "Invoice Number:",
                    color: Colors.white,
                    size: 20.sp,
                  ),
                  MediumText(
                    text: invoiceNumber,
                    color: Colors.white,
                  ),
                  Spacer(),
                  Button(
                    title: "Back to Home",
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
