import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WhatsAppNumberTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;

  const WhatsAppNumberTextFormField({
    super.key,
    required this.labelText,
    this.controller,
    this.maxLength,
    this.keyboardType,
    this.validator,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        validator: validator,
        keyboardType: keyboardType,
        maxLength: maxLength,
        controller: controller,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
          ),
          label: Text(labelText),
        ),
      ),
    );
  }
}
