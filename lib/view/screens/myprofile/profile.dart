import 'dart:io';

import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/utils/validations/validations_metod%20(1).dart';
import 'package:carrental/view/screens/myprofile/editprofile.dart';
import 'package:carrental/view/screens/myprofile/profile_menu_item.dart';
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

  // دالة لمراجعة النصوص لتجنب Null
  String safeText(String? text, [String defaultText = ""]) {
    return (text != null && text.isNotEmpty) ? text : defaultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<UserController>(
        builder: (context, ctrl, child) {
          final myuser = ctrl.userModel;

            // إذا البيانات لم تصل بعد
            if (myuser == null) {
              return const Center(child: CircularProgressIndicator());
            }
          return Stack(
            children: [
              Image.asset(Assets.backgroungimage, fit: BoxFit.fill),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Container(
                    height: 630,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    
                      SizedBox(height: 40.h),

                      // الصورة
                  Container(
  width: 110.sp,
  height: 110.sp,
  padding: EdgeInsets.all(3.sp), // سمك الإطار
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
      colors: [
        const Color.fromARGB(255, 94, 87, 64),
        const Color.fromARGB(255, 0, 0, 0),
        const Color.fromARGB(255, 239, 234, 185),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: ClipOval(
    child: Container(
      color: Colors.white, // هذا اللون يظهر بين التدرج والصورة
      child: CircleAvatar(
        radius: 45.sp,
        backgroundImage: (myuser.image != null && myuser.image!.isNotEmpty)
            ? FileImage(File(myuser.image!)) as ImageProvider
            : const AssetImage("assets/images/profileimag.png"),
      ),
    ),
  ),
),

                      SizedBox(height: 5.h),

                      // الاسم
                      SmallText(
                        text: safeText(myuser.name),
                        size: 24.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),

                      // رقم الهاتف
                      SmallText(
                        text: safeText(myuser.email, ""),
                        size: 14.sp,
                        color: Colors.black,
                      ),

                      SizedBox(height: 25.h),

                      // قائمة الخيارات
                      SettingsMenuItem(
                        text: "Settings",
                        image: Assets.Setting,
                        onTap: () {
                          // مثال لو تحبين تفعلي الانتقال للصفحة
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Profileinfopage(inprofile: true),
                          //   ),
                          // );
                        },
                      ),
                      SettingsMenuItem(
                        text: "Billing Details",
                        image: Assets.billing,
                        onTap: () {
                          // NavigatorUtils.navigateTosFavoriteScreen(context);
                        },
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
                         padding: const EdgeInsets.all(20.0),
                         child: InkWell(
                           onTap: () {
                            ctrl.logout();
                            NavigatorUtils.navigateTosplashScreen(context);
                          },
                           child: Row(
                                           children: [
                                             Image.asset(
                                               Assets.logout,
                                               width: 30.w,
                                             ),
                                             SizedBox(width: 16.w),
                                             SmallText(
                                               text: "LogOut",
                                               size: 20.sp,
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
