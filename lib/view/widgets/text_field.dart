import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String labelText;
  final Widget? prefixIcon;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final Function(String)? onchanged;
final Widget? sufixicon;

  const MyTextField({
    super.key,
    this.controller,
    this.keyboardType,
    required this.labelText,
    this.prefixIcon,
    this.sufixicon,
    this.borderRadius = 10,
    this.validator, this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(),
      child: TextFormField(
        onChanged: onchanged,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
          prefixIcon: prefixIcon,
          prefixIconColor:  Color.fromARGB(255, 112, 112, 112),
          suffixIcon:sufixicon ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: Color.fromARGB(106, 249, 249, 249),),
          ),
          filled: true,
          fillColor: Color.fromARGB(106, 249, 249, 249),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color:Color.fromARGB(106, 249, 249, 249),),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color:Color.fromARGB(106, 249, 249, 249),),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
