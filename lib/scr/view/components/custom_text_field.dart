import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final int lines;
  final void Function(String? text)? onSave;
  final String? Function(String? text)? validate;
  const CustomTextField(
      {Key? key,
      required this.label,
      this.lines = 1,
      this.onSave,
      this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: lines,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      onSaved: onSave,
      validator: validate,
    );
  }
}
