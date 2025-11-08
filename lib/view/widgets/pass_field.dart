import 'package:flutter/material.dart';

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
    this.onChanged, this.prefixIcon,
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
        labelStyle: const TextStyle(color: Color.fromARGB(255, 112, 112, 112)),
        prefixIcon: widget.prefixIcon,
          prefixIconColor:  Color.fromARGB(255, 112, 112, 112),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(color: Color.fromARGB(106, 249, 249, 249)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(color: Color.fromARGB(106, 249, 249, 249)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
          borderSide: const BorderSide(color: Color.fromARGB(106, 249, 249, 249)),
        ),
        filled: true,
        fillColor: const Color.fromARGB(106, 249, 249, 249),
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: const Color.fromARGB(255, 112, 112, 112),
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ),
      validator: widget.validator,
    );
  }
}
