import 'package:flutter/material.dart';

class ScreenInfo extends StatelessWidget {
  const ScreenInfo({super.key});

  @override
  Widget build(BuildContext context) {
    // جلب حجم الشاشة
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("Screen Info")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Screen Width: $width'),
            Text('Screen Height: $height'),
          ],
        ),
      ),
    );
  }
}
