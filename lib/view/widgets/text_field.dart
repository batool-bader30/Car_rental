import 'package:carrental/utils/constant/app_color.dart';
import 'package:carrental/utils/validations/exptions%20(1).dart';
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
            borderSide:  BorderSide(color:Color.fromARGB(106, 249, 249, 249),),
          ),
        ),
        validator: validator,
      ),
    );
  }
}


class TextField2 extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String labelText;
  final Widget? prefixIcon;
  final double? borderRadius;
  final String? Function(String?)? validator;
  final Function(String)? onchanged;
final Widget? sufixicon;

  const TextField2({
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
          labelStyle: TextStyle(color:Colors.grey,),
          prefixIcon: prefixIcon,
          prefixIconColor:  Colors.grey,
          suffixIcon:sufixicon ,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color: Color.fromARGB(255, 236, 234, 234),),
          ),
          filled: true,
          fillColor: Color.fromARGB(106, 242, 241, 241),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: const BorderSide(color:Color.fromARGB(255, 236, 234, 234),),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide:  BorderSide(color:Color.fromARGB(255, 236, 234, 234),),
          ),
        ),
        validator: validator,
      ),
    );
  }
}

class HourstTextField extends StatelessWidget {
  const HourstTextField({
    super.key,
    required this.hoursController,
  });

  final TextEditingController hoursController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: hoursController,
      keyboardType: TextInputType.number,
      style: TextStyle(color: AppColor.primary),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter number of hours";
        } else if (!RegExp(
          RegExption.onlyNumber,
        ).hasMatch(value)) {
          return "Numbers only";
        }
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.hourglass_empty,
          color: AppColor.primary,
        ),
        hintStyle: TextStyle(color: AppColor.primary),
        hintText: "Enter Hours",
        filled: true,
        fillColor: Colors.grey[900],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.amberAccent),
        ),
      ),
    );
  }
}

