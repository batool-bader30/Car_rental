import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/utils/validations/validations_metod%20(1).dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:carrental/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class userinfo extends StatelessWidget {
  userinfo({super.key});

  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer<UserController>(
        builder: (context, ctrl, child) {
          return Stack(
            children: [
              Image.asset(Assets.backgroungimage, fit: BoxFit.fill),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(20.w),
                    child: BoldText(
                      text: "Sign Up",
                      size: 30.sp,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 530.h,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(201, 105, 104, 104),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(25.w),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20.h),
                            Padding(
                              padding: EdgeInsets.all(5.w),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SmallText(
                                  text: "user name",
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                            MyTextField(
                              controller: namecontroller,
                              validator: ValidationsMetod.validateName,
                              labelText: "Enter Your Name",
                              prefixIcon: Icon(Icons.person_outlined, size: 24.sp),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: EdgeInsets.all(5.w),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SmallText(
                                  text: "phone number",
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                            MyTextField(
                              keyboardType: TextInputType.phone,
                              controller: phonecontroller,
                              validator: ValidationsMetod.validatePhoneNumber,
                              labelText: "Enter Your Phone Number",
                              prefixIcon: Icon(Icons.call, size: 24.sp),
                            ),
                            SizedBox(height: 30.h),
                            Button(
                              title: "sign up",
                              height: 50.h,
                              width: 330.w,
                              ontap: () {
                                if (_formKey.currentState!.validate()) {
                                  ctrl.saveUserData(
                                    name: namecontroller.text,
                                    phoneNumber: phonecontroller.text,
                                  );
                                  NavigatorUtils.navigateToHomeScreen(context);
                                }
                              },
                            ),
                            Spacer(),
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  NavigatorUtils.navigateToHomeScreen(context);
                                },
                                child: MediumText(
                                  text: "skip ",
                                  color: const Color(0xFFEBB739),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
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
