import 'package:carrental/view/screens/home_screen.dart';
import 'package:carrental/view/screens/myprofile/profile.dart';
import 'package:flutter/material.dart';
import 'package:carrental/view/screens/favorites_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
  decoration: BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40.h),
      topRight: Radius.circular(40.h),
    ),
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => HomeScreen()),
          );
        },
        child: Icon(Icons.home,
            color: selectedIndex == 0 ? Colors.amber : Colors.white,
            size: 30.h),
      ),
      SizedBox(width: 55.w),

      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => FavoritesScreen()),
          );
        },
        child: Icon(Icons.favorite,
            color: selectedIndex == 1 ? Colors.amber : Colors.white,
            size: 30.h),
      ),
      SizedBox(width: 55.w),

      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Profilepage()),
          );
        },
        child: Icon(Icons.person,
            color: selectedIndex == 2 ? Colors.amber : Colors.white,
            size: 30.h),
      ),
      SizedBox(width: 55.w),

      Icon(Icons.history_outlined,
          color: selectedIndex == 3 ? Colors.amber : Colors.white,
          size: 30.h),
    ],
  ),
);

  }
}
