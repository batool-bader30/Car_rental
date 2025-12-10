import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/utils/validations/validations_metod%20(1).dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/pass_field.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:carrental/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
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
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(5.w),
                                child: SmallText(
                                  text: "E-mail",
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                            MyTextField(
                              controller: emailcontroller,
                              validator: ValidationsMetod.validateEmail,
                              labelText: "Enter Your Email",
                              prefixIcon: Icon(Icons.email_outlined, size: 24.sp),
                            ),
                            SizedBox(height: 10.h),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(5.w),
                                child: SmallText(
                                  text: "Password",
                                  color: Colors.white,
                                  size: 18.sp,
                                ),
                              ),
                            ),
                            MyPasswordField(
                              prefixIcon: Icon(Icons.lock_outline, size: 24.sp),
                              controller: passwordcontroller,
                              validator: ValidationsMetod.validatePassword,
                              labelText: "Enter Your Password",
                              borderRadius: 12.r,
                            ),
                            SizedBox(height: 30.h),
                            Button(
                              title: "Continue",
                              height: 50.h,
                              width: 330.w,
                              ontap: () async {
                                if (_formKey.currentState!.validate()) {
                                  final result = await ctrl.createUser(
                                    emailcontroller.text,
                                    passwordcontroller.text,
                                  );
                                  if (result == "") {
                                    NavigatorUtils.navigateToUserInfoScreen(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Username already exists"),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 5),
                                      ),
                                    );
                                  }
                                }
                              },
                            ),
                            Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SmallText(
                                  text: "Do you have an account? ",
                                  color: Colors.white,
                                  size: 16.sp,
                                ),
                                InkWell(
                                  onTap: () {
                                    NavigatorUtils.navigateToLoginScreen(context);
                                  },
                                  child: MediumText(
                                    text: "Sign In",
                                    color: const Color(0xFFEBB739),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
