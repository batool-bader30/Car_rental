import 'package:carrental/controllers/favorite_provider.dart';
import 'package:carrental/models/car_model.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:carrental/view/widgets/overview_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CarDetailsScreen extends StatelessWidget {
  final CarModel car;
  const CarDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: IconWidget(icon: Icons.arrow_back),
                  ),
                  Text(
                    "Car Details",
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      fav.toggleFavorites(car.id,FirebaseAuth.instance.currentUser!.uid);
                    },
                    child: Icon(
                      fav.isFavorite(car.id,FirebaseAuth.instance.currentUser!.uid)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: fav.isFavorite(car.id,FirebaseAuth.instance.currentUser!.uid) ? Colors.red : Colors.black,
                      size: 28.h,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.all(12.h),
              child: Container(
                height: 230.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  image: DecorationImage(
                    image: NetworkImage(car.imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal:  12.h),
              child: Text(
                car.name,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(10.h),
              child: Text(
                car.description,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.black,
                  height: 1.4.h,
                ),
              ),
            ),

            SizedBox(height: 16.h),

            Container(
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(18.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overview",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 16.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OverviewWidget(icon: Icons.speed, text: "350 km"),
                        OverviewWidget(icon: Icons.swap_vert, text: " Automatic"),
                      ],
                    ),

                    SizedBox(height: 10.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OverviewWidget(icon: Icons.local_gas_station, text: "Diesel"),
                        OverviewWidget(icon: Icons.event_seat, text: " 4 Seats"),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${car.price}/Day",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amberAccent,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                              horizontal: 38.w,
                              vertical: 13.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.r),
                            ),
                          ),
                          onPressed: () {
                            NavigatorUtils.navigateToDateTimeScreen(context, car);
                          },
                          child: Text(
                            "Book Car",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
