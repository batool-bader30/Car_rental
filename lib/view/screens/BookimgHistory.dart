import 'package:carrental/controllers/booking_provider.dart';
import 'package:carrental/models/booking_model.dart';
import 'package:carrental/view/widgets/bookingitem.dart';
import 'package:carrental/view/widgets/bottom_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser!.uid;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 3),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
          "Booking History",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 70.h,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Consumer<BookingProvider>(
        builder: (context, bookingProvider, _) {
          return StreamBuilder<List<BookingModel>>(
            stream: bookingProvider.getBookingsStream(uid),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: CircularProgressIndicator());
              }

              final bookings = snapshot.data!;

              if (bookings.isEmpty) {
                return Center(
                  child: Text(
                    "No bookings found.",
                    style: TextStyle(fontSize: 16.sp),
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(14.w),
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  return BookingItem(booking: bookings[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
