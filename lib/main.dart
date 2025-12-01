import 'package:carrental/controllers/patment_provider.dart';
import 'package:carrental/controllers/booking_provider.dart';
import 'package:carrental/controllers/favorite_provider.dart';
import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/firebase_options.dart';

import 'package:carrental/utils/stripe_payment/stripe_keys.dart';

import 'package:carrental/view/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:carrental/controllers/car_provider.dart';

void main() async {
  // ضمان تهيئة Flutter قبل أي استدعاء Firebase أو async
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
Stripe.publishableKey=ApiKeys.Publishablekey;
  // تشغيل التطبيق
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider<FavoriteProvider>(create: (context) => FavoriteProvider()),
        ChangeNotifierProvider<BookingProvider>(create: (context) => BookingProvider()),
        ChangeNotifierProvider<CarProvider>(create: (context) => CarProvider()),
                ChangeNotifierProvider<PaymentProvider>(create: (context) => PaymentProvider()),

        ChangeNotifierProvider<UserController>(
          create: (context) {
            final controller = UserController();
            controller.getinfo();
            return controller;
          },
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //home: FavoritesScreen(),
            home: child,
          );
        },
        child: SplashScreen(),
      ),
    );
  }
}
