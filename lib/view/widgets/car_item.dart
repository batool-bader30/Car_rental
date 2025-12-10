import 'package:carrental/controllers/favorite_provider.dart';
import 'package:carrental/view/screens/car_details_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../models/car_model.dart';

class CarItem extends StatelessWidget {
  final CarModel car;
  final isfav;

  const CarItem({super.key, required this.car, this.isfav = 0});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => CarDetailsScreen(car: car)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(30),
              blurRadius: 5.r,
              spreadRadius: 2.r,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 110.w,
              height: 70.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                image: DecorationImage(
                  image: NetworkImage(car.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(width: 14.w),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  car.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                  ),
                ),

                SizedBox(height: 10.h),

                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange[700],
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    "\$${car.price} / day",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            isfav != 0
                ? InkWell(
                    onTap: () {
                      fav.toggleFavorites(
                          car.id, FirebaseAuth.instance.currentUser!.uid);
                    },
                    child: Icon(
                      fav.isFavorite(
                              car.id, FirebaseAuth.instance.currentUser!.uid)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: fav.isFavorite(
                              car.id, FirebaseAuth.instance.currentUser!.uid)
                          ? Colors.red
                          : Colors.black,
                      size: 28.h,
                    ),
                  )
                : Text("")
          ],
        ),
      ),
    );
  }
}
