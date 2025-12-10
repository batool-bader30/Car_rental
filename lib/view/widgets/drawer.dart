import 'dart:io';
import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/view/screens/aboutus.dart';
import 'package:carrental/view/screens/contactus.dart';
import 'package:carrental/view/screens/myprofile/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var userModel = Provider.of<UserController>(context).userModel;
    String userName = userModel?.name ?? "Guest";

    return Align(
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.horizontal(
          right: Radius.circular(30.r),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 220.h,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.only(bottom: 20.h, top: 0),
                  accountName: Text(
                    userName,
                    style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text(
                    userModel?.email ?? '',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  currentAccountPicture: CircleAvatar(
                    radius: 50.r,
                    backgroundImage: (userModel != null &&
                            userModel.image != null &&
                            userModel.image!.isNotEmpty)
                        ? FileImage(File(userModel.image!)) as ImageProvider
                        : AssetImage("assets/images/profileimag.png"),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person, size: 24.h),
                title: Text('Profile', style: TextStyle(fontSize: 16.sp)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Profilepage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline, size: 24.h),
                title: Text('Contact Us', style: TextStyle(fontSize: 16.sp)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ContactUs()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.lightbulb, size: 24.h),
                title: Text('About Us', style: TextStyle(fontSize: 16.sp)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => Aboutus()),
                  );
                },
              ),
              Spacer(),
              Divider(thickness: 1.h),
              ListTile(
                leading: Icon(Icons.logout, size: 24.h),
                title: Text('Logout', style: TextStyle(fontSize: 16.sp)),
                onTap: () {
                  Provider.of<UserController>(context, listen: false).logout();
                  NavigatorUtils.navigateTosplashScreen(context);
                },
              ),
              SizedBox(height: 30.h)
            ],
          ),
        ),
      ),
    );
  }
}
