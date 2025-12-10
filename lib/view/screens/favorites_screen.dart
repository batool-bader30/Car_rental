import 'package:carrental/controllers/car_provider.dart';
import 'package:carrental/controllers/favorite_provider.dart';
import 'package:carrental/view/screens/car_details_screen.dart';
import 'package:carrental/view/widgets/bottom_nav.dart';
import 'package:carrental/view/widgets/car_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fav = Provider.of<FavoriteProvider>(context);
    final carProv = Provider.of<CarProvider>(context);

    final favList = fav.favorite;

    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: SizedBox.shrink(),
        title: Text(
          "Favorite Cars",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        toolbarHeight: 70.h,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: fav.favorite.isEmpty
          ? Center(
              child: Text(
                "No Favorite cars yet",
                style: TextStyle(fontSize: 16.sp),
              ),
            )
          : Padding(
              padding: EdgeInsets.all(16.w),
              child: ListView.builder(
                itemCount: favList.length,
                itemBuilder: (ctx, i) {
                  final favItem = fav.favorite[i];
                  final matchingCars = carProv.cars
                      .where((c) => c.id == favItem.carId)
                      .toList();

                  if (matchingCars.isEmpty) {
                    return SizedBox.shrink();
                  }
                  final car = matchingCars.first;

                  return Padding(
                    padding: EdgeInsets.only(bottom: 14.h),
                    child: CarItem(car: car, isfav: 1),
                  );
                },
              ),
            ),
    );
  }
}
