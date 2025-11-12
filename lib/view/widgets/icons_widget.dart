import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  
  const IconWidget({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.4),
          width: 2,
        ),
        color: Colors.white.withValues(alpha: 0.4),
      ),
      child: Center(child: Icon(icon)),
    );
  }
}
