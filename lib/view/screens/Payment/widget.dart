import 'package:carrental/controllers/patment_provider.dart';
import 'package:carrental/models/booking_model.dart';
import 'package:carrental/utils/constant/app_color.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/view/screens/Payment/PayLater.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodsScreen extends StatelessWidget {
  final BookingModel bookingModel;
  const PaymentMethodsScreen({super.key, required this.bookingModel});

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentProvider>(
      builder: (context, provider, _) {
        return ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: provider.paymentMethods.length,
          itemBuilder: (context, index) {
            bool isSelected = provider.selectedIndex == index;
            return GestureDetector(
              onTap: () {
                provider.selectPaymentMethod(index);
                if (provider.selectedIndex == 1) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PayLaterSuccessfulScreen(bookingModel: bookingModel),
                    ),
                  );
                }
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 8.h),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 4.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      index == 0 ? Assets.card : Assets.cash,
                      height: 26.h,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Text(
                        provider.paymentMethods[index],
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Color(0xff0F0E0E),
                        ),
                      ),
                    ),
                    Container(
                      width: 24.w,
                      height: 24.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? AppColor.amber
                                    : Colors.grey,
                                width: 1.w,
                              ),
                              color: Colors.transparent,
                            ),
                          ),
                          Container(
                            width: 12.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? AppColor.amber
                                    : Colors.grey,
                                width: 1.w,
                              ),
                              color: isSelected ? AppColor.amber : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
