import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? labelText;
  final num min;
  final num max;

  final bool? isSecure;
  final Function(String?)? onChanged;
  const CustomTextField(
      {this.keyboardType,
      this.isSecure,
      this.onChanged,
      super.key,
      required this.labelText,
      this.min = 0,
      this.max = 10000});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: (data) {
          if (data!.isEmpty) {
            return "this field is required";
          } else if (num.parse(data) < min) {
            return "the value must be more than $min";
          } else if (num.parse(data) > max) {
            return "the value must be less than $max";
          } else {
            return null;
          }
        },
        onChanged: onChanged,
        decoration: InputDecoration(
            labelText: labelText,
            hintStyle: const TextStyle(color: Colors.black),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.black,
            ))),
      ),
    );
  }
}
