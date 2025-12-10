import 'package:carrental/models/booking_model.dart';
import 'package:carrental/models/car_model.dart';
import 'package:carrental/view/screens/Payment/paymentMethod_screen.dart';
import 'package:carrental/view/screens/Payment/SuccessfulScreen.dart';
import 'package:carrental/view/screens/auth/login_page.dart';
import 'package:carrental/view/screens/auth/reset_pass.dart';
import 'package:carrental/view/screens/auth/signup_page.dart';
import 'package:carrental/view/screens/auth/user_info.dart';
import 'package:carrental/view/screens/date_time_screen.dart';
import 'package:carrental/view/screens/favorites_screen.dart';
import 'package:carrental/view/screens/home_screen.dart';
import 'package:carrental/view/screens/splash_screen.dart';

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
  static void navigateToPaymentmethodScreen(BuildContext context,BookingModel BookingModel) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PaymentmethodScreen(bookingModel: BookingModel,)),
  );
}
static void navigateTosuccesssfulScreen(BuildContext context,BookingModel BookingModel) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SuccessfulScreen(bookingModel: BookingModel,)),
  );
}

 
 
    static void navigateToHomeScreen(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  static void navigateToDateTimeScreen(BuildContext context,CarModel car) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DateTimeScreen(car:car)),
    );
  }
  
  static void navigateToFavoriteScreen(BuildContext context,CarModel car) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => FavoritesScreen()),
    );
  }
  
  
}
