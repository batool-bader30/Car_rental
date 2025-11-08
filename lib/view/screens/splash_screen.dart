import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/utils/constant/network_connection.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplash();
  }

  ///  هاي الدالة مسؤولة عن الفحص والتنقّل
  void startSplash() async {
    //  نتحقق من الاتصال بالإنترنت
    bool isConnected = await ConnectionsNetwork.isConnected();

    //  ننتظر 3 ثواني لعرض السبلاتش
    await Future.delayed(const Duration(seconds: 3));

    if (!isConnected) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("No internet connection")));
      return;
    }

      checkUserLoggedIn(context);
    }
  
  ///  التحقق من حالة تسجيل المستخدم
  Future<void> checkUserLoggedIn(context) async {
    final userinfocontroller = Provider.of<UserController>(
      context,
      listen: false,
    );

    final uid = await userinfocontroller.getUid();

    if (uid == null) {
      NavigatorUtils.navigateToSignUpsScreen(context);
    } else {
      NavigatorUtils.page(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox.expand(
        child: Image(image: AssetImage(Assets.splashimage), fit: BoxFit.cover),
      ),
    );
  
}
}