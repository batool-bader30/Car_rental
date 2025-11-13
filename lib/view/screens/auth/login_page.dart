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

class SigninPage extends StatelessWidget {
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
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
                    padding: const EdgeInsets.all(20.0),
                    child: BoldText(
                      text: "Sign In",
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),

                  Container(
                    height: 530,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(201, 105, 104, 104),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SmallText(
                                  text: "E-mail",
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),

                            MyTextField(
                              controller: emailcontroller,
                              validator: ValidationsMetod.validateEmail,
                              labelText: "Enter Your Email",
                              prefixIcon: Icon(Icons.email_outlined),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: SmallText(
                                  text: "password",
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                            MyPasswordField(
                              prefixIcon: Icon(Icons.lock_outline),
                              controller: passwordcontroller,
                              validator: ValidationsMetod.validatePassword,
                              labelText: "Enter Your Password",
                            ),
                            InkWell(
                              onTap: () {
                                NavigatorUtils.navigateToResetScreen(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: SmallText(
                                    text: "Forgot Password?",
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30.sp),
                            Button(
                              title: "sign in",
                              ontap: () async {         
                                if (_formKey.currentState!.validate()) {
                                  bool success = await ctrl.login(
                                    emailcontroller.text,
                                    passwordcontroller.text,
                                  );

                                  if (success) {
                                    NavigatorUtils.navigateToHomeScreen(context);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Login failed'),
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
                                  text: "Don’t Have Any Account? ",
                                  color: Colors.white,
                                ),
                                InkWell(
                                  onTap: () {
                                    NavigatorUtils.navigateToSignUpsScreen(
                                      context,
                                    );
                                  },
                                  child: MediumText(
                                    text: "Sign up",
                                    color: const Color(0xFFEBB739),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30),
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
