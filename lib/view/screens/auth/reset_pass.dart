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

class ResetPass extends StatelessWidget {
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
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(201, 105, 104, 104),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                SizedBox(height: 30),

                             Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: SmallText(
                                  text:"Reset password",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  size: 22,
                                ),
                              ),
                            ),
                            SizedBox(height: 100),

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: SmallText(
                                  text:"Enter your email to receive a password reset link.",
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
                           
                            SizedBox(height: 30.sp),
                            Button(
                              title: "send link",
                              ontap: () async {
                                if (_formKey.currentState!.validate()) {
                                  final result = await ctrl.sendPasswordReset(
                                    emailcontroller.text,
                                  );
                                  if (result==true) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "send successfully",
                                        ),
                                        backgroundColor: Color.fromARGB(255, 126, 126, 126),
                                        duration: Duration(seconds: 5),
                                      ),
                                    );
                                    NavigatorUtils.navigateToLoginScreen(
                                      context,
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          "email not found",
                                        ),
                                        backgroundColor: Colors.red,
                                        duration: Duration(seconds: 5),
                                      ),
                                    );
                                   
                                  }
                                }
                              },
                            ),

                            Spacer(),
                           
                                InkWell(
                                  onTap: () {
                                    NavigatorUtils.navigateToLoginScreen(
                                      context,
                                    );
                                  },
                                  child: MediumText(
                                    text: "back",
                                    color: const Color(0xFFEBB739),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                           
                            SizedBox(height: 30),
                          ],
                        ),
                      ),
                    ),
                 
              ),
            ],
          );
        },
      ),
    );
  }
}


