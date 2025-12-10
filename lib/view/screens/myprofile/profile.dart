import 'dart:io';

import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/utils/validations/validations_metod%20(1).dart';
import 'package:carrental/view/screens/myprofile/editprofile.dart';
import 'package:carrental/view/screens/myprofile/profile_menu_item.dart';
import 'package:carrental/view/widgets/bottom_nav.dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/pass_field.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:carrental/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await Provider.of<UserController>(
        context,
        listen: false,
      ).getinfo();
    });
  }

  String safeText(String? text, [String defaultText = ""]) {
    return (text != null && text.isNotEmpty) ? text : defaultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 2),
      resizeToAvoidBottomInset: false,
      body: Consumer<UserController>(
        builder: (context, ctrl, child) {
          final myuser = ctrl.userModel;

          if (myuser == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  Assets.backgroungimage,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 550.h,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular( 30.r),
                        topRight: Radius.circular( 30.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 30.h),
                            Container(
                              width: 100.sp,
                              height: 100.sp,
                              padding: EdgeInsets.all(4.sp),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 212, 165, 10),
                                    Color.fromARGB(255, 245, 221, 2),
                                    Color.fromARGB(255, 35, 35, 34),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Container(
                                width: 100.sp,
                                height: 100.sp,
                                padding: EdgeInsets.all(3.sp),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: CircleAvatar(
                                  radius: 40.sp,
                                  backgroundImage: (myuser.image != null && myuser.image!.isNotEmpty)
                                      ? FileImage(File(myuser.image!)) as ImageProvider
                                      : AssetImage("assets/images/profileimag.png"),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            SmallText(
                              text: safeText(myuser.name),
                              size: 24.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            SmallText(
                              text: safeText(myuser.email, ""),
                              size: 14.sp,
                              color: Colors.black,
                            ),
                            SizedBox(height: 25.h),
                            SettingsMenuItem(
                              text: "Settings",
                              image: Assets.Setting,
                              onTap: () {},
                            ),
                            SettingsMenuItem(
                              text: "Billing Details",
                              image: Assets.billing,
                              onTap: () {},
                            ),
                            SettingsMenuItem(
                              text: "Edit Profile",
                              image: Assets.edit,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Editprofile(),
                                  ),
                                );
                              },
                            ),
                            SettingsMenuItem(
                              text: "Informations",
                              image: Assets.information,
                              onTap: () {},
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.w),
                              child: InkWell(
                                onTap: () {
                                  ctrl.logout();
                                  NavigatorUtils.navigateTosplashScreen(context);
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      Assets.logout,
                                      width: 37.w,
                                    ),
                                    SizedBox(width: 16.w),
                                    SmallText(
                                      text: "LogOut",
                                      size: 18.sp,
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
