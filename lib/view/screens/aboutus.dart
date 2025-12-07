import 'package:carrental/utils/constant/assets.dart';
import 'package:carrental/view/widgets/icons_widget.dart';
import 'package:carrental/view/widgets/text.dart';
import 'package:flutter/material.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(Assets.successfulScreen, fit: BoxFit.cover),
          ),
          Positioned(
            left: 10,
            top: 30,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: IconWidget(icon: Icons.arrow_back),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(22.0),
              child: Column(
                children: [
                  SizedBox(height: 160),
                  BoldText(text: "About Us", size: 40, color: Colors.white),
                  SizedBox(height: 50),
                  Container(
                    
                    child: Text(
                      "We provide a car rental service designed to make your travel easy and convenient. "
                      "You can rent vehicles for short or long periods according to your needs, "
                      "choosing from economy or luxury options. Our goal is to offer a flexible "
                      "and safe travel experience, complemented by premium services such as insurance and maintenance.",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
