import 'package:flutter/material.dart';

class SimpleTextEditor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;

  SimpleTextEditor(this.controller, this.label, this.hint, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(
            fontSize: 18.0
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          prefixIcon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}