import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? prefixIcon;

  const MyPasswordField({
    super.key,
    this.controller,
    required this.labelText,
    this.borderRadius = 10,
    this.validator,
    this.onChanged,
    this.prefixIcon,
  });

  @override
  State<MyPasswordField> createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: const Color.fromARGB(255, 112, 112, 112),
          fontSize: 14.sp,
        ),
        prefixIcon: widget.prefixIcon,
        prefixIconColor: const Color.fromARGB(255, 112, 112, 112),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!.r),
          borderSide: const BorderSide(color: Color.fromARGB(106, 249, 249, 249)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!.r),
          borderSide: const BorderSide(color: Color.fromARGB(106, 249, 249, 249)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!.r),
          borderSide: const BorderSide(color: Color.fromARGB(106, 249, 249, 249)),
        ),
        filled: true,
        fillColor: const Color.fromARGB(106, 249, 249, 249),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: const Color.fromARGB(255, 112, 112, 112),
            size: 24.sp,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
      ),
      validator: widget.validator,
    );
  }
}
