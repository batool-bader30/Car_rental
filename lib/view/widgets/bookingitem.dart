import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carrental/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookingItem extends StatelessWidget {
  final BookingModel booking;

  const BookingItem({super.key, required this.booking});

  Color getStatusColor(bool status) {
    return status ? Colors.green : Colors.red;
  }

  String getStatusText(bool status) {
    return status ? "Yes" : "No";
  }

  // جلب بيانات السيارة من كولكشن cars
  Future<Map<String, dynamic>?> getCarData(String carId) async {
    final doc = await FirebaseFirestore.instance.collection("cars").doc(carId).get();
    return doc.data();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getCarData(booking.carId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: 100.h,
            child: const Center(child: CircularProgressIndicator()),
          );
        }

        final carData = snapshot.data!;
        final carImage = carData["imageUrl"];
        final carName = carData["name"];

        return Container(
          padding: EdgeInsets.all(14.w),
          margin: EdgeInsets.only(bottom: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(30),
                blurRadius: 5.r,
                spreadRadius: 1.r,
              ),
            ],
          ),
          child: Row(
            children: [
              // صورة السيارة
              Container(
                width: 110.w,
                height: 70.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: DecorationImage(
                    image: NetworkImage(carImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 14.w),

              // معلومات الحجز
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Text(
                      "\$${booking.totalprice}",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),

                    SizedBox(height: 6.h),

                    Row(
                      children: [
                        Text(
                          "Paid: ",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Text(
                          getStatusText(booking.ispaid),
                          style: TextStyle(
                            color: getStatusColor(booking.ispaid),
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          "Received: ",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Text(
                          "No",
                          style: TextStyle(
                            color: getStatusColor(false),
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Text(
                          "Booking Date: ",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        Text(
                          "${booking.date}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
