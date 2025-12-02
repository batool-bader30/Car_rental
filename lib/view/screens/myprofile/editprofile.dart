import 'dart:io';

import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/utils/validations/validations_metod%20(1).dart';
import 'package:carrental/view/screens/myprofile/profile_menu_item.dart';
import 'package:carrental/view/widgets/DropdownButton.dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:carrental/view/widgets/pass_field.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:carrental/view/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({super.key});

  @override
  State<Editprofile> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Editprofile> {
  late TextEditingController nameController;
  TextEditingController imagecontroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();

    final ctrl = Provider.of<UserController>(context, listen: false);
    ctrl.getinfo();
    final user = ctrl.userModel;
    if (user != null) {
      nameController.text = user.name!;
      phoneController.text = user.phoneNumber ?? "";
      genderController.text = user.gender ?? "";
      imagecontroller.text = user.image ?? "";
    }
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
              Positioned(
                left: 10,
                top: 30,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: IconWidget(icon: Icons.arrow_back),
                ),
              ),

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
                      padding: const EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SmallText(
                                text: 'Edit Profile',
                                size: 24.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Stack(
                              children: [
                                Container(
                                  width: 100.sp,
                                  height: 100.sp,
                                  padding: EdgeInsets.all(4.sp), // سمك الإطار
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
                                    padding: EdgeInsets.all(3.sp), // سمك الإطار
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: CircleAvatar(
                                      radius: 40.sp,
                                      backgroundImage:
                                          (myuser.image != null &&
                                              myuser.image!.isNotEmpty)
                                          ? FileImage(File(myuser.image!))
                                                as ImageProvider
                                          : AssetImage(
                                              "assets/images/profileimag.png",
                                            ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 7.sp,
                                  right: 5.sp,
                                  child: GestureDetector(
                                    onTap: () async {
                                      await ctrl.pickImageAndSave();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(6.w),
                                      decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.camera_alt_sharp,
                                        color: Colors.white,
                                        size: 18.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 5.h),

                            // الاسم
                            SmallText(
                              text: myuser.name!,
                              size: 24.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),

                            // رقم الهاتف
                            SmallText(
                              text: myuser.email!,
                              size: 14.sp,
                              color: Colors.black,
                            ),

                            SizedBox(height: 40.sp),

                            TextField2(
                              labelText: "Name",
                              controller: nameController,
                              validator: ValidationsMetod.validateName,
                            ),
                            SizedBox(height: 18.h),

                            TextField2(
                              labelText: "Phone Number",
                              controller: phoneController,
                              validator: ValidationsMetod.validatePhoneNumber,
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(height: 18.h),

                            Dropdown_Field(
                              labelText: "Gender",
                              items: ['Male', 'Female'],
                              controller: genderController,
                            ),
                            SizedBox(height: 20.sp),

                            Button(
                              title: "save",
                              ontap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await ctrl.saveUserData(
                                    name: nameController.text.trim(),
                                    phoneNumber: phoneController.text.trim(),
                                    image: imagecontroller.text.trim(),
                                    gender: genderController.text.trim(),
                                  );
                                  Navigator.pop(context);
                                }
                              },
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
