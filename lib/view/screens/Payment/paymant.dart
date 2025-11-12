import 'package:carrental/controllers/patment_provider.dart';
import 'package:carrental/utils/constant/app_color.dart';
import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/view/screens/Payment/widget.dart';
import 'package:carrental/view/widgets/button.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymenScreen extends StatefulWidget {
  const PaymenScreen({super.key});

  @override
  State<PaymenScreen> createState() => _PaymenScreenState();
}

class _PaymenScreenState extends State<PaymenScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentProvider(),
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: IconWidget(icon: Icons.arrow_back),
                    ),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: IconWidget(icon: Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Align(
                  alignment: Alignment.topLeft,
                  child: SmallText(
                    text: "Add New Card",
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    size: 22,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(Assets.visa),
                                SizedBox(height: 20),

                PaymentMethodsScreen(),
                SizedBox(height: 50,),
                                SmallText(text: "Amount to pay: 2100JD ",size: 20,),

                Spacer(),
                Button(title: "Proceed to Payment", ontap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
