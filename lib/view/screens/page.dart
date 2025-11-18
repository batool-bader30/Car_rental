import 'package:carrental/controllers/user_controller.dart';
import 'package:carrental/utils/navigator_utils.dart';
import 'package:carrental/utils/stripe_payment/payment_manage.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class page extends StatelessWidget {
  const page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
              onPressed: ()=>PaymentManager.makePayment(40, "EGP"), 
              child: Text("Pay 20 dollar"),
              ),
      )
    );
  }
}
