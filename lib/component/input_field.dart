import 'package:fen_ghadi/utilis/style.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final IconData leadingIcon;
  final String hintText;
  final bool isDiable;
  final TextInputType inputType;
  const InputField({
    super.key,
    required this.leadingIcon,
    required this.hintText,
    required this.isDiable,
    required this.inputType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: accent,
      readOnly: isDiable,
      keyboardType: inputType,
      style: p1,
      decoration: InputDecoration(
        prefixIcon: Icon(leadingIcon, size: 22, color: text),
        hintText: hintText,
        hintStyle: p1,
        fillColor: Colors.grey[100],
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: small),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
