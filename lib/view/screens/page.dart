import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class page extends StatelessWidget {
  const page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: InkWell(
          onTap: () {
            Provider.of<UserController>(context, listen: false).logout();
            NavigatorUtils.navigateToLoginScreen(context);
          },
          child: BoldText(text: "logout",),
        ),
      ),
    );
  }
}
