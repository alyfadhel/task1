import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final FormFieldValidator<String> validator;
  final double? radius;
  final Widget? prefix;
  String? label ;
  bool isPassword ;
  final Widget? suffix;
   MyTextFormField({
    required this.controller,
    required this.type,
    required this.validator,
    this.radius = 10.0,
    this.prefix,
    this.label= '',
    this.suffix,
    this.isPassword = false,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
        ),
        prefixIcon: prefix,
        label: Text(
          label!,
        ),
        suffixIcon: suffix,
      ),
    );
  }
}
