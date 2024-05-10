import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType? keyboardType;
  final String? labelText;

  final bool? isSecure;
  final Function(String?)? onChanged;
  const CustomTextField(
      {this.keyboardType,
      this.isSecure,
      this.onChanged,
      super.key,
      required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: (data) {
          if (data!.isEmpty) {
            return "this field is required";
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
