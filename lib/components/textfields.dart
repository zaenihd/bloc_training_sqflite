import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator? validator;

  const InputText(
      {super.key,
      required this.controller,
      required this.hintText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          labelText: hintText,
            hintText: hintText,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Colors.purple))
                ),
                
      ),
    );
  }
}
