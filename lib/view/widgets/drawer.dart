import 'dart:io';
import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/view/screens/aboutus.dart';
import 'package:carrental/view/screens/contactus.dart';
import 'package:carrental/view/screens/myprofile/profile.dart';
import 'package:flutter/material.dart';
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
          right: Radius.circular(30),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 220,
                child: UserAccountsDrawerHeader(
                   margin: EdgeInsets.only(bottom: 20, top: 0),
                  accountName: Text(userName),
                  accountEmail: Text(userModel?.email ?? ''),
                  currentAccountPicture:CircleAvatar(
                                        radius: 120,
                                        backgroundImage:
                                            (userModel!.image != null &&
                                                userModel.image!.isNotEmpty)
                                            ? FileImage(File(userModel.image!))
                                                  as ImageProvider
                                            : AssetImage(
                                                "assets/images/profileimag.png",
                                              ),
                                      ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                 
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                   Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Profilepage()),
          );
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Contact Us'),
                onTap: () {
   Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ContactUs()),
          );                },
              ),
              ListTile(
                leading: Icon(Icons.lightbulb),
                title: Text('About Us'),
                onTap: () {
                   Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => Aboutus()),
          );
                },
              ),
              Spacer(),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                 Provider.of<UserController>(context).logout();
                            NavigatorUtils.navigateTosplashScreen(context);
                },
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
