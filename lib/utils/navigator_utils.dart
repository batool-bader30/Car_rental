import 'package:carrental/models/car_model.dart';
import 'package:carrental/view/screens/auth/login_page.dart';
import 'package:carrental/view/screens/auth/reset_pass.dart';
import 'package:carrental/view/screens/auth/signup_page.dart';
import 'package:carrental/view/screens/auth/user_info.dart';
import 'package:carrental/view/screens/date_time_screen.dart';
import 'package:carrental/view/screens/home_screen.dart';
import 'package:carrental/view/screens/splash_screen.dart';
import 'package:carrental/view/screens/page.dart' as p;

import 'package:flutter/material.dart';

class NavigatorUtils {
  static void navigateToUserInfoScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => userinfo()),
    );
  }

  
   static void navigateTosplashScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SplashScreen()),
    );
  }
   static void navigateToLoginScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  SigninPage()),
    );
  }

  static void navigateToSignUpsScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => SignupPage()),
    );
  }
   static void navigateToResetScreen(BuildContext context) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => ResetPass()),
  );
}

   static void page(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => p.page()),
    );
  }
    static void navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  static void navigateToDateTimeScreen(BuildContext context,CarModel car) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => DateTimeScreen(car:car)),
    );
  }
  
  
}
